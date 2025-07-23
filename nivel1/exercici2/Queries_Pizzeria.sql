SELECT p.name AS producto, c.name AS clase, p.price
FROM product p
JOIN classes c ON p.id_classes = c.id;

SELECT p.name, p.price
FROM product p
JOIN classes c ON p.id_classes = c.id
WHERE c.name = 'pizza';

SELECT c.name AS clase, COUNT(*) AS total
FROM product p
JOIN classes c ON p.id_classes = c.id
GROUP BY c.name;

SELECT s.id, s.date_time, s.to_take_away, s.price_total,
       cl.name AS cliente, sh.direction AS tienda
FROM sales s
JOIN client cl ON s.id_client = cl.id
JOIN shop sh ON s.id_shop = sh.id;

SELECT * FROM sales
WHERE to_take_away = 'Recollir';

SELECT w.name, w.surname, w.rol, s.direction AS tienda
FROM worker w
JOIN shop s ON w.id_shop = s.id
WHERE w.rol = 'repartidor';

SELECT cl.name, cl.surname, ct.name AS ciudad, z.name AS zona
FROM client cl
JOIN city ct ON cl.id_city = ct.id
JOIN zone z ON cl.id_zone = z.id;

SELECT z.name AS zona, COUNT(*) AS total_tiendas
FROM shop s
JOIN zone z ON s.id_zone = z.id
GROUP BY z.name;


