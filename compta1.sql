CREATE TABLE article (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ref VARCHAR(100) NOT NULL,
    designation VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    supplier_id INT(11)
);

CREATE TABLE supplier (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE command (
    id INT PRIMARY KEY AUTO_INCREMENT,
    reference VARCHAR(100) NOT NULL,
    delivery_time INT NOT NULL,
    order_date DATE NOT NULL,
    supplier_id INT(11)
);

CREATE TABLE command_line (
    id INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    article_id INT(11),
    order_id INT(11)
);


ALTER TABLE article ADD CONSTRAINT FOREIGN KEY (supplier_id) REFERENCES supplier(id);
ALTER TABLE command ADD CONSTRAINT FOREIGN KEY (supplier_id) REFERENCES supplier(id);
ALTER TABLE command_line ADD CONSTRAINT FOREIGN KEY (order_id) REFERENCES command(id);
ALTER TABLE command_line ADD CONSTRAINT FOREIGN KEY (article_id) REFERENCES article(id);
