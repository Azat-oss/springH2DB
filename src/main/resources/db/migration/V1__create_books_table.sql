CREATE TABLE books (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       book_name VARCHAR(255) NOT NULL,
                       author_name VARCHAR(255) NOT NULL,
                       release_year INT NOT NULL,
                       genre VARCHAR(255) NOT NULL,
                       page_count INT NOT NULL,
                       description TEXT
);