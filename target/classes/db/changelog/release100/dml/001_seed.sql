-- liquibase formatted sql

-- changeset vinaykc:2
INSERT INTO users (username, password, email)
VALUES ('seed', '__seed__', 'seed@example.com')
ON CONFLICT DO NOTHING;

INSERT INTO sample_post (title, content, author_id)
VALUES ('First Post', 'This is the first post created by liquibase.', (SELECT id FROM users WHERE username = 'seed'));
