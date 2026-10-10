package ru.strong.blokspringdemo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.strong.blokspringdemo.model.Book;
@Repository

public interface BookRepository extends JpaRepository<Book, Integer> {
}
