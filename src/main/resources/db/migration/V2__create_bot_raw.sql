CREATE TABLE IF NOT EXISTS bot_raw (
    id BIGSERIAL PRIMARY KEY,
    raw JSONB NOT NULL
);
