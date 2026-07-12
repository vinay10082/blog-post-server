-- liquibase formatted sql

-- changeset vinaykc:3
CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- changeset vinaykc:4
-- Add author_id to sample_post
-- We need to add the column, but wait, existing rows need a default value if not null. 
-- Since it's a dev environment, let's just add the column and set a default, or empty the table.
TRUNCATE TABLE sample_post CASCADE;

ALTER TABLE sample_post ADD COLUMN author_id BIGINT NOT NULL;
ALTER TABLE sample_post ADD CONSTRAINT fk_sample_post_users FOREIGN KEY (author_id) REFERENCES users(id);
