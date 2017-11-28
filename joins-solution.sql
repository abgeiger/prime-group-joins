--	1.	Get all customers and their addresses.
SELECT * FROM customers
JOIN addresses ON customers.id=addresses.customer_id;

--	2.	Get all orders and their line items.
SELECT * FROM orders
JOIN line_items ON orders.id=line_items.order_id;

--	3.	Which warehouses have cheetos?
SELECT warehouse FROM products
JOIN warehouse_product ON warehouse_product.product_id=products.id
JOIN warehouse ON warehouse.id=warehouse_product.warehouse_id
WHERE products.id=5;

--	4.	Which warehouses have diet pepsi?
SELECT warehouse FROM products
JOIN warehouse_product ON warehouse_product.product_id=products.id
JOIN warehouse ON warehouse.id=warehouse_product.warehouse_id
WHERE products.id=6;

--	5.	Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customer_id, COUNT(orders.id) FROM orders
JOIN addresses ON addresses.id=orders.address_id
JOIN customers ON customers.id=addresses.customer_id
GROUP BY customer_id;

--	6.	How many customers do we have?
SELECT COUNT(id) FROM customers;

--	7.	How many products do we carry?
SELECT COUNT(id) FROM products;

--	8.	What is the total available on-hand quantity of diet pepsi?
SELECT products.description, SUM(on_hand) FROM products
JOIN warehouse_product ON products.id=warehouse_product.product_id
WHERE products.id=6
GROUP BY products.description;