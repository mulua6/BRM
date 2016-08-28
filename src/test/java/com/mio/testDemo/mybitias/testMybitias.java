package com.mio.testDemo.mybitias;

import com.mio.dao.AccountMapper;
import com.mio.domain.Account;
import com.mio.service.AccountService;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.testng.annotations.Test;

import java.util.List;

/**
 * Created by liuhe on 16/8/19.
 * update
 */
public class testMybitias {





@Test
    public void testmybitas1(){

        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        AccountMapper as = (AccountMapper)context.getBean("accountMapper");


    Account account = as.getAccount("1333");
    System.out.println(account.getPhone());


    System.out.println(testMybitias.class.getClassLoader().getResource(""));

//    this.getClass().getResource("")

    }
}
