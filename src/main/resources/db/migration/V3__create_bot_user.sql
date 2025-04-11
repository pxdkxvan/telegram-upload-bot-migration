CREATE TABLE IF NOT EXISTS bot_user (
    id BIGSERIAL PRIMARY KEY,
    telegram_id BIGINT NOT NULL UNIQUE,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    verified BOOLEAN NOT NULL DEFAULT false,
    authorized BOOLEAN NOT NULL DEFAULT false,
    first_login TIMESTAMPTZ DEFAULT current_timestamp
);
