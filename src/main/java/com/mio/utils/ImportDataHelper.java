package com.mio.utils;

import com.mio.domain.Book;
import com.mio.domain.Card;
import com.mio.domain.Customer;
import com.mio.domain.Payment;
import com.mio.service.BookService;
import com.mio.service.CardService;
import com.mio.service.CustomerService;
import com.mio.service.PaymentService;
import com.mio.service.impl.BookServiceImpl;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import org.joda.time.DateTime;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.testng.annotations.Test;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by liuhe on 2016/10/28.
 * update
 */
public class ImportDataHelper {



    @Test
    public static void importBooks() {
        int i;
        Sheet sheet;
        Workbook book;
        Cell cell1,cell2,cell3,cell4,cell5,cell6;
        try {
            //t.xls为要读取的excel文件名

            String path = ImportDataHelper.class.getClassLoader().getResource("books.xls").getPath();
            book= Workbook.getWorkbook(new File(path));

            //获得第一个工作表对象(ecxel中sheet的编号从0开始,0,1,2,3,....)
            sheet=book.getSheet(0);
            //获取左上角的单元格
            cell1=sheet.getCell(0,0);
            System.out.println("标题："+cell1.getContents());

            String xml = ImportDataHelper.class.getClassLoader().getResource("applicationContext.xml").getPath();

            ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
            BookService bookService = (BookService) ac.getBean("bookService");
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            i=1;
            while(true)
            {
                //获取每一行的单元格
                cell1=sheet.getCell(0,i);//（列，行）
                cell2=sheet.getCell(1,i);
                cell3=sheet.getCell(2,i);
                cell4=sheet.getCell(9,i);
                cell5=sheet.getCell(11,i);
                cell6=sheet.getCell(7,i);//作者


                Book book1 = new Book();
                book1.setIsbn(cell3.getContents());
                book1 = HttpUtil.dangdangSearch(book1);


                book1.setBookName(cell2.getContents());
                book1.setStatus("0");//0:正常 1：丢失 2：损坏
                book1.setPackaging(cell4.getContents());//默认是精装
                System.out.println("hang"+i+" ------"+cell5.getContents());

                if (cell5.getContents()==null||"".equals(cell5.getContents().trim())){

                }else {
                    book1.setPublishTime(simpleDateFormat.parse(cell5.getContents().trim()));
                }
                    book1.setAuthor(cell6.getContents());


                //TODO 没有设置阅览室 和书架
                bookService.addBook(book1);



                if("".equals(cell1.getContents())==true)    //如果读取的数据为空
                    break;
                System.out.println(cell1.getContents()+"\t"+cell2.getContents()+"\t"+cell3.getContents());
                i++;
            }
            book.close();
        }
        catch(Exception e)  {
            e.printStackTrace();
        }
    }

    @Test
    public static void importCustomers() {
        int i;
        Sheet sheet;
        Workbook book;
        Cell cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8,cell9;
        try {
            //t.xls为要读取的excel文件名

            String path = ImportDataHelper.class.getClassLoader().getResource("customers.xls").getPath();
            book= Workbook.getWorkbook(new File(path));

            //获得第一个工作表对象(ecxel中sheet的编号从0开始,0,1,2,3,....)
            sheet=book.getSheet(0);
            //获取左上角的单元格
            cell1=sheet.getCell(0,0);
            System.out.println("标题："+cell1.getContents());

            String xml = ImportDataHelper.class.getClassLoader().getResource("applicationContext.xml").getPath();

            ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
            CustomerService customerService = (CustomerService) ac.getBean("customerService");
            CardService cardService = (CardService) ac.getBean("cardService");
            PaymentService paymentService = (PaymentService) ac.getBean("paymentService");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            i=1;
            while(true)
            {
                //获取每一行的单元格
                cell1=sheet.getCell(1,i);//（列，行）卡号
                cell2=sheet.getCell(2,i);//姓名
                cell3=sheet.getCell(4,i);//性别
                cell4=sheet.getCell(5,i);//套餐
                cell5=sheet.getCell(7,i);//手机号
//                cell6=sheet.getCell(11,i);//押金
                cell7=sheet.getCell(12,i);//生日
                cell8=sheet.getCell(15,i);//地址
                cell9=sheet.getCell(19,i);//加入日期


                Customer customer = new Customer();

                customer.setCustomerName(cell2.getContents());
                customer.setStatus("0");
                customer.setAddress(cell8.getContents());
                customer.setBirthday(sdf.parse(cell7.getContents()));
                customer.setNumber(Integer.parseInt(cell1.getContents()));
                customer.setPhone(cell5.getContents());
                customer.setOther("");
                customer.setSex("男".equals(cell3.getContents())?1:0);
                customer.setCardId("8".equals(cell4.getContents())?1:2);


                DateTime today = new DateTime(sdf.parse(cell9.getContents()));
                customer.setCreateTime(today.toDate());

                //设置到期时间 默认一年后到期
                customer.setExpireTime(today.plusYears(1).toDate());

                //根据套餐类型设置押金
                Card card = cardService.findCardById(customer.getCardId());
                customer.setDeposit(card.getDeposit());
                customerService.addCustomer(customer);

                customer = customerService.findCustomerByCardNumber(customer.getNumber());

                Payment payment = new Payment();
                payment.setDeposit(customer.getDeposit());
                payment.setCustomerId(customer.getId());
                payment.setReason("读者注册，缴纳套餐费和押金");
                payment.setOther("千万不要删除！！！");
                payment.setTime(new Date());
                payment.setMoney(card.getPrice());
                paymentService.simpleAddPayment(payment);



                if("".equals(cell1.getContents())==true)    //如果读取的数据为空
                    break;
                System.out.println(cell1.getContents()+"\t"+cell2.getContents()+"\t"+cell3.getContents());
                i++;
            }
            book.close();
        }
        catch(Exception e)  {
            e.printStackTrace();
        }
    }



}
