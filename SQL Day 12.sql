
-- Analysis, corrections, and notes for the provided SQL script

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

CREATE TABLE Customers (
  customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  age SMALLINT UNSIGNED,
  country VARCHAR(50),
  PRIMARY KEY (customer_id)
) ENGINE=InnoDB;

CREATE TABLE Orders (
  order_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  item VARCHAR(100) NOT NULL,
  amount INT NOT NULL,
  customer_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (order_id),
  INDEX idx_orders_customer (customer_id),
  CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Shippings (
  shipping_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  status VARCHAR(20) NOT NULL,
  customer_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (shipping_id),
  INDEX idx_shippings_customer (customer_id),
  CONSTRAINT fk_shippings_customers FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO Customers (customer_id, first_name, last_name, age, country) VALUES
(1, 'John', 'Doe', 31, 'USA'),
(2, 'Robert', 'Luna', 22, 'USA'),
(3, 'David', 'Robinson', 22, 'UK'),
(4, 'John', 'Reinhardt', 25, 'UK'),
(5, 'Betty', 'Doe', 28, 'UAE');

INSERT INTO Orders (order_id, item, amount, customer_id) VALUES
(1, 'Keyboard', 400, 4),
(2, 'Mouse', 300, 4),
(3, 'Monitor', 12000, 3),
(4, 'Keyboard', 400, 1),
(5, 'Mousepad', 250, 2);

INSERT INTO Shippings (shipping_id, status, customer_id) VALUES
(1, 'Pending', 2),
(2, 'Pending', 4),
(3, 'Delivered', 3),
(4, 'Pending', 5),
(5, 'Delivered', 1);

SELECT * FROM Customers ORDER BY customer_id;
SELECT * FROM Orders ORDER BY order_id;
SELECT * FROM Shippings ORDER BY shipping_id;

SELECT * FROM Customers
WHERE country IN (
  SELECT country FROM Customers
  WHERE first_name = 'David' OR first_name = 'Robert'
);

SELECT * FROM Customers
WHERE country = ANY (
  SELECT country FROM Customers
  WHERE first_name = 'David' OR first_name = 'Robert'
);

SELECT * FROM Customers
WHERE country = (
  SELECT MIN(country) FROM Customers WHERE first_name = 'David' OR first_name = 'Robert'
);

SELECT * FROM Customers
WHERE country = (
  SELECT country FROM Customers
  WHERE first_name = 'David' OR first_name = 'Robert'
  ORDER BY country LIMIT 1
);

SELECT * FROM Customers c
WHERE EXISTS (
  SELECT 1 FROM Customers c2
  WHERE (c2.first_name = 'David' OR c2.first_name = 'Robert')
    AND c.country = c2.country
);

SELECT * FROM Customers
WHERE age > ALL (
  SELECT age FROM Customers WHERE first_name = 'Betty' OR first_name = 'John'
);

SELECT * FROM Customers
WHERE age < ALL (
  SELECT age FROM Customers WHERE first_name = 'Betty' OR first_name = 'John'
);

SELECT * FROM Customers c
WHERE EXISTS (
  SELECT 1 FROM Orders o
  WHERE o.customer_id = c.customer_id AND o.amount > 500
);

SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.item, o.amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.amount > 300
ORDER BY c.customer_id;
