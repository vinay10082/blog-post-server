-- liquibase formatted sql

-- changeset vinaykc:1
CREATE TABLE IF NOT EXISTS sample_post (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT
);
