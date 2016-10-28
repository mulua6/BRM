package com.mio.service;

import com.mio.domain.Book;

import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public interface BookService {
    List<Book> findAllBooks();

    void addBook(Book book);

    void deleteBook(Integer id);

    void updateBook(Book book);

    Book findBookById(Integer id);
    Book findBookByISBN(String isbn);


    List<Book> findBookByInput(String input);
}
