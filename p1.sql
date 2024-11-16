/* 
1. Створіть базу даних для керування бібліотекою книг згідно зі структурою, наведеною нижче. 
Використовуйте DDL-команди для створення необхідних таблиць та їх зв'язків.

a) Назва схеми — “LibraryManagement” 
 */
CREATE SCHEMA LibraryManagement;

USE LibraryManagement;

/* 
b) Таблиця "authors":

author_id (INT, автоматично зростаючий PRIMARY KEY)
author_name (VARCHAR)
 */
CREATE TABLE
  authors (
    author_id INT AUTO_INCREMENT NOT NULL
  , author_name VARCHAR(255) DEFAULT '' NOT NULL
  , CONSTRAINT authors_PK PRIMARY KEY (author_id)
  );

/*
c)  Таблиця "genres":

genre_id (INT, автоматично зростаючий PRIMARY KEY)
genre_name (VARCHAR) */
CREATE TABLE
  genres (
    genre_id INT AUTO_INCREMENT NOT NULL
  , genre_name VARCHAR(255) DEFAULT '' NOT NULL
  , CONSTRAINT genres_PK PRIMARY KEY (genre_id)
  );

/* 
d) Таблиця "books":

book_id (INT, автоматично зростаючий PRIMARY KEY)
title (VARCHAR)
publication_year (YEAR)
author_id (INT, FOREIGN KEY зв'язок з "Authors")
genre_id (INT, FOREIGN KEY зв'язок з "Genres")
 */
CREATE TABLE
  books (
    book_id INT AUTO_INCREMENT NOT NULL
  , title VARCHAR(255) DEFAULT '' NOT NULL
  , publication_year YEAR DEFAULT NULL
  , author_id INT DEFAULT NULL
  , genre_id INT DEFAULT NULL
  , CONSTRAINT books_PK PRIMARY KEY (book_id)
  , CONSTRAINT books_authors_FK FOREIGN KEY (author_id) REFERENCES authors (author_id)
  , CONSTRAINT books_genres_FK FOREIGN KEY (genre_id) REFERENCES genres (genre_id)
  );

/* 
e) Таблиця "users":

user_id (INT, автоматично зростаючий PRIMARY KEY)
username (VARCHAR)
email (VARCHAR)
 */
CREATE TABLE
  users (
    user_id INT AUTO_INCREMENT NOT NULL
  , username VARCHAR(255) DEFAULT '' NOT NULL
  , email VARCHAR(255) DEFAULT NULL
  , CONSTRAINT users_PK PRIMARY KEY (user_id)
  );

/* 
f) Таблиця "borrowed_books":

borrow_id (INT, автоматично зростаючий PRIMARY KEY)
book_id (INT, FOREIGN KEY зв'язок з "Books")
user_id (INT, FOREIGN KEY зв'язок з "Users")
borrow_date (DATE)
return_date (DATE)
 */
CREATE TABLE
  borrowed_books (
    borrow_id INT AUTO_INCREMENT NOT NULL
  , book_id INT DEFAULT NULL
  , user_id INT DEFAULT NULL
  , borrow_date DATE DEFAULT NULL
  , return_date DATE DEFAULT NULL
  , CONSTRAINT borrowed_books_PK PRIMARY KEY (borrow_id)
  , CONSTRAINT borrowed_books_books_FK FOREIGN KEY (book_id) REFERENCES books (book_id)
  , CONSTRAINT borrowed_books_users_FK FOREIGN KEY (user_id) REFERENCES users (user_id)
  );