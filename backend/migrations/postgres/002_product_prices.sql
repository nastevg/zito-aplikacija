CREATE TABLE IF NOT EXISTS product_prices (
  barcode TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  price TEXT NOT NULL,
  currency TEXT NOT NULL DEFAULT 'MKD',
  unit TEXT NOT NULL DEFAULT '',
  updated_at TEXT NOT NULL
);

INSERT INTO product_prices (barcode, name, price, currency, unit, updated_at)
VALUES ('5310000000001', 'Млеко 2.8%', '79', 'MKD', 'парче', NOW()::text)
ON CONFLICT (barcode) DO NOTHING;
INSERT INTO product_prices (barcode, name, price, currency, unit, updated_at)
VALUES ('5310000000002', 'Јогурт 1кг', '92', 'MKD', 'парче', NOW()::text)
ON CONFLICT (barcode) DO NOTHING;
INSERT INTO product_prices (barcode, name, price, currency, unit, updated_at)
VALUES ('5310000000003', 'Леб бел', '38', 'MKD', 'парче', NOW()::text)
ON CONFLICT (barcode) DO NOTHING;
INSERT INTO product_prices (barcode, name, price, currency, unit, updated_at)
VALUES ('5310000000004', 'Масло 1л', '115', 'MKD', 'парче', NOW()::text)
ON CONFLICT (barcode) DO NOTHING;
INSERT INTO product_prices (barcode, name, price, currency, unit, updated_at)
VALUES ('5310000000005', 'Ориз 900г', '84', 'MKD', 'парче', NOW()::text)
ON CONFLICT (barcode) DO NOTHING;
