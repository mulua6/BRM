package com.mio.action;

import com.mio.domain.*;
import com.mio.service.BookService;
import com.mio.service.BorrowService;
import com.mio.service.CustomerService;
import com.mio.service.DeductionService;
import com.mio.utils.ConfHelper;
import com.sun.org.apache.regexp.internal.RE;
import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.Period;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by liuhe on 16/10/11.
 * update
 */
@Controller
@RequestMapping("/borrowAction")
public class BorrowAction {

    @Autowired
    public BorrowService borrowService;

    @Autowired
    public CustomerService customerService;

    @Autowired
    public BookService bookService;

    @Autowired
    public DeductionService deductionService;

    @RequestMapping("findAllBorrows")
    public ModelAndView listBorrows(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        List<Borrow> borrowList = borrowService.findAllBorrows();

        modelAndView.addObject("borrowList",borrowList);

        request.getSession().setAttribute("borrows",borrowList);

        modelAndView.setViewName("borrow/list");
        return modelAndView;
    }
    @RequestMapping("queryBorrow")
    public ModelAndView queryBorrow(Integer cardNumber,
                                        String customerName,
                                        String isbn,
                                        @DateTimeFormat(pattern="yyyy-MM-dd")Date startTime,
                                        @DateTimeFormat(pattern="yyyy-MM-dd")Date endTime,
                                        String list,
                                    HttpServletRequest request){
            ModelAndView modelAndView = new ModelAndView();


        Customer customer = new Customer();
        Book book = new Book();

        if(cardNumber!=null){
            customer = customerService.findCustomerByCardNumber(cardNumber);

            if (customer==null){
                request.getSession().setAttribute("msg","不存在该用户，请确认!");
                return new ModelAndView("massage");
            }
        }
        if (isbn!=null&&isbn!=""){
            book = bookService.findBookByISBN(isbn);
            if (book==null){
                request.getSession().setAttribute("msg","不存在该书，请确认!");
                return new ModelAndView("massage");
            }
        }


        List<BorrowVO> borrowVOList = borrowService.findBorrowByConditions(customerName,customer.getId(),book.getId(),startTime, endTime,list);



            modelAndView.addObject("borrowVOList",borrowVOList);

            modelAndView.setViewName("borrow/list");
            return modelAndView;
        }
    @RequestMapping("queryExpireBorrow")
    public ModelAndView  queryExpireBorrow(ModelAndView modelAndView){

        List<BorrowVO> borrowVOList = borrowService.findExpireBorrow();
        modelAndView.addObject("borrowVOList",borrowVOList);
        modelAndView.addObject("title","逾期未还还图书");
        modelAndView.setViewName("statistical/list");
        return modelAndView;
    }

    @RequestMapping("queryBookRanking")
    public ModelAndView queryBookRanking(ModelAndView modelAndView){

        List<BorrowVO> borrowVOList = borrowService.findBookRanking();
        modelAndView.addObject("borrowVOList",borrowVOList);
        modelAndView.addObject("title","图书借阅排行");
        modelAndView.setViewName("statistical/bookRankingList");
        return modelAndView;
    }
    @RequestMapping("queryCustomerRanking")
    public ModelAndView queryCustomerRanking(ModelAndView modelAndView){

        List<BorrowVO> borrowVOList = borrowService.findCustomerRanking();
        modelAndView.addObject("borrowVOList",borrowVOList);
        modelAndView.addObject("title","读者借阅排行");
        modelAndView.setViewName("statistical/customerRankingList");
        return modelAndView;
    }
    @RequestMapping("queryDidNotReturnBorrow")
    public ModelAndView queryExpireBorrow(Integer days){
        ModelAndView modelAndView = new ModelAndView();
        List<BorrowVO> borrowVOList = borrowService.queryDidNotReturnBorrow(days);
        modelAndView.addObject("borrowVOList",borrowVOList);
        modelAndView.addObject("title",days+"天内应还图书");

        modelAndView.setViewName("statistical/list");
        return modelAndView;
    }

    @RequestMapping("addBorrow")
    public String addBorrow(Integer cardNumber,String isbn,HttpServletRequest request){

        //判断书的状态 //0:正常 1：丢失 2：损坏 3:表示图书外借
        Book bookByISBN = bookService.findBookByISBN(isbn);
        if ("2".equals(bookByISBN.getStatus())){
            request.getSession().setAttribute("msg","该书已经损坏，暂时不能外借!");
            return "massage";
        }



        //判断该用户是否还可以借书


        //判断用户是否存在
        Customer customer = customerService.findCustomerByCardNumber(cardNumber);
        if (customer==null){
            request.getSession().setAttribute("msg","不存在该用户，请确认!");
            return "massage";
        }

        //1 逾期
        DateTime dateTime = new DateTime(customer.getExpireTime());
        if (dateTime.isBeforeNow()||"2".equals(customer.getStatus())){
            request.getSession().setAttribute("msg","该用户已经到期，暂时不能借书，请续费!");
            return "massage";
        }


        /**
         * 0:正常
         * 1:挂失
         * 2:逾期
         */
        //2 挂失
        if ("1".equals(customer.getStatus())){
            request.getSession().setAttribute("msg","该用户已经挂失，暂时不能借书！");

            return "massage";
        }

        //3 数量达到上限
        Boolean aBoolean = borrowService.checkIfOverCeiling(customer);
        if (aBoolean){
            request.getSession().setAttribute("msg","该用户已经达到借书上限，请归还后再借书！");
            return "massage";
        }


        //4 押金小于50元是不许借书
        if (customer.getDeposit()<50){
            request.getSession().setAttribute("msg","该用户押金小于50元，暂时不能借书！");
            return "massage";
        }


        //判断是否借过 通过ajax做

        Borrow borrow = new Borrow();

        borrow.setCustomerId(customer.getId());
        borrow.setBookId(bookService.findBookByISBN(isbn).getId());


        DateTime today = new DateTime();

        borrow.setBorrowTime(today.toDate());
        borrow.setExpireTime(today.plusDays(10).toDate());

        //书的状态 默认是完好的，没有损坏的
        borrow.setStatus(Boolean.TRUE);
        borrow.setDays(10);

        borrowService.addBorrow(borrow);



        // 更新图书状态为3 表示图书外借
        Book book = bookService.findBookByISBN(isbn);
        book.setStatus("3");
        bookService.updateBook(book);


        request.getSession().setAttribute("cardNumber",cardNumber);

        return "borrow/add";
    }

    @RequestMapping("addBorrowBackToList")
    public String addBorrowBackToList(String cardNumber,String isbn){




        return "redirect:/borrowAction/findAllBorrows.action";
    }

    @RequestMapping("deleteBorrow")
    public String borrowBorrow(Borrow borrow){
        borrowService.deleteBorrow(borrow.getId());
        return "redirect:/borrowAction/findAllBorrows.action";
    }
    @RequestMapping("updateBorrow")
    public String updateBorrow(Borrow borrow){
        borrowService.updateBorrow(borrow);
        return "redirect:/borrowAction/findAllBorrows.action";
    }


    @RequestMapping("backBorrow")
    public String backBorrow(Integer id){
        Borrow borrow = borrowService.findBorrowById(id);
        Customer customer = customerService.findCustomerById(borrow.getCustomerId());

        //判断是否逾期  是否需要扣除押金
        overDueCheck(customer,borrow);

        //跟新图书状态 改为0 表示正常在馆
        Book book = bookService.findBookById(borrow.getBookId());
        book.setStatus("0");
        bookService.updateBook(book);

        borrow.setBackTime(new Date());
        borrowService.updateBorrow(borrow);

        //跳转到用户借阅列表页面
        return "redirect:/borrowAction/queryBorrow.action?cardNumber="+customer.getNumber();

    }
    @RequestMapping("renewBorrow")
    public String renewBorrow(Integer id){
        Borrow borrow = borrowService.findBorrowById(id);

        Date expireTime = borrow.getExpireTime();

        DateTime renewDate = new DateTime(expireTime).plusDays(ConfHelper.getIntConfig("renew.borrow"));

        borrow.setExpireTime(renewDate.toDate());
        borrowService.updateBorrow(borrow);

        //跳转到用户借阅列表页面
        Customer customer = customerService.findCustomerById(borrow.getCustomerId());
//        queryBorrow(customer.getNumber(),null,null,null);
        return "redirect:/borrowAction/queryBorrow.action?cardNumber="+customer.getNumber();

    }

    @RequestMapping("preUpdateBorrow")
    public ModelAndView preUpdateBorrow(Integer id){

        Borrow borrow = borrowService.findBorrowById(id);
        ModelAndView modelAndView = new ModelAndView("borrow/update");
        modelAndView.addObject("borrow",borrow);
        return modelAndView;
    }


    /**
     * 押金扣除
     * @param op 0:丢失 1:损坏
     * @return
     */
    @RequestMapping("preLostBorrow")
    public ModelAndView preLostBorrow(BorrowVO borrowVO,Integer op){

        ModelAndView modelAndView = new ModelAndView("statistical/addDeduction");

        if(0 == op){
            modelAndView.addObject("reason","图书丢失");
        }else if (1 == op){
            modelAndView.addObject("reason","图书损坏");
        }
        modelAndView.addObject("op",op);

        modelAndView.addObject("borrowVO",borrowVO);
        return modelAndView;
    }

    /**
     *
     * @param op 0:丢失 1:损坏
     * @return
     */
    @RequestMapping("deduction")
    public ModelAndView deduction(BorrowVO borrowVO,Integer op,Double money,String reason){

        ModelAndView modelAndView = new ModelAndView("statistical/queryButtons");

        Customer customer = customerService.findCustomerByCardNumber(borrowVO.getCardNumber());
        Book book = bookService.findBookByISBN(borrowVO.getIsbn());



        //保存扣费记录
        Deduction deduction = new Deduction();
        deduction.setCustomerId(customer.getId());
        deduction.setBookId(book.getId());

        deduction.setBorrowId(borrowVO.getId());
        deduction.setCreateTime(new Date());
        deduction.setMoney(money);
        deduction.setReason(reason);
        deductionService.addDeduction(deduction);

        //扣除用户的押金
        customer.setDeposit(customer.getDeposit()-money);
        customerService.updateCustomer(customer);


        //把书还了
        Borrow borrow = borrowService.findBorrowById(borrowVO.getId());
        borrow.setBackTime(new Date());

        /**
         * 归还时
         * true 书完好
         * false 书损坏或丢失
         */
        borrow.setStatus(false);
        borrowService.updateBorrow(borrow);

        //0:丢失 1:损坏
        //跟新书的状态 //0:正常 1：丢失 2：损坏
        int status = ((int)op) + 1;
        book.setStatus(String.valueOf(status));
        bookService.updateBook(book);

        //如果逾期 扣除逾期的费用
        overDueCheck(customer,borrow);

        return modelAndView;
    }


    /**
     *
     * @param borrowId
     * @return 如果没有过期返回0 如果过期返回 天数*1元
     */
    private Double getDeductionMoney(Integer borrowId){

        Borrow borrow = borrowService.findBorrowById(borrowId);
        DateTime expireTime = new DateTime(borrow.getExpireTime());
        DateTime today = new DateTime(new Date());

        Double money = 0d;

        //过期
        if(expireTime.isBeforeNow()){
//            Period period = new Period(today, expireTime);

            int days = Math.abs(Days.daysBetween(today,expireTime).getDays());
            //每天扣除一块钱
            money = Double.parseDouble(days * 1 + "");
        }

        //如果没有过期返回0
        return money;

    }


    /**
     *
     * @param customer
     * @param borrow
     */
    public void overDueCheck(Customer customer,Borrow borrow){

        DateTime expireTime = new DateTime(borrow.getExpireTime());
        DateTime today = new DateTime(new Date());
        //过期
        if (expireTime.isBeforeNow()){


            Double money = getDeductionMoney(borrow.getId());

            //保存扣费记录
            Deduction deduction = new Deduction();
            deduction.setCustomerId(customer.getId());
            deduction.setBookId(borrow.getBookId());

            deduction.setBorrowId(borrow.getId());
            deduction.setCreateTime(new Date());
            deduction.setMoney(money);
            deduction.setReason("借书逾期");
            deductionService.addDeduction(deduction);

            //扣除用户的押金
            customer.setDeposit(customer.getDeposit()-money);
            customerService.updateCustomer(customer);
        }


    }

    /**
     * 检查用户是否借过该书
     */
    @RequestMapping(value = "checkIfBorrowed",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String checkIfBorrowed(Integer cardNumber,String isbn,HttpServletRequest request){

        Customer customer = customerService.findCustomerByCardNumber(cardNumber);
        if (customer==null){
            return "不存在该用户，请确认!";
        }

        Book book = bookService.findBookByISBN(isbn);
        if (book == null){
            return "不存在该书，请确认!";
        }

        List<Borrow> borrows = borrowService.checkIfBorrowed(customer.getId(),book.getId());
        if (borrows.size()<1){
            return "0";//表示没有借过这本书
        }else{
            return "1";//表示借过这本书
        }



    }
}
