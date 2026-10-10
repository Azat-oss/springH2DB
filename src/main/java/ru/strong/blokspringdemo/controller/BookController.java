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



@Controller
@RequestMapping("/books")


public class BookController {
    private final BookRepository bookRepository;

    public BookController(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }


    @GetMapping
    public String list(Model model) {
        model.addAttribute("books", bookRepository.findAll());
        return "books/list";
    }


    @GetMapping("/new")
    public String createForm(Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("mode", "create");
        return "books/form";
    }


    @PostMapping
    public String create(@Valid Book book, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("mode", "create");
            return "books/form";
        }
        bookRepository.save(book);
        return "redirect:/books";
    }


    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Integer id) {
        bookRepository.deleteById(id);
        return "redirect:/books";
    }

}
