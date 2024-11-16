/* 
3. Перейдіть до бази даних, з якою працювали у темі 3. Напишіть запит за допомогою операторів FROM та INNER JOIN, що об’єднує всі таблиці даних, які ми завантажили з файлів: order_details, orders, customers, products, categories, employees, shippers, suppliers. Для цього ви маєте знайти спільні ключі.
 */
USE topic_3;

SELECT
  *
FROM
  order_details od
  INNER JOIN orders o ON o.id = od.order_id
  INNER JOIN customers c ON c.id = o.customer_id
  INNER JOIN products p ON p.id = od.product_id
  INNER JOIN categories c2 ON c2.id = p.category_id
  INNER JOIN employees e ON e.id = o.employee_id
  INNER JOIN shippers s ON s.id = o.shipper_id
  INNER JOIN suppliers s2 ON s2.id = p.supplier_id;