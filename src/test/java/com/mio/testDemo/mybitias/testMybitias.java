package com.mio.testDemo.mybitias;

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
        AccountService as = (AccountService)context.getBean("AccountService");


        List<Account> allAccounts = as.getAllAccounts();
        System.out.println(allAccounts.size());

    }
}
