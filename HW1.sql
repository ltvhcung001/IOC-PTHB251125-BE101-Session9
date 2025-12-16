CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);
-- 2a. Thực hiện truy vấn SELECT * FROM Orders WHERE customer_id = X; trước khi tạo Index
SELECT * FROM Orders WHERE customer_id = 100;

-- 1. Tạo một B-Tree Index trên cột customer_id
CREATE INDEX idx_customer_id ON Orders(customer_id);

-- 2b. Thực hiện truy vấn SELECT * FROM Orders WHERE customer_id = X; sau khi tạo Index, so sánh thời gian thực hiện
SELECT * FROM Orders WHERE customer_id = 100;
