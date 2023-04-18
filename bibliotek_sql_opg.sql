USE MASTER 
-- ALTER AND DROPS DATABASE IF EXIST
IF DB_ID('BiblioteksDatabase') IS NOT NULL
BEGIN
	ALTER DATABASE BiblioteksDatabase SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE BiblioteksDatabase
END

-- CREATE DATABASE
CREATE DATABASE BiblioteksDatabase
-- USING DATABASE
USE BiblioteksDatabase


-- CREATING TABLES

 Create Table Books(
 Book_ID INT IDENTITY(1,1) PRIMARY KEY, -- THE ID IS PRIMARY KEY/UNIQUE 
 [Quantity] INT,
 Title VARCHAR(50),
 Release_Year INT,
 );

 Create Table Authors (
 Book_ID INT NOT NULL FOREIGN KEY REFERENCES Books(Book_ID), -- REFERENCES TO BOOK ID FROM BOOKS TABLE
 [Name] VARCHAR(30),
 Birth_Year INT,
 );

 Create Table Borrowers (
 [Name] VARCHAR(30),
 email VARCHAR(50),
 Book_ID INT NOT NULL FOREIGN KEY REFERENCES Books(Book_ID), -- REFERENCES TO BOOK ID FROM BOOKS TABLE
 Borrowed_Date DATE
 );

 -- INSERTING DATA INTO THE BOOKS TABLE 
 INSERT INTO Books VALUES(20, 'Harry Potter and the Philosophers Stone', 1997)
 INSERT INTO Books VALUES(12, 'To Kill a Mockingbird', 1960)
 INSERT INTO Books VALUES(15, 'The Great Gatsby', 1925)
 INSERT INTO Books VALUES(7, 'Pride and Prejudice', 1813)
 INSERT INTO Books VALUES(8, 'The Catcher in the Rye', 1951)

 -- INSERTING DATA INTO THE AUTHORS TABLE
 INSERT INTO Authors VALUES(1,'J.K Rowling', 1965)
 INSERT INTO Authors VALUES(2,'Harper Lee', 1926)
 INSERT INTO Authors VALUES(3,'F. Scott Fitzgerald', 1896)
 INSERT INTO Authors VALUES(4,'Jane Austen', 1775)
 INSERT INTO Authors VALUES(5,'J.D. Salinger', 1919)

 -- INSERTING DATA INTO THE AUTHORS TABLE
 INSERT INTO Borrowers VALUES('John Smith', 'johnsmith@example.com', 1,'2022-04-21')
 INSERT INTO Borrowers VALUES('Emma Johnson', 'emmajohnson@example.com', 5,'2021-11-14')
 INSERT INTO Borrowers VALUES('Michael Brown', 'michaelbrown@example.com', 2, '2022-06-10')
 INSERT INTO Borrowers VALUES('Sophia Davis', 'sophiadavis@example.com', 3,'2023-01-05')
 INSERT INTO Borrowers VALUES('William Wilson', 'williamwilson@example.com', 4, '2023-04-17')

 --EXECUTING THE STORED PRECEDURE
 EXEC BooksAndAuthor;

 -- SELECT EVERYTHING (ROWS AND COLUMS) ON A TABLE AND SHOWS IT
 SELECT * FROM Books
 SELECT * FROM Authors
 SELECT * FROM Borrowers

 --AUTHORS JOINS BOOKS TABLE, SO THE AUTHOURS BOOK_ID MATCHES WITH THE BOOKS
 SELECT * FROM Books JOIN Authors ON Books.Book_ID = Authors.Book_ID

 --BORROWERS TABLE JOINS THE BOOKS TABLE, SO THE BORROWERS BOOK_ID MATCHES WITH THE BOOKS
 SELECT * FROM Books JOIN Borrowers ON Books.Book_ID = Borrowers.Book_ID
 
 --BOOKS JOINS BORROWERS TABLE AND ARANGES THE ROWS WITH THE MATCHING ID
 SELECT * FROM Borrowers JOIN Books ON Borrowers.Book_ID = Books.Book_ID
 
 -- LEFT JOINING BOOKS TO AUTHRS WITH MATCHING ID AND SHOWS THE BOOKS ID, BOOKS NAME AND THE AUTHOR
 SELECT Books.Book_ID AS BookID, Books.Title AS [Book Name], Authors.Name AS Author
 FROM Books
 LEFT JOIN Authors
 ON Authors.Book_ID = Books.Book_ID
 ORDER BY Books.Book_ID 

 --COUNTS TOTAL OF ROWS
 SELECT COUNT(Title) AS [TOTAL TYPES OF BOOKS] FROM Books;
 
 --THE TOTAL OR SUMS OF THE INT COLUMN ALL TOGETHER
 SELECT SUM(Quantity) AS [TOTAL OF BOOKS] FROM Books;

 -- UPDATES NAME AND EMAIL FROM A TABLE
 UPDATE Borrowers
 SET [Name] = 'George Washington', [email] = 'georgewashington@example.com'
 WHERE [Name] = 'William Wilson'

 -- DELETING A ROW FROM A TABLE
 DELETE FROM Authors
 WHERE [Name] = 'J.K Rowling'

 DELETE FROM Borrowers
 WHERE [Name] = 'John Smith'