USE topic_3;

/* Визначте, скільки рядків ви отримали (за допомогою оператора COUNT). */
SELECT
  COUNT(*)
FROM
  order_details od
  INNER JOIN orders o ON o.id = od.order_id
  INNER JOIN customers c ON c.id = o.customer_id
  INNER JOIN products p ON p.id = od.product_id
  INNER JOIN categories c2 ON c2.id = p.category_id
  INNER JOIN employees e ON e.id = o.employee_id
  INNER JOIN shippers s ON s.id = o.shipper_id
  INNER JOIN suppliers s2 ON s2.id = p.supplier_id;

/* Змініть декілька операторів INNER на LEFT чи RIGHT. Визначте, що відбувається з кількістю рядків. Чому? Напишіть відповідь у текстовому файлі. */
SELECT
  COUNT(*)
FROM
  order_details od
  LEFT JOIN orders o ON o.id = od.order_id
  LEFT JOIN customers c ON c.id = o.customer_id
  LEFT JOIN products p ON p.id = od.product_id
  RIGHT JOIN categories c2 ON c2.id = p.category_id
  RIGHT JOIN employees e ON e.id = o.employee_id
  RIGHT JOIN shippers s ON s.id = o.shipper_id
  RIGHT JOIN suppliers s2 ON s2.id = p.supplier_id;

/* Оберіть тільки ті рядки, де employee_id > 3 та ≤ 10. */
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
  INNER JOIN suppliers s2 ON s2.id = p.supplier_id
WHERE
  o.employee_id > 3
  AND o.employee_id <= 10;

/* Згрупуйте за іменем категорії, порахуйте кількість рядків у групі, середню кількість товару (кількість товару знаходиться в order_details.quantity) */
SELECT
  c2.name AS `category`
, COUNT(*) AS `count`
, AVG(od.quantity) AS `average quantity`
FROM
  order_details od
  INNER JOIN orders o ON o.id = od.order_id
  INNER JOIN customers c ON c.id = o.customer_id
  INNER JOIN products p ON p.id = od.product_id
  INNER JOIN categories c2 ON c2.id = p.category_id
  INNER JOIN employees e ON e.id = o.employee_id
  INNER JOIN shippers s ON s.id = o.shipper_id
  INNER JOIN suppliers s2 ON s2.id = p.supplier_id
GROUP BY
  c2.name;

/* Відфільтруйте рядки, де середня кількість товару більша за 21. */
SELECT
  c2.name AS `category`
, COUNT(*) AS `count`
, AVG(od.quantity) AS `average quantity`
FROM
  order_details od
  INNER JOIN orders o ON o.id = od.order_id
  INNER JOIN customers c ON c.id = o.customer_id
  INNER JOIN products p ON p.id = od.product_id
  INNER JOIN categories c2 ON c2.id = p.category_id
  INNER JOIN employees e ON e.id = o.employee_id
  INNER JOIN shippers s ON s.id = o.shipper_id
  INNER JOIN suppliers s2 ON s2.id = p.supplier_id
GROUP BY
  c2.name
HAVING
  `average quantity` > 21;

/* Відсортуйте рядки за спаданням кількості рядків. */
SELECT
  c2.name AS `category`
, COUNT(*) AS `count`
, AVG(od.quantity) AS `average quantity`
FROM
  order_details od
  INNER JOIN orders o ON o.id = od.order_id
  INNER JOIN customers c ON c.id = o.customer_id
  INNER JOIN products p ON p.id = od.product_id
  INNER JOIN categories c2 ON c2.id = p.category_id
  INNER JOIN employees e ON e.id = o.employee_id
  INNER JOIN shippers s ON s.id = o.shipper_id
  INNER JOIN suppliers s2 ON s2.id = p.supplier_id
GROUP BY
  c2.name
HAVING
  `average quantity` > 21
ORDER BY
  `count` DESC;

/* Виведіть на екран (оберіть) чотири рядки з пропущеним першим рядком. */
SELECT
  c2.name AS `category`
, COUNT(*) AS `count`
, AVG(od.quantity) AS `average quantity`
FROM
  order_details od
  INNER JOIN orders o ON o.id = od.order_id
  INNER JOIN customers c ON c.id = o.customer_id
  INNER JOIN products p ON p.id = od.product_id
  INNER JOIN categories c2 ON c2.id = p.category_id
  INNER JOIN employees e ON e.id = o.employee_id
  INNER JOIN shippers s ON s.id = o.shipper_id
  INNER JOIN suppliers s2 ON s2.id = p.supplier_id
GROUP BY
  c2.name
HAVING
  `average quantity` > 21
ORDER BY
  `count` DESC
LIMIT
  4
OFFSET
  1;