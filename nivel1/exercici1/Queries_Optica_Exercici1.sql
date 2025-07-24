-- 🔍 Query 1: Total number of sales (invoices) for a customer within a date range
SELECT COUNT(*) AS total_invoices
FROM Sales
WHERE id_client = 1 -- Change to desired customer ID
  AND sales_date BETWEEN '2025-07-01' AND '2025-07-31';

-- 🔍 Query 2: Glasses models sold by a specific employee during a year
SELECT DISTINCT G.brand, G.id
FROM Sales S
JOIN Glasses G ON S.id_glasses = G.id
WHERE S.id_worker = 1 -- Change to desired employee ID
  AND YEAR(S.sales_date) = 2025;

-- 🔍 Query 3: Suppliers who provided successfully sold glasses
SELECT DISTINCT Sup.name, Sup.supplier_id
FROM Sales S
JOIN Glasses G ON S.id_glasses = G.id
JOIN Supplier Sup ON G.supplier_id = Sup.supplier_id;