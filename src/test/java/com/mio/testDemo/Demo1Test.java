package com.mio.testDemo;

import com.mio.domain.Account;
import org.testng.annotations.Test;

import java.util.Date;
import java.util.concurrent.DelayQueue;

/**
 * Created by liuhe on 15/12/19.
 */
public class Demo1Test {




    @Test
    public void testDelayQueue(){

        DelayQueue<Account> accounts = new DelayQueue<Account>();

        Account account = new Account();
        account.setRealName("zhangsan");

        accounts.add(account);


        System.out.println(new Date());

        Account a = accounts.peek();
        System.out.println(a.getRealName());

        System.out.println(new Date());

    }





}
