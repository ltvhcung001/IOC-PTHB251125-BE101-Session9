CREATE TABLE Sales (
    sale_id SERIAL PRIMARY KEY,
    customer_id INT,
    amount NUMERIC,
    sale_date DATE
);

INSERT INTO Sales (customer_id, amount, sale_date) VALUES 
(101, 500.00, '2023-10-01'),
(102, 300.50, '2023-10-15'),
(103, 150.00, '2023-10-20'),
(104, 1200.00, '2023-11-05');

-- 1. Tạo Procedure calculate_total_sales(start_date DATE, end_date DATE, OUT total NUMERIC) để tính tổng amount trong khoảng start_date đến end_date
CREATE OR REPLACE PROCEDURE calculate_total_sales(p_start_date DATE, p_end_date DATE, OUT total NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT COALESCE(SUM(amount), 0)
    INTO total
    FROM Sales
    WHERE sale_date BETWEEN p_start_date AND p_end_date;
END;
$$;

-- 2. Gọi Procedure với các ngày mẫu và hiển thị kết quả
DO $$
DECLARE
    result NUMERIC;
BEGIN
    CALL calculate_total_sales('2023-10-01', '2023-10-31', result);
    RAISE NOTICE 'Tổng doanh thu là: %', result;
END;
$$;
