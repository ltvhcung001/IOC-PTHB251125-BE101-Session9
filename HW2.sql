CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    email VARCHAR(255),
    username VARCHAR(100)
);

INSERT INTO Users (user_id, email, username) VALUES 
(1, 'nguyenvana@gmail.com', 'nguyenvana'),
(2, 'tranvanb@outlook.com', 'tranvanb'),
(3, 'phanthic@gmail.com', 'phanthic'), 
(4, 'tranthid@test.com', 'tranthid');

-- 1. Tạo Hash Index trên cột email
CREATE INDEX idx_hash_email ON Users USING HASH (email);

-- 2. Viết truy vấn SELECT * FROM Users WHERE email = 'example@example.com'; và kiểm tra kế hoạch thực hiện bằng EXPLAIN
EXPLAIN SELECT * FROM Users WHERE email = 'tranthid@test.com';
EXPLAIN SELECT * FROM Users WHERE email = 'example@example.com';
