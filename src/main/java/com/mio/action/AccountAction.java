package com.mio.action;

import com.mio.domain.Account;
import com.mio.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
public class AccountAction  {

    @Autowired
    private AccountService accountService;

    @RequestMapping("book")
    public String index(){

        String pathStr = Thread.currentThread().getContextClassLoader().getResource("/").getPath();

        Path path = Paths.get(pathStr,"mimi.txt");
        Scanner scanner = null;
        try {
            scanner = new Scanner(path.toAbsolutePath(),"utf-8");
        } catch (IOException e) {

            e.printStackTrace();
        }

        Account account = new Account();
//        while (scanner.hasNext()){
            for (int i = 0; i <10 ; i++) {

            String line = scanner.nextLine();
            String[] accounts = line.split("----");
            System.out.println(accounts[0]);

            account.setEmail(accounts[0]);
            account.setUsername(accounts[1]);
            account.setRealName(accounts[2]);
            account.setCardId(accounts[3]);
            account.setPassword(accounts[4]);
            account.setPhone(accounts[5]);
            account.setEmail2(accounts[6]);

            accountService.save(account);
        }


        return "index";
    }


    public AccountService getAccountService() {
        return accountService;

    }

    public void setAccountService(AccountService accountService) {
        this.accountService = accountService;
    }

}
