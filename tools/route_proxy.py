"""Tier-2 lexical routing proxy over this engine's skill descriptions.

This is a regression check, not a router. It ranks the 108 skills for a query
with TF-IDF over each skill's name and frontmatter description, so a
description edit that stops a labelled query reaching its skill is caught
without a model call. A first-place result here does not prove that a host
model would load the skill, and a miss here is not by itself a routing defect;
live routing and precision@1 stay NOT_ASSESSED until a model-based evaluation
is authorised.

The tokeniser and TF-IDF scheme follow the portfolio's shared lexical routing
index in outline (stop words, light stemming, name weighted twice); this is an
independent implementation with an engine-local IDF, so scores differ from it.

The tool never writes and never reaches the network.

Usage:
    python tools/route_proxy.py "query text" [--top 3]
"""
from __future__ import annotations

import argparse
import math
import re
import sys
from collections import Counter
from pathlib import Path

import yaml

REPO_ROOT = Path(__file__).resolve().parents[1]
FRONTMATTER = re.compile(r"^﻿?---\r?\n(.*?)\r?\n---\r?\n?", re.DOTALL)
STOP_WORDS = frozenset(
    "the and for with that this from into when use used using your you are was were will can "
    "has have not but all any its our their them then than also each how what which who need "
    "help want skill skills engine chwezi".split())


def stem(token: str) -> str:
    for suffix in ("ally", "ing", "ed", "es", "al"):
        if token.endswith(suffix) and len(token) > len(suffix) + 3:
            token = token[: -len(suffix)]
            break
    if token.endswith("s") and not token.endswith("ss") and len(token) > 3:
        token = token[:-1]
    if token.endswith("e") and len(token) > 4:
        token = token[:-1]
    return token


def tokenize(text: str) -> list[str]:
    words = re.sub(r"[^a-z0-9\s-]", " ", text.lower())
    return [stem(w) for w in re.split(r"[\s-]+", words) if len(w) > 2 and w not in STOP_WORDS]


def load_skills(repo_root: Path = REPO_ROOT) -> dict[str, str]:
    """Map skill name to description, read from skills/**/SKILL.md frontmatter."""
    skills = {}
    for path in sorted((Path(repo_root) / "skills").glob("*/*/SKILL.md")):
        match = FRONTMATTER.match(path.read_text(encoding="utf-8-sig"))
        meta = yaml.safe_load(match.group(1)) if match else None
        if not isinstance(meta, dict) or not meta.get("description"):
            raise ValueError(f"{path}: frontmatter has no description")
        skills[str(meta.get("name") or path.parent.name)] = " ".join(str(meta["description"]).split())
    return skills


class Index:
    def __init__(self, skills: dict[str, str]):
        counts = {name: Counter(tokenize(name) * 2 + tokenize(desc)) for name, desc in skills.items()}
        document_frequency = Counter()
        for value in counts.values():
            document_frequency.update(value.keys())
        n = len(skills)
        self.n = n
        self.idf = {t: math.log(1 + n / (1 + f)) for t, f in document_frequency.items()}
        self.vectors = {name: self._unit(self._weigh(value)) for name, value in counts.items()}

    def _weigh(self, counts: Counter) -> dict[str, float]:
        unseen = math.log(1 + self.n)
        return {t: c * self.idf.get(t, unseen) for t, c in counts.items()}

    @staticmethod
    def _unit(vector: dict[str, float]) -> dict[str, float]:
        norm = math.sqrt(sum(v * v for v in vector.values()))
        return {t: v / norm for t, v in vector.items()} if norm else {}

    def rank(self, query: str) -> list[tuple[str, float]]:
        q = self._unit(self._weigh(Counter(tokenize(query))))
        scored = [(name, sum(w * vec.get(t, 0.0) for t, w in q.items())) for name, vec in self.vectors.items()]
        return sorted(scored, key=lambda item: (-item[1], item[0]))


# A first-place win by less than this cosine margin is treated as a fragile route.
# Observed by experiment on this engine (a thin 0.005 miss was the case that
# prompted it); it is a regression guard, not a published standard.
MIN_MARGIN = 0.05


def evaluate(cases, index: Index, min_margin: float = MIN_MARGIN) -> list[dict]:
    """Rank every labelled case; ok means expected skill is first by min_margin."""
    results = []
    for case in cases:
        ranking = index.rank(case["query"])
        scores = dict(ranking)
        top_name, top_score = ranking[0]
        if top_name == case["expected_skill"]:
            margin = top_score - ranking[1][1]
        else:
            margin = scores.get(case["expected_skill"], 0.0) - top_score
        results.append({"id": case["id"], "label": case["label"], "expected": case["expected_skill"],
                        "top": top_name, "margin": round(margin, 3),
                        "ok": top_name == case["expected_skill"] and margin >= min_margin})
    return results


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    parser.add_argument("query", nargs="?", help="rank this query")
    parser.add_argument("--top", type=int, default=3)
    parser.add_argument("--fixture", type=Path, help="evaluate a fixture JSON of labelled cases")
    args = parser.parse_args(argv)
    index = Index(load_skills())
    if args.fixture:
        import json
        results = evaluate(json.loads(args.fixture.read_text(encoding="utf-8"))["cases"], index)
        for r in results:
            print(f"{'ok  ' if r['ok'] else 'FAIL'} {r['margin']:+.3f}  {r['id']}  (expected {r['expected']}, top {r['top']})")
        return 0 if all(r["ok"] for r in results) else 1
    if not args.query:
        parser.error("give a query or --fixture")
    for name, score in index.rank(args.query)[: args.top]:
        print(f"{score:.3f}  {name}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
