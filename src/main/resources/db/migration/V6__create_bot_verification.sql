CREATE TABLE IF NOT EXISTS bot_verification (
    id BIGSERIAL PRIMARY KEY,
    token UUID NOT NULL UNIQUE DEFAULT gen_random_uuid(),
    bot_user_id INTEGER NOT NULL REFERENCES bot_user(id) ON DELETE CASCADE
);