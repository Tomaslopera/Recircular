create database recircular;

create database PARKHUB;

use recircular;

use PARKHUB;

CREATE TABLE user (
  id INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(24) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  phone VARCHAR(16),
  ShippingAddress_id INT,
  date_created DATETIME NOT NULL,
  date_updated DATETIME,
  PRIMARY KEY (id),
  UNIQUE INDEX username_UNIQUE (username ASC),
  UNIQUE INDEX email_UNIQUE (email ASC),
  INDEX fk_User_ShippingAddress1_idx (ShippingAddress_id ASC) VISIBLE,
  CONSTRAINT fk_User_ShippingAddress1
    FOREIGN KEY (ShippingAddress_id) REFERENCES shipping_address (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE shipping_address (
  id INT NOT NULL AUTO_INCREMENT,
  country VARCHAR(45) NOT NULL,
  city VARCHAR(45) NOT NULL,
  province VARCHAR(45) NOT NULL,
  address VARCHAR(45) NOT NULL,
  description VARCHAR(45) NOT NULL,
  postal_code INT NOT NULL,
  PRIMARY KEY (id));

CREATE TABLE product (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  name VARCHAR(45) NOT NULL,
  description VARCHAR(45) NOT NULL,
  price FLOAT NOT NULL,
  stock INT NOT NULL,
  date_created DATETIME NOT NULL,
  PRIMARY KEY (id),
  INDEX user_id_idx (user_id ASC),
  CONSTRAINT product_user_fk
    FOREIGN KEY (user_id) REFERENCES user (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE key_words (
  id INT NOT NULL,
  product_id INT NOT NULL,
  key_wordscol VARCHAR(45) NOT NULL,
  PRIMARY KEY (id),
  INDEX id_idx (product_id ASC),
  CONSTRAINT id
    FOREIGN KEY (product_id)
    REFERENCES Product(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Eliminar Tablas
DROP TABLE shipping_address;
DROP TABLE user;
DROP TABLE product;
DROP TABLE material;
DROP TABLE url;



-- 3b269753-ab99-4338-b5b6-4b3bc956555e

SELECT * FROM user;
SELECT * FROM shipping_address;
SELECT * FROM product;
SELECT * FROM url;
SELECT * FROM material;


DELETE FROM user where id = 5;

SELECT * FROM user WHERE user.username = "Tomaslopera10";



