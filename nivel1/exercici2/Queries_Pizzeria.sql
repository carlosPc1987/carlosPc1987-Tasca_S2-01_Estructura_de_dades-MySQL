-- 1️-Cuántos productos de categoría 'Begudes' se han vendido en una determinada localidad
SELECT T.name AS town_name, SUM(OD.quantity) AS total_drinks_sold
FROM OrderDetail OD
JOIN Product P ON OD.product_id = P.id
JOIN FoodOrder FO ON OD.order_id = FO.id
JOIN Client C ON FO.client_id = C.id
JOIN Town T ON C.town_id = T.id
WHERE P.type = 'drink' AND T.name = 'Barcelona'
GROUP BY T.name;

-- 2️-Cuántas comandes ha efectuat un determinat empleat
SELECT E.first_name, E.last_name, COUNT(*) AS total_orders_managed
FROM FoodOrder FO
JOIN Employee E ON FO.employee_id = E.id
WHERE E.id = 1 -- ← cambia por el ID del empleado
GROUP BY E.id;