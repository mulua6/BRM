package com.mio.service.impl;

import com.mio.dao.AccountDao;
import com.mio.dao.AccountMapper;
import com.mio.domain.Account;
import com.mio.service.AccountService;

import java.util.List;

/**
 * Created by liuhe on 15/12/20.
 * update
 */

public class AccountServiceMybatisImpl implements AccountService {
    private AccountMapper accountMapper;


    @Override
    public void save(Account account) {

    }

    @Override
    public List<Account> getAllAccounts() {
        return null;
    }

    @Override
    public Account findAccount(String id){
        return accountMapper.getAccount(id);
    }

    public AccountMapper getAccountMapper() {
        return accountMapper;
    }

    public void setAccountMapper(AccountMapper accountMapper) {
        this.accountMapper = accountMapper;
    }
}
