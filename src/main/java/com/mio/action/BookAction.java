package com.mio.action;

import com.mio.domain.Book;
import com.mio.service.BookService;
import com.mio.utils.HttpUtil;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

/**
 * Created by liuhe on 16/10/11.
 * update
 */
@Controller
@RequestMapping("/bookAction")
public class BookAction {

    @Autowired
    public BookService bookService;

    @RequestMapping("findAllBooks")
    public ModelAndView listBooks(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        List<Book> bookList = bookService.findAllBooks();

        modelAndView.addObject("bookList",bookList);

        request.getSession().setAttribute("books",bookList);

        modelAndView.setViewName("book/list");
        return modelAndView;
    }

    @RequestMapping("addBook")
    public String addBook(Book book,HttpServletRequest request){
        book = HttpUtil.dangdangSearch(book);


        book.setStatus("0");//0:正常 1：丢失 2：损坏
        book.setPackaging("精装");//默认是精装
        bookService.addBook(book);


        //为了继续添加保持书室和书架的状态
        request.getSession().setAttribute("book",book);
        return "book/preAdd";
    }

    @RequestMapping("addBookBackToList")
    public String addBookBackToList(Book book){
        book = HttpUtil.dangdangSearch(book);


        book.setStatus("0");//0:正常 1：丢失 2：损坏 3:外借
        bookService.addBook(book);
        return "redirect:/bookAction/findAllBooks.action";
    }

    @RequestMapping("deleteBook")
    public String bookBook(Book book){
        bookService.deleteBook(book.getId());
        return "redirect:/bookAction/findAllBooks.action";
    }
    @RequestMapping("updateBook")
    public String updateBook(Book book){
        bookService.updateBook(book);
        return "redirect:/bookAction/findAllBooks.action";
    }
    @RequestMapping("preUpdateBook")
    public ModelAndView preUpdateBook(Integer id){

        Book book = bookService.findBookById(id);
        ModelAndView modelAndView = new ModelAndView("book/update");
        modelAndView.addObject("book",book);
        return modelAndView;
    }
}
