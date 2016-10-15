package com.mio.service.impl;

import com.mio.dao.AccountDao;
import com.mio.domain.Account;
import com.mio.service.AccountService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by liuhe on 15/12/20.
 * update
 */

public class AccountServiceImpl implements AccountService {
    private AccountDao accountDao;

    public void save(Account account){
        accountDao.save(account);
    }

    @Override
    public List<Account> getAllAccounts() {
        return accountDao.getAllAccounts();
    }

    @Override
    public Account findAccount(String id) {
        return null;
    }

    @Override
    public int count() {
        return 0;
    }

    public AccountDao getAccountDao() {
        return accountDao;
    }

    public void setAccountDao(AccountDao accountDao) {
        System.out.println("set Dao fun");
        this.accountDao = accountDao;
    }
}
