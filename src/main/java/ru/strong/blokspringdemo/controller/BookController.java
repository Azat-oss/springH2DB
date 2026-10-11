package ru.strong.blokspringdemo.controller;

import org.springframework.ui.Model;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.strong.blokspringdemo.model.Book;
import ru.strong.blokspringdemo.repository.BookRepository;
import org.springframework.validation.BindingResult;
import ru.strong.blokspringdemo.repository.ReviewRepository;


@Controller
@RequestMapping("/books")


public class BookController {
    private final BookRepository bookRepository;
    private final ReviewRepository reviewRepository;

    public BookController(BookRepository bookRepository, ReviewRepository reviewRepository) {
        this.bookRepository = bookRepository;
        this.reviewRepository = reviewRepository;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("books", bookRepository.findAll());
        return "books/list";
    }

    @GetMapping("/{id}")
    public String viewBook(@PathVariable Integer id, Model model) {
        Book book = bookRepository.findById(id).orElseThrow();
        model.addAttribute("book", book);
        model.addAttribute("reviews", reviewRepository.findByBookIdOrderByCreatedAtDesc(id));
        return "books/view";
    }

    @GetMapping("/new")
    public String createForm(Model model) {
        model.addAttribute("book", new Book());
        return "books/form";
    }

    @PostMapping
    public String create(Book book) {
        bookRepository.save(book);
        return "redirect:/books";
    }

    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Integer id) {
        bookRepository.deleteById(id);
        return "redirect:/books";
    }

}
