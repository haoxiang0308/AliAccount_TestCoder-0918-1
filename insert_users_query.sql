INSERT INTO users (id, username, email, password_hash, created_at) 
VALUES 
(1, 'john_doe', 'john@example.com', 'hashed_password_1', CURRENT_TIMESTAMP),
(2, 'jane_smith', 'jane@example.com', 'hashed_password_2', CURRENT_TIMESTAMP),
(3, 'bob_wilson', 'bob@example.com', 'hashed_password_3', CURRENT_TIMESTAMP);