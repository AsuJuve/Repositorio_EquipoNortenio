/* Creación de la base de datos */

CREATE DATABASE KEEP_LEARNING;

/* Creaación de las tablas del sitio*/

CREATE TABLE CUSTOMERS(
    CUSTOMER_ID INT PRIMARY KEY AUTO_INCREMENT,
    CUSTOMER_FIRSTNAME CHAR(30) NOT NULL,
    CUSTOMER_LASTNAME CHAR(60) NOT NULL,
    CUSTOMER_EMAIL CHAR(100) UNIQUE NOT NULL,
    CUSTOMER_PASSWORD CHAR(200) NOT NULL,
    CUSTOMER_TYPE CHAR(20) NOT NULL,
    CUSTOMER_IMAGE VARCHAR(500) NOT NULL
);

CREATE TABLE SHOPPING_CART(
    SHOPPING_CART_ID INT PRIMARY KEY,
    CUSTOMER_ID INT NOT NULL,
    AMOUNT INT NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) 
        REFERENCES CUSTOMERS(CUSTOMER_ID)
);

CREATE TABLE CATEGORIES(
    CATEGORY_ID INT PRIMARY KEY,
    CATEGORY_NAME CHAR(30) NOT NULL,
    PARENT_NAME INT,
    FOREIGN KEY (PARENT_NAME) REFERENCES CATEGORIES(CATEGORY_ID)
);

CREATE TABLE PRODUCTS(
    PRODUCT_ID INT PRIMARY KEY AUTO_INCREMENT,
    PRODUCT_NAME CHAR(100) NOT NULL,
    SHORT_DESCRIPTION VARCHAR(300) NOT NULL,
    LONG_DESCRIPTION VARCHAR(1300) NOT NULL,
    PRODUCT_IMAGE VARCHAR(500) NOT NULL,
    PRODUCT_PRICE INT NOT NULL,
    ENROLLED_STUDENTS INT NOT NULL,
    CATEGORY_ID INT NOT NULL,
    VALUE_RATING DECIMAL(2,1) NOT NULL,
    FOREIGN KEY (CATEGORY_ID)
        REFERENCES CATEGORIES(CATEGORY_ID)
);

CREATE TABLE SHOPPING_CART_PRODUCTS(
    ID INT PRIMARY KEY,
    SHOPPING_CART_ID INT,
    PRODUCT_ID INT AUTO_INCREMENT,
    FOREIGN KEY (SHOPPING_CART_ID) REFERENCES SHOPPING_CART(SHOPPING_CART_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);

CREATE TABLE REQUIREMENTS(
    REQUIREMENT_ID INT PRIMARY KEY AUTO_INCREMENT,
    REQUIREMENT_DESCRIPTION CHAR(255) NOT NULL,
    PRODUCT_ID INT NOT NULL,
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);


