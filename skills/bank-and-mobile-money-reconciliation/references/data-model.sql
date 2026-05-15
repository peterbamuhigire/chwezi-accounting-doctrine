-- Bank and mobile-money reconciliation data model.
-- Types may be implemented as enums, lookup tables, or constrained text per target database.

CREATE TABLE reconciliation_imports (
  id BIGINT PRIMARY KEY,
  source_type VARCHAR(40) NOT NULL,
  provider_name VARCHAR(120) NOT NULL,
  account_code VARCHAR(20) NOT NULL,
  external_account_id VARCHAR(120) NOT NULL,
  period_start DATE NOT NULL,
  period_end DATE NOT NULL,
  retrieved_at TIMESTAMP NOT NULL,
  retrieved_by BIGINT NOT NULL,
  exported_at TIMESTAMP NULL,
  parser_version VARCHAR(40) NOT NULL,
  file_checksum_sha256 CHAR(64) NOT NULL,
  archive_path TEXT NOT NULL,
  state VARCHAR(30) NOT NULL,
  supersedes_import_id BIGINT NULL,
  created_at TIMESTAMP NOT NULL,
  CONSTRAINT uq_reconciliation_import_checksum UNIQUE (file_checksum_sha256)
);

CREATE TABLE reconciliation_lines (
  id BIGINT PRIMARY KEY,
  import_id BIGINT NOT NULL REFERENCES reconciliation_imports(id),
  external_id VARCHAR(160) NULL,
  external_ref VARCHAR(160) NULL,
  posted_at TIMESTAMP NULL,
  value_at TIMESTAMP NOT NULL,
  amount NUMERIC(20,4) NOT NULL,
  currency CHAR(3) NOT NULL,
  description TEXT NOT NULL,
  counterparty VARCHAR(200) NULL,
  raw_payload JSON NULL,
  match_state VARCHAR(30) NOT NULL,
  exception_reason VARCHAR(120) NULL,
  age_days INT NOT NULL DEFAULT 0,
  assignee BIGINT NULL,
  created_at TIMESTAMP NOT NULL
);

CREATE TABLE reconciliation_matches (
  id BIGINT PRIMARY KEY,
  reconciliation_line_id BIGINT NOT NULL REFERENCES reconciliation_lines(id),
  journal_line_id BIGINT NOT NULL,
  rule_id VARCHAR(20) NOT NULL,
  confidence VARCHAR(20) NOT NULL,
  tolerance_amount NUMERIC(20,4) NOT NULL DEFAULT 0,
  tolerance_days INT NOT NULL DEFAULT 0,
  matched_by BIGINT NULL,
  matched_at TIMESTAMP NOT NULL,
  match_state VARCHAR(30) NOT NULL,
  unmatched_residual NUMERIC(20,4) NOT NULL DEFAULT 0
);

CREATE TABLE reconciliation_posting_commands (
  id BIGINT PRIMARY KEY,
  reconciliation_line_id BIGINT NOT NULL REFERENCES reconciliation_lines(id),
  command_type VARCHAR(60) NOT NULL,
  payload JSON NOT NULL,
  maker BIGINT NOT NULL,
  checker BIGINT NULL,
  state VARCHAR(30) NOT NULL,
  posted_journal_id BIGINT NULL,
  created_at TIMESTAMP NOT NULL,
  approved_at TIMESTAMP NULL
);

CREATE TABLE reconciliation_signoff (
  id BIGINT PRIMARY KEY,
  import_id BIGINT NOT NULL REFERENCES reconciliation_imports(id),
  preparer BIGINT NOT NULL,
  preparer_signed_at TIMESTAMP NOT NULL,
  reviewer BIGINT NULL,
  reviewer_signed_at TIMESTAMP NULL,
  release_state VARCHAR(30) NOT NULL,
  caveats JSON NOT NULL,
  evidence_pack_path TEXT NOT NULL
);

CREATE INDEX ix_reconciliation_lines_import ON reconciliation_lines(import_id);
CREATE INDEX ix_reconciliation_lines_state ON reconciliation_lines(match_state);
CREATE INDEX ix_reconciliation_lines_value ON reconciliation_lines(value_at, amount, currency);
CREATE INDEX ix_reconciliation_matches_line ON reconciliation_matches(reconciliation_line_id);
