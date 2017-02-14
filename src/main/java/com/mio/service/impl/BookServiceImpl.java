package com.mio.service.impl;

import com.mio.domain.Book;
import com.mio.domain.BookExample;
import com.mio.mapper.BookMapper;
import com.mio.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public class BookServiceImpl implements BookService{

    @Autowired
    public BookMapper bookMapper;

    @Override
    public List<Book> findAllBooks() {
        return bookMapper.findAllBooksVo();
    }

    @Override
    public void addBook(Book book) {
        bookMapper.insertSelective(book);
    }

    @Override
    public void deleteBook(Integer id) {
        bookMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateBook(Book book) {
        bookMapper.updateByPrimaryKey(book);
    }

    @Override
    public Book findBookById(Integer id) {
        return bookMapper.selectByPrimaryKey(id);
    }

    @Override
    public Book findBookByISBN(String isbn) {
        BookExample bookExample = new BookExample();
        bookExample.createCriteria().andIsbnEqualTo(isbn);

        List<Book> books = bookMapper.selectByExample(bookExample);
        if (books.size()<1){
            return null;
        }
        return books.get(0);

    }

    @Override
    public List<Book> findBookByInput(String input) {
        return bookMapper.findBookByInput("%"+input+"%");
    }
}
