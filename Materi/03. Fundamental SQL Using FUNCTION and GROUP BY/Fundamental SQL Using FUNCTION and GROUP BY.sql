-- Fungsi Skalar Matematika
-- ABS()
SELECT StudentID, FirstName, LastName, Semester1, Semester2, ABS(MarkGrowth) AS MarkGrowth 
FROM students;

-- CEILING()
SELECT StudentID, FirstName, LastName, CEILING(Semester1) AS Semester1, CEILING(Semester2) AS Semester2, MarkGrowth 
FROM students;

-- FLOOR()
SELECT StudentID, FirstName, LastName, FLOOR(Semester1) AS Semester1, FLOOR(Semester2) AS Semester2, MarkGrowth 
FROM students;

-- ROUND()
SELECT StudentID, FirstName, LastName, round(Semester1,1) AS Semester1, round(Semester1,0) AS Semester2, MarkGrowth 
FROM students;

-- SQRT()
SELECT StudentID, FirstName, LastName, SQRT(Semester1) AS Semester1, Semester2, MarkGrowth 
FROM students;

-- Tugas Praktek -> Menggunakan fungsi MOD() dan EXP()
SELECT StudentID, FirstName, LastName, MOD(Semester1,2) AS Semester1, Semester2, EXP(MarkGrowth)
FROM students;

-- CONCAT()
SELECT StudentID, CONCAT(FirstName, LastName) AS Name, Semester1, Semester2, MarkGrowth 
FROM students;

-- SUBSTRING_INDEX( )
SELECT StudentID, SUBSTRING_INDEX(Email, '@', 1) AS Name 
FROM students;

-- SUBSTR( )
SELECT StudentID, SUBSTR(FirstName, 2, 3) AS Initial 
FROM students;

-- LENGTH( )
SELECT StudentID, FirstName, LENGTH(FirstName) AS Total_Char
FROM students;

-- REPLACE( )
SELECT StudentID, Email, REPLACE(Email, 'yahoo', 'gmail') AS New_Email 
FROM students;

-- Tugas Praktek -> Menggunakan fungsi UPPER() dan LOWER()
SELECT StudentID, UPPER(FirstName) AS FirstName, LOWER(LastName) AS LastName 
FROM students;

-- Fungsi Aggregate
-- SUM()
SELECT SUM(semester1) AS Total_1, SUM(Semester2) AS Total_2 
FROM students;

-- COUNT()
SELECT COUNT(FirstName) AS Total_Student 
FROM students;		

-- AVG( )
SELECT AVG(Semester1) AS Avg_1, AVG(Semester2) AS Avg_2 
FROM students;

-- Tugas Praktek -> Menggunakan fungsi MAX() dan MIN()
SELECT MIN(Semester1) AS Min1, MAX(Semester1) AS Max1, MIN(Semester2) AS Min2, MAX(Semester2) AS Max2 
FROM students;

-- Group By Single Column
SELECT province, COUNT(DISTINCT order_id) AS total_order, SUM(item_price) AS total_price 
FROM sales_retail_2019 
GROUP BY province;

-- GROUP BY Multiple Column
SELECT province, brand, COUNT(DISTINCT order_id) AS total_order, SUM(item_price) AS total_price 
FROM sales_retail_2019 
GROUP BY province, brand;

-- Fungsi Aggregate dengan Grouping
SELECT province, COUNT(DISTINCT order_id) AS total_unique_order, SUM(item_price) AS revenue 
FROM sales_retail_2019 
GROUP BY province;

-- Tugas Praktek
SELECT MONTH(order_date) AS order_month, SUM(item_price) AS total_price, 
CASE  
    WHEN SUM(item_price) >= 30000000000 THEN 'Target Achieved'
    WHEN SUM(item_price) <= 25000000000 THEN 'Less Performed'
    ELSE 'Follow Up'
END AS remark
FROM sales_retail_2019
GROUP BY MONTH(order_date);

-- Mini Project -> Proyek Pekerjaan - Analisis Penjualan
-- 1. Total jumlah seluruh penjualan (total/revenue).
SELECT 	SUM(total) AS total 
FROM tr_penjualan;
-- 2. Total quantity seluruh produk yang terjual.
SELECT SUM(qty) AS qty 
FROM tr_penjualan;
-- 3. Total quantity dan total revenue untuk setiap kode produk.
SELECT kode_produk, SUM(qty) AS qty, SUM(total) AS total 
FROM tr_penjualan
GROUP BY kode_produk;
-- 4. Rata - Rata total belanja per kode pelanggan.
SELECT kode_pelanggan, AVG(total) AS avg_total 
FROM tr_penjualan
GROUP BY kode_pelanggan;
/* 5. Menambahkan kolom baru dengan nama ‘kategori’ yang mengkategorikan total/revenue ke dalam 
	  3 kategori: High: > 300K; Medium: 100K - 300K; Low: <100K. */
SELECT kode_transaksi, kode_pelanggan, no_urut, kode_produk, nama_produk, qty, total,
CASE  
    WHEN total > 300000 THEN 'High'
    WHEN total < 100000 THEN 'Low'   
    ELSE 'Medium'  
END AS kategori 
FROM tr_penjualan;