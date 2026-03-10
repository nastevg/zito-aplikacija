ALTER TABLE notifications ADD COLUMN kind TEXT NOT NULL DEFAULT 'text';
ALTER TABLE notifications ADD COLUMN media_url TEXT NOT NULL DEFAULT '';
ALTER TABLE notifications ADD COLUMN thumbnail_url TEXT NOT NULL DEFAULT '';
