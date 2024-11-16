/* 
2. Заповніть таблиці простими видуманими тестовими даними. Достатньо одного-двох рядків у кожну таблицю.
 */
INSERT INTO
  authors (author_name)
VALUES
  ('Author 1')
, ('Author 2');

INSERT INTO
  genres (genre_name)
VALUES
  ('Genre 1')
, ('Genre 2');

INSERT INTO
  books (title, publication_year, author_id, genre_id)
VALUES
  ('Book 1', '2022', 1, 1)
, ('Book 2', '2022', 2, 2);

INSERT INTO
  users (username, email)
VALUES
  ('User 1', 'user1@example.com')
, ('User 2', 'user2@example.com');

INSERT INTO
  borrowed_books (book_id, user_id, borrow_date, return_date)
VALUES
  (1, 1, '2022-01-01', '2022-01-02')
, (2, 2, '2022-01-01', '2022-01-02');