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
    article_id INT(11),
    order_id INT(11)
);


ALTER TABLE article ADD CONSTRAINT FOREIGN KEY (supplier_id) REFERENCES supplier(id);
ALTER TABLE command ADD CONSTRAINT FOREIGN KEY (supplier_id) REFERENCES supplier(id);
ALTER TABLE command_line ADD CONSTRAINT FOREIGN KEY (order_id) REFERENCES command(id);
ALTER TABLE command_line ADD CONSTRAINT FOREIGN KEY (article_id) REFERENCES article(id);

-- INSERT INTO supplier (name) VALUES ('Française d''import')
-- INSERT INTO supplier (name) VALUES ('FDM SA')
-- INSERT INTO supplier (name) VALUES ('Dubois & Fils')
INSERT INTO supplier (name) VALUES (('Française d''import'), ('FDM SA'), ('Dubois & Fils'));


-- INSERTION ARTICLE
INSERT INTO article (ref, designation, price, supplier_id) VALUES (
    ('A01', 'Perceuse P1', 74.99, 1),
    ('F01', 'Boulon laiton 4 x 40 mm (sachet de 10)', 2.25, 2),
    ('F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.45, 2),
    ('D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.40, 3),
    ('A02', 'Meuleuse 125mm', 37.85, 1),
    ('D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', 1.80, 3),
    ('A03', 'Perceuse à colonne', 185.25, 1),
    ('D04', 'Coffret mêches à bois', 12.25, 3),
    ('F03', 'Coffret mêches plates', 6.25, 2),
    ('F04', 'Fraises d''encastrement', 8.14, 2)
);


-- INSERTION BON
INSERT INTO command (reference, delivery_time, order_date, supplier_id) VALUES ('ref', 3, 3, 1);

-- INSERTION COMPO
INSERT INTO command_line (quantity, article_id, order_id) VALUES (3, 1, 1),(4, 5, 1),(1, 7, 1);