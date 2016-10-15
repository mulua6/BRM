package com.mio.testDemo;

import com.mio.domain.Account;
import org.testng.annotations.Test;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
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


    @Test
    public void testName() throws Exception {
        ArrayList<Integer> list = new ArrayList<>();

        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);

        Iterator<Integer> iterator = list.iterator();
        while (iterator.hasNext()){
            Integer next = iterator.next();

            iterator.remove();
//            list.remove(next);


        }



    }
}
