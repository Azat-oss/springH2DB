package ru.strong.blokspringdemo.controller;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.strong.blokspringdemo.model.Book;
import ru.strong.blokspringdemo.model.Review;
import ru.strong.blokspringdemo.model.User;
import ru.strong.blokspringdemo.repository.BookRepository;
import ru.strong.blokspringdemo.repository.ReviewRepository;
import ru.strong.blokspringdemo.repository.UserRepository;

import java.time.LocalDateTime;

@Controller
@RequestMapping("/reviews")

public class ReviewController {
    private final ReviewRepository reviewRepository;
    private final BookRepository bookRepository;
    private final UserRepository userRepository;

    public ReviewController(ReviewRepository reviewRepository, BookRepository bookRepository, UserRepository userRepository) {
        this.reviewRepository = reviewRepository;
        this.bookRepository = bookRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/all")
    public String allReviews(Model model) {
        model.addAttribute("reviews", reviewRepository.findAllByOrderByCreatedAtDesc());
        return "reviews/all";
    }


    @GetMapping("/new")
    public String createForm(@RequestParam Integer bookId, Model model) {
        model.addAttribute("bookId", bookId);
        model.addAttribute("review", new Review());
        return "reviews/form";
    }


    @PostMapping("")
    public String create(
            @RequestParam Integer rating,
            @RequestParam(required = false) String comment,
            @RequestParam Integer bookId,
            @AuthenticationPrincipal UserDetails currentUser) {

        User user = userRepository.findByUsername(currentUser.getUsername()).orElseThrow();
        Book book = bookRepository.findById(bookId).orElseThrow();

        Review review = new Review();
        review.setBook(book);
        review.setUser(user);
        review.setRating(rating);
        review.setComment(comment);
        review.setCreatedAt(LocalDateTime.now());

        reviewRepository.save(review);

        return "redirect:/books/" + bookId;
    }


    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Integer id, @RequestParam Integer bookId) {
        reviewRepository.deleteById(id);
        return "redirect:/books/" + bookId;
    }
}
