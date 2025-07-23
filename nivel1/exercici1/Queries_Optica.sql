SELECT COUNT(*) AS total_factures
FROM sales
JOIN client ON sales.id_client = client.id
WHERE client.id = 1 
  AND sales_date BETWEEN '2025-01-01' AND '2025-12-31';
  
 SELECT DISTINCT glasses.brand, glasses.lens_power, glasses.color_frame, glasses.color_glass
FROM sales
JOIN glasses ON sales.id_glasses = glasses.id
WHERE sales.id_worker = 1
  AND YEAR(sales.sales_date) = 2025;
  
  SELECT DISTINCT provider.name
FROM sales
JOIN glasses ON sales.id_glasses = glasses.id
JOIN provider ON glasses.id_provider = provider.id;