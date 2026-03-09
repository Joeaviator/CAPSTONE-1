--Create A Table
DROP TABLE IF EXISTS Salesman;
CREATE TABLE Salesman(
S_ID INT,
NAME TEXT,
CITY TEXT,
COMMISSION INT
);
--Insert vlues
INSERT INTO Salesman(S_ID, NAME, CITY, COMMISSION) VALUES
(2, 'John', 'Pretoria', 3000),
(3, 'Oscar', 'Perth', 2590 ),
(8, 'Charles', 'Monaco City', 4250),
(19, 'Philip', 'Moscow', 8000),
(11, 'Lando', 'London', 12500),
(63, 'Alex', 'Bangkok', 6330),
(41, 'Sergio', 'Mexico City', 3690),
(78, 'Valteri', 'Stockholm', 8560);
-- Create a diff table
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
C_ID INT,
C_NAME TEXT,
C_CITY TEXT,
S_ID INT);
INSERT INTO Customers(C_ID,C_NAME, C_CITY, S_ID) VALUES
(3, 'Kingsley', 'Accra', 2),
(5, 'Rhoda', 'Abuja', 2),
(7, 'Alonso', 'Peru', 63),
(9, 'Piastri', 'Melbourne', 41),
(19, 'Joe', 'Liverpool', 11),
(67, 'Ben', 'Machester', 11),
(99, 'De Villiers', 'Johannesburg', 2),
(36, 'Babar', 'Karachi', 63),
(98, 'Carlos', 'Madrid', 78),
(37, 'Chris', 'Barbados', 41);
DROP TABLE IF EXISTS ORDERS;
CREATE TABLE Orders(
ORDER_NO INT,
ORDER_AMOUNT INT,
ORDER_DATE TEXT,
C_ID INT,
S_ID INT);
INSERT INTO Orders(ORDER_NO, ORDER_AMOUNT, ORDER_DATE, C_ID, S_ID) VALUES
(12, 5000, '23-05-2023', 3, 19),
(34, 4000, '25-09-2023', 5, 19),
(69, 35000, '23-04-2024', 99, 41),
(43, 50800, '26-05-2027', 36, 78),
(32, 78000, '08-12-2023', 19, 11),
(18, 1000, '17-05-2026', 98, 2),
(87, 9000, '23-10-2024', 37, 3),
(30, 4500, '19-09-2025', 36, 8),
(78, 67000, '13-06-2025', 7, 19);
SELECT * FROM Salesman;
SELECT * FROM Customers;
SELECT * FROM Orders;
--Matching the Salesman and customer by the city
SELECT Customers.C_NAME, Salesman.NAME, Salesman.CITY FROM Customers
JOIN Salesman ON Customers.S_ID=Salesman.S_ID;

--Linking customers to their salesman
SELECT Customers.C_NAME, Salesman.NAME FROM Customers JOIN Salesman ON Customers.S_ID=Salesman.S_ID;

--Fetch orders where customer's city does not match salesnman's city
SELECT Orders.ORDER_NO, Customers.C_NAME, Orders.C_ID, Orders.S_ID FROM Orders JOIN Customers ON Orders.C_ID=Customers.C_ID JOIN Salesman ON Orders.S_ID=Salesman.S_ID WHERE Customers.C_CITY <> Salesman.CITY;
--Fetch orders where customer's city does matches salesnman's city
SELECT Orders.ORDER_NO, Customers.C_NAME, Orders.C_ID, Orders.S_ID FROM Orders JOIN Customers ON Orders.C_ID=Customers.C_ID JOIN Salesman ON Orders.S_ID=Salesman.S_ID WHERE Customers.C_CITY == Salesman.CITY;
--Fetch all orders with customer names
SELECT Orders.ORDER_NO, Customers.C_NAME FROM ORDERS JOIN Customers ON Orders.C_ID = Customers.C_ID;
--Calculate the commissions for orders where the order amount is greater than 5000
SELECT Orders.ORDER_NO, ORDERS.ORDER_AMOUNT, Salesman.NAME,  Salesman.COMMISSION FROM Orders JOIN Salesman ON Orders.S_ID=Salesman.S_ID WHERE Orders.ORDER_AMOUNT > 6500;
--Orders on a specific date
SELECT * FROM Customers
JOIN ORDERS ON Customers.C_ID=Orders.C_ID
WHERE Orders.ORDER_DATE="25-09-2023";


