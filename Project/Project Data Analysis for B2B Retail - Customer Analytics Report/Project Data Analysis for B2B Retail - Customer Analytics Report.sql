-- Memahami table
SELECT * FROM orders_1 limit 5;
SELECT * FROM orders_2 limit 5;
SELECT * FROM customer limit 5;

-- Total Penjualan dan Revenue pada Quarter-1 (Jan, Feb, Mar) dan Quarter-2 (Apr,Mei,Jun)
SELECT
	sum(quantity) AS total_penjualan,
	sum(quantity*priceEach) AS revenue
FROM orders_1;

SELECT
	sum(quantity) AS total_penjualan,
	sum(quantity*priceEach) AS revenue
FROM orders_2
WHERE
	status = 'Shipped';

-- Menghitung persentasi keseluruhan penjualan
SELECT
	quarter,
	sum(quantity) AS total_penjualan,
	sum(quantity*priceEach) AS revenue
FROM 
	(
		SELECT
			orderNumber,
			status,
			quantity,
			priceEach,
			1 AS quarter
		FROM orders_1
		UNION
		SELECT
			orderNumber,
			status,
			quantity,
			priceEach,
			2 AS quarter
		FROM orders_2
	)
AS table_a
WHERE
	status = 'Shipped'
GROUP BY quarter;

-- Apakah jumlah customers xyz.com semakin bertambah?
SELECT 
	DISTINCT quarter,
	count(quarter) AS total_customers
FROM
	(
	  	SELECT
			customerID,
			createDate,
			quarter(createDate) AS quarter
		FROM 
			customer
		WHERE 
	  		'2004-01-01' < createDate < '2004-06-30'
	)
AS
	tabel_b
GROUP BY quarter;
    
-- Seberapa banyak customers tersebut yang sudah melakukan transaksi?
SELECT
	quarter,
	count(quarter) AS total_customers
FROM
	(
	  	SELECT
			customerID,
			createDate,
			quarter(createDate) AS quarter
		FROM customer
		WHERE '2004-01-01' < createDate < '2004-06-30'
	)
AS tabel_b
WHERE
	customerID 
	IN 
	(
	  SELECT DISTINCT customerID
	  FROM orders_1
	  UNION
	  SELECT DISTINCT customerID
	  FROM orders_2
	)
GROUP BY quarter;

-- Category produk apa saja yang paling banyak di-order oleh customers di Quarter-2?
SELECT *
FROM 
(
	SELECT 
		categoryID, 
		COUNT(DISTINCT orderNumber) AS total_order,
		SUM(quantity) AS total_penjualan
	FROM 
    (
		SELECT 
			productCode, 
			orderNumber, 
            quantity, 
            status,
			LEFT(productCode, 3) AS categoryID
		FROM orders_2
		WHERE status = "Shipped"
	) tabel_c
	GROUP BY categoryID
) sub
ORDER BY total_order DESC;

-- Seberapa banyak customers yang tetap aktif bertransaksi setelah transaksi pertamanya?
SELECT count(DISTINCT customerID) AS total_customers FROM orders_1;

SELECT
	1 AS quarter,
	COUNT(DISTINCT customerID)*100/25 AS q2
FROM
	orders_1
WHERE customerID IN (
	SELECT DISTINCT customerID
    FROM orders_2);