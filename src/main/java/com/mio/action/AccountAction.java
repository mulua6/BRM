package com.mio.action;

import com.mio.domain.Account;
import com.mio.service.AccountService;
import org.hibernate.SessionFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;

/**
 * Created by liuhe on 15/12/20.
 * update
 */
@Controller
@RequestMapping("/")
@Transactional("tx")
public class AccountAction implements BeanFactoryAware {

private AccountService accountService;
    private BeanFactory beanFactorys;

    @RequestMapping("book")
    public String index(){

//        ServletActionCont
        String pathStr = Thread.currentThread().getContextClassLoader().getResource("/").getPath();

        Path path = Paths.get(pathStr,"mimi.txt");
        Path fileName = path.getFileName();
        System.out.println("it works ");
        System.out.println(fileName);
        System.out.println(path.toAbsolutePath());
        System.out.println(path.toFile().exists());

        File file = path.toFile();

        Scanner scanner = null;
        try {
            scanner = new Scanner(path.toAbsolutePath(),"utf-8");
        } catch (IOException e) {
            e.printStackTrace();
        }


        AccountService accountService = (AccountService)beanFactorys.getBean("accountService");

        SessionFactory sessionFactory =(SessionFactory) beanFactorys.getBean("sessionFactory");
//        Session session = sessionFactory.getCurrentSession();

        Account account = new Account();
        while (scanner.hasNext()){

            String line = scanner.nextLine();
            String[] accounts = line.split("----");
            System.out.println(accounts[0]);

            account.setEmail(accounts[0]);
            account.setUsername(accounts[1]);
//            try {
//                account.setRealName(new String(String.valueOf(accounts[2]).getBytes("utf-8"),"utf-8"));
//                System.out.println(account.getRealName());
//            } catch (UnsupportedEncodingException e) {
//                e.printStackTrace();
//            }
            account.setRealName(accounts[2]);
            account.setCardId(accounts[3]);
            account.setPassword(accounts[4]);
            account.setPhone(accounts[5]);
            account.setEmail2(accounts[6]);

//            session.save(account);
//
            accountService.save(account);
        }


        return "index";
    }


    public AccountService getAccountService() {
        System.out.println("get fun");
        return accountService;

    }

    public void setAccountService(AccountService accountService) {
        System.out.println("set fun");
        this.accountService = accountService;
    }

    public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
        beanFactorys =  beanFactory;
    }
}
