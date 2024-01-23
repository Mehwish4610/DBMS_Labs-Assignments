# SQL and DBMS LAB PROGRAMS

By MEHWISH<br>
USN: 4MH21CS050<br>
'5A'<br> 
DBMS<br>
LAB PROGRAM is submitted in both .txt and .sql format

### PROGRAM 1:
#### Consider the following schema for a Library Database:
BOOK (Book_id, Title, Publisher_Name, Pub_Year)<br>
BOOK_AUTHORS (Book_id, Author_Name)<br>
PUBLISHER (Name, Address, Phone)<br>
BOOK_COPIES (Book_id, Programme_id, No-of_Copies)<br>
BOOK_LENDING (Book_id, Programme_id, Card_No, Date_Out, Due_Date)<br>
LIBRARY_PROGRAMME (Programme_id, Programme_Name, Address)<br>
##### Write SQL queries to
1. Retrieve details of all books in the library – id, title, name of publisher, authors, number of copies in
each Programme, etc.
2. Get the particulars of borrowers who have borrowed more than 3 books, but from Jan 2017 to Jun 2017.
3. Delete a book in BOOK table. Update the contents of other tables to reflect this data manipulation
operation.
4. Partition the BOOK table based on year of publication. Demonstrate its working with a simple query.
5. Create a view of all books and its number of copies that are currently available in the Library.


