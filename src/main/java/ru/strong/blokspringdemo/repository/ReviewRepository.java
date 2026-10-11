package ru.strong.blokspringdemo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.strong.blokspringdemo.model.Review;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Integer> {
    List<Review> findByBookIdOrderByCreatedAtDesc(Integer bookId);
    List<Review> findAllByOrderByCreatedAtDesc();
}
