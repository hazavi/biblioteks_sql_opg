 
 CREATE PROCEDURE BooksAndAuthor
 AS
 SELECT Books.Title AS [Book Name], Authors.[Name] AS Authors FROM Books, Authors, Borrowers
 GO;

