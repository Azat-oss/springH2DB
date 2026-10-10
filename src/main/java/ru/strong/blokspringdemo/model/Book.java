package ru.strong.blokspringdemo.model;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;


import java.time.LocalDate;
import lombok.NoArgsConstructor;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "books")

public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @Column(name = "book_name", nullable = false)
    String bookName;

    @Column(name = "author_name", nullable = false)
    String authorName;

    @Column(name = "release_year", nullable = false)
    Integer releaseYear;

    @Column(name = "genre", nullable = false)
    String genre;

    @Column(name = "page_count", nullable = false)
    Integer pageCount;

    @Column(name = "description", columnDefinition = "TEXT")
    String description;

}
