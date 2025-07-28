-- Per a verificar que el teu disseny és correcte, efectua les següents consultes i comprova que retornen resultats correctes:

-- Òptica:

-- Llista el total de factures d'un client/a en un període determinat.
-- Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.


-- Total de factures d’un client/a en un període determinat
SELECT C.nombre AS cliente, COUNT(*) AS total_facturas
FROM Venta V
JOIN Cliente C ON V.cliente_id = C.id
WHERE C.nombre = 'Carlos Pérez'
  AND V.fecha_venta BETWEEN '2025-07-01' AND '2025-07-31'
GROUP BY C.nombre;

-- Models d’ulleres venuts per un empleat/da durant un any
SELECT DISTINCT G.marca AS modelo_gafa
FROM Venta V
JOIN Gafa G ON V.gafa_id = G.id
JOIN Empleado E ON V.empleado_id = E.id
WHERE E.nombre = 'Laura Martínez'
  AND YEAR(V.fecha_venta) = 2025;

-- Proveïdors que han subministrat ulleres venudes amb èxit
SELECT DISTINCT P.nombre AS proveedor
FROM Venta V
JOIN Gafa G ON V.gafa_id = G.id
JOIN Proveedor P ON G.proveedor_id = P.id;