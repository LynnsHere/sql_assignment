CREATE DATABASE bookstall;

USE bookstall;

-- Creating "book_list" table
CREATE TABLE book_list(
	id          VARCHAR(10) NOT NULL,
    Name        VARCHAR(30) NOT NULL,
    Author      VARCHAR(30) NOT NULL,
    Publisher   VARCHAR(30) NOT NULL,
    Genre       VARCHAR(30) NOT NULL,
    Fiction     BOOLEAN     NOT NULL,
    Discount    INT         NOT NULL,
    CONSTRAINT pri_id PRIMARY KEY (id),
    CONSTRAINT uni_id UNIQUE (id)
);

-- Inserting record into "book_list" table
INSERT INTO book_list(id, Name, Author, Publisher, Genre, Fiction, Discount) VALUES
    ("BB194", "Ballinby Boys",          "Abraham Stackhouse",   "Cedar House Publishers",   "Young Adult",      FALSE,  0   ),
    ("NC652", "Nothing But Capers",     "Amelia Wangerin",      "Sound & Seas Co.",         "Mystery",          TRUE,   10  ),
    ("AD222", "Alanna Saves the Day",   "Anastasia Inez",       "Palimpsest Printing",      "Fiction",          TRUE,   20  ),
    ("PA169", "Post Alley",             "Arthur McCrumb",       "Etaoin Shrdlu Press",      "Young Adult",      FALSE,  5   ),
    ("TC188", "Thatchwork Cottage",     "Arturo Hijuelos",      "Sound & Seas Co.",         "Childrens",        FALSE,  0   ),
    ("ZT703", "Zero over Twelve",       "Bernard Hopf",         "Allen & Unwin",            "Fiction",          TRUE,   10  ),
    ("PP866", "Portmeirion",            "Bianca Thompson",      "Palimpsest Printing",      "SciFi/Fantasy",    TRUE,   10  ),
    ("RR774", "Rystwyth",               "Bravig Lewisohn",      "Harper Collins",           "Childrens",        FALSE,  20  ),
    ("TM925", "The Mallemaroking",      "Burton Malamud",       "Palimpsest Printing",      "Childrens",        FALSE,  20  ),
    ("CH391", "Can I Be honest?",       "Carolyn Segal",        "Etaoin Shrdlu Press",      "Childrens",        FALSE,  5   );



-- Creating "customer" table
CREATE TABLE customer(
    customer_id         VARCHAR(10) NOT NULL,
    customer_name       VARCHAR(30) NOT NULL,
    customer_discount   INT         NOT NULL,
    CONSTRAINT pri_customerid PRIMARY KEY (customer_id),
    CONSTRAINT uni_customerid UNIQUE (customer_id)
);

-- Inserting record into "customer" table
INSERT INTO customer(customer_id, customer_name, customer_discount) VALUES
    ("1GHF2", "Darryl",     0   ),
    ("34FDD", "David",      10  ),
    ("P0OO1", "Elizabeth",  10  ),
    ("15DTB", "Elmer",      0   );



-- Creating "sales" table
CREATE TABLE sales(
    Sales_id            INT         NOT NULL,
    Book_id             vARCHAR(30) NOT NULL,
    Date                DATE        NOT NULL,
    Customer_id         VARCHAR(30) NOT NULL,
    Quantity_bought     INT         NOT NULL,
    Total_Cost          DECIMAL     NOT NULL,
    CONSTRAINT pri_salesid PRIMARY KEY (Sales_id),
    CONSTRAINT fore_bookid  FOREIGN KEY (Book_id)
    REFERENCES book_list(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fore_customerid  FOREIGN KEY (Customer_id)
    REFERENCES customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE          
);

-- Inserting record into "saless" table
INSERT INTO sales(Sales_id, Book_id, Date, Customer_id, Quantity_bought, Total_Cost) VALUES
    (5,     "BB194", "2020-03-03", "1GHF2", 1, 6.99  ),
    (6,     "NC652", "2020-03-03", "34FDD", 2, 10.00 ),
    (7,     "AD222", "2020-03-03", "34FDD", 1, 12.00 ),
    (8,     "BB194", "2020-03-03", "1GHF2", 1, 12.00 ),
    (9,     "PP866", "2020-03-03", "P0OO1", 2, 13.98 ),
    (10,    "TM925", "2020-04-04", "15DTB", 2, 10.50 ),
    (11,    "CH391", "2020-04-04", "1GHF2", 3, 12.00 ),
    (12,    "TC188", "2020-04-04", "34FDD", 5, 25.00 ),
    (13,    "AD222", "2020-04-04", "34FDD", 2, 20.00 );



-- Query 7:
SELECT * FROM book_list;

-- Query 8:
SELECT * FROM sales 
LIMIT 5;

-- Query 9:
SELECT Sales_id, Date FROM sales
WHERE Customer_id = "1GHF2";

-- Query 10:
SELECT * FROM customer 
WHERE customer_name LIKE '%e%';

-- Query 11:
SELECT * FROM book_list
ORDER BY id DESC;

-- Query 12:
SELECT * FROM book_list
WHERE Fiction = TRUE;

-- Query 13:
SELECT Sales_id, Book_id FROM sales
WHERE Total_Cost <= 15;

-- Query 14:
UPDATE book_list SET Genre = 'Fantasy', Fiction = TRUE
WHERE id = 'CH391';

-- Query 15:
SELECT SUM(Total_Cost) AS TotalCostOfBooks
FROM sales;

-- Query 16:
SELECT * FROM sales
WHERE Book_id NOT IN ('NC652', 'PP866');

-- Query 17:
SELECT * FROM sales
WHERE Sales_id IN (10, 13);

-- Query 18:
SELECT * FROM sales
WHERE Total_Cost BETWEEN 10 AND 20;

-- Query 19:
DELETE FROM sales
WHERE Book_id = 'BB194';

-- Query 20:
SELECT b.Name AS Book_Name, s.Date, s.Quantity_bought, s.Total_Cost
FROM sales s JOIN book_list b
ON s.Book_id = b.id;

