--6
-- select *
-- from orders
-- -- join staff ON orders.staff_id = staff.staff_id
-- where staff_id = 1;
--7
-- SELECT
--   s.first_name,
--   s.last_name,
--   COUNT(o.order_id) AS order_count
-- FROM staff s
-- JOIN  orders o ON s.staff_id  = o.staff_id
-- GROUP BY s.staff_id
-- ORDER BY order_count DESC;
--8 Write a query to calculate the total revenue for each day of sales.
-- SELECT 
--   DATE(order_date)  AS sale_date,
--   SUM(total_price) AS total_revenue
-- FROM orders o
-- GROUP BY DATE(order_date)
-- ORDER BY sale_date;

--9 Write a query to find out which menu item has been ordered the most.
SELECT *FROM orderitems ORDER BY item_id DESC;
SELECT
    -- m.item_id,
    m.name,
    SUM(oi.quantity) AS total_ordered
FROM orderitems oi
JOIN menuitems m ON oi.item_id = m.item_id
GROUP BY
    m.name
ORDER BY
    total_ordered DESC
LIMIT 1;
--10 List All Ingredients for the 'Bacon Cheeseburger'
SELECT i.name AS ingredient_name, ri.quantity_needed, i.unit
FROM menuitems m
JOIN recipeitems ri ON m.item_id = ri.item_id
JOIN ingredients i ON ri.ingredient_id = i.ingredient_id
WHERE m.name = 'Bacon Cheeseburger';