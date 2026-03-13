CREATE TABLE IF NOT EXISTS vouchers (
  id TEXT PRIMARY KEY,
  barcode TEXT NOT NULL UNIQUE,
  amount NUMERIC NOT NULL,
  currency TEXT NOT NULL DEFAULT 'MKD',
  status TEXT NOT NULL DEFAULT 'free',
  source_file TEXT NOT NULL DEFAULT '',
  import_batch_id TEXT NOT NULL DEFAULT '',
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS voucher_assignments (
  id TEXT PRIMARY KEY,
  voucher_id TEXT NOT NULL,
  user_id TEXT,
  card_number TEXT,
  assignment_type TEXT NOT NULL,
  amount_snapshot NUMERIC NOT NULL,
  assigned_by TEXT NOT NULL,
  assigned_at TEXT NOT NULL,
  valid_from TEXT,
  expires_at TEXT,
  used_at TEXT,
  used_reference TEXT,
  status TEXT NOT NULL DEFAULT 'active',
  UNIQUE(voucher_id),
  FOREIGN KEY (voucher_id) REFERENCES vouchers(id)
);

CREATE TABLE IF NOT EXISTS voucher_rules (
  key TEXT PRIMARY KEY,
  value_text TEXT NOT NULL,
  updated_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS voucher_events (
  id TEXT PRIMARY KEY,
  voucher_id TEXT NOT NULL,
  assignment_id TEXT,
  event_type TEXT NOT NULL,
  actor_type TEXT NOT NULL,
  actor_id TEXT NOT NULL,
  meta_json TEXT NOT NULL DEFAULT '{}',
  created_at TEXT NOT NULL,
  FOREIGN KEY (voucher_id) REFERENCES vouchers(id)
);
