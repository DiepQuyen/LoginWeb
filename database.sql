CREATE DATABASE LoginDB;
USE LoginDB;

CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL
);

INSERT INTO users (username, password) VALUES
                                           ('admin', '123456'),
                                           ('user1', 'password1');
CREATE TABLE products (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,
                          price DOUBLE NOT NULL
);

INSERT INTO products (name, price) VALUES
                                       ('Product 1', 10.0),
                                       ('Product 2', 20.0);