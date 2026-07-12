-- liquibase formatted sql

-- changeset vinaykc:1
CREATE SCHEMA IF NOT EXISTS core;
CREATE TABLE IF NOT EXISTS core.sample_post (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT
);
