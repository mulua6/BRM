package com.mio.action;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSONObject;
import com.beust.jcommander.internal.Maps;
import com.mio.domain.Book;
import com.mio.domain.Customer;
import com.mio.service.BookService;
import com.mio.utils.HttpUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

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

    @ResponseBody
    @RequestMapping(value = "findAllBooksAsJson",produces = { "application/json;charset=UTF-8" })
        public String listBooksAsJson(){
            Map<Object, Object> result = Maps.newHashMap();

            List<Book> bookList = bookService.findAllBooks();

            result.put("rows",bookList);
            result.put("total",bookList.size());

            return JSONObject.toJSONString(result);
    }

    /**
     * 模糊匹配 书名 作者名 isbn
     * @param request
     * @return
     */
    @RequestMapping("findBookByInput")
    public ModelAndView listBooks(HttpServletRequest request,String input){
        ModelAndView modelAndView = new ModelAndView();

        List<Book> bookList = bookService.findBookByInput(input);

        modelAndView.addObject("bookList",bookList);

        request.getSession().setAttribute("books",bookList);

        modelAndView.setViewName("book/list");
        return modelAndView;
    }

    /**
     * 模糊匹配 书名 作者名 isbn
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "ajaxFindBookByInput",produces = {" application/json;charset=UTF-8 "})
    public String ajaxFindBookByInput(String input) throws UnsupportedEncodingException {
        Map<Object, Object> result = Maps.newHashMap();

        input = URLDecoder.decode(input,"UTF-8");

        List<Book> bookList = bookService.findBookByInput(input);

        result.put("rows",bookList);
        result.put("total",bookList.size());

        return JSONObject.toJSONString(result);
    }

    @ResponseBody
    @RequestMapping(value = "loadBookInfo",produces = {" application/json;charset=UTF-8 "})
    public String loadBookInfo(Book book) throws UnsupportedEncodingException {
        Map<Object, Object> result = Maps.newHashMap();

        Book b = bookService.findBookByISBN(book.getIsbn());
        book = HttpUtil.dangdangSearch(book);

        Boolean flag = false;

        if(b!=null){
            flag = true;//表示改书已经存在
        }
        result.put("flag",flag);
        result.put("rows",book);
        return JSONObject.toJSONString(result);



    }

    @ResponseBody
    @RequestMapping(value = "ajaxAddBook",produces = {" application/json;charset=UTF-8 "})
    public String ajaxAddBook(Book book) throws UnsupportedEncodingException {
//        book = HttpUtil.dangdangSearch(book);

        book.setStatus("0");//0:正常 1：丢失 2：损坏
        bookService.addBook(book);

        return JSONObject.toJSONString(book);
    }

    @ResponseBody
    @RequestMapping(value = "ajaxEditBook",produces = {" application/json;charset=UTF-8 "})
    public String ajaxEditBook(Book book) {

        bookService.updateBook(book);

        return JSONObject.toJSONString(book);
    }

    @ResponseBody
    @RequestMapping(value = "ajaxDeleteBook",produces = {" application/json;charset=UTF-8 "})
    public String ajaxDeleteBook(Book book) {

        bookService.deleteBook(book.getId());

        return JSONObject.toJSONString(book);
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
