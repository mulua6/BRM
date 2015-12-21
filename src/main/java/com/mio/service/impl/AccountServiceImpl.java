package com.mio.service.impl;

import com.mio.dao.AccountDao;
import com.mio.domain.Account;
import com.mio.service.AccountService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by liuhe on 15/12/20.
 * update
 */

public class AccountServiceImpl implements AccountService {
    private AccountDao accountDao;

    public void save(Account account){
        accountDao.save(account);
    }

    public AccountDao getAccountDao() {
        return accountDao;
    }

    public void setAccountDao(AccountDao accountDao) {
        System.out.println("set Dao fun");
        this.accountDao = accountDao;
    }
}
