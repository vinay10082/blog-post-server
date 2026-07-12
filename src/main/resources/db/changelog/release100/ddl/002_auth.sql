-- liquibase formatted sql

-- changeset vinaykc:3
CREATE TABLE IF NOT EXISTS core.users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- changeset vinaykc:4
-- Add author_id to sample_post
-- We need to add the column, but wait, existing rows need a default value if not null. 
-- Since it's a dev environment, let's just add the column and set a default, or empty the table.
ALTER TABLE core.sample_post ADD COLUMN IF NOT EXISTS author_id BIGINT;
ALTER TABLE core.sample_post DROP CONSTRAINT IF EXISTS fk_sample_post_users;
ALTER TABLE core.sample_post ADD CONSTRAINT fk_sample_post_users FOREIGN KEY (author_id) REFERENCES core.users(id);
