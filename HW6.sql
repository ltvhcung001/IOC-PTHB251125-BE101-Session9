CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price NUMERIC,
    category_id INT
);

INSERT INTO Products (name, price, category_id) VALUES 
('iPhone 15', 1000.00, 1),  
('Samsung S24', 900.00, 1),    
('MacBook Pro', 2000.00, 2),    
('Dell XPS', 1800.00, 2);       

-- 1. Tạo Procedure update_product_price(p_category_id INT, p_increase_percent NUMERIC) để tăng giá tất cả sản phẩm trong một category_id theo phần trăm
-- 2. Sử dụng biến để tính giá mới cho từng sản phẩm trong vòng lặp
CREATE OR REPLACE PROCEDURE update_product_price(p_category_id INT, p_increase_percent NUMERIC)
LANGUAGE plpgsql
AS $$
DECLARE
    rec RECORD;             
    v_new_price NUMERIC;    
BEGIN
    FOR rec IN 
        SELECT product_id, price 
        FROM Products 
        WHERE category_id = p_category_id
    LOOP
        v_new_price := rec.price * (1 + p_increase_percent / 100);

        UPDATE Products 
        SET price = v_new_price 
        WHERE product_id = rec.product_id;
        
        RAISE NOTICE 'Sản phẩm ID %: Giá cũ = %, Giá mới = %', rec.product_id, rec.price, v_new_price;
    END LOOP;
END;
$$;

-- 3. Thử gọi Procedure với các tham số mẫu và kiểm tra kết quả trong bảng Products
-- Gọi thủ tục: Tăng giá Category 1 thêm 10%
CALL update_product_price(1, 10);

SELECT * FROM Products;









-- 3. Thử gọi Procedure với các tham số mẫu và kiểm tra kết quả trong bảng Products
