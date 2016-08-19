package com.mio.dao.impl;

import com.mio.dao.AccountDao;
import com.mio.domain.Account;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by liuhe on 15/12/20.
 * update
 */
public class AccountDaoMybitasImpl implements AccountDao{

    @Autowired
    private SqlSessionFactory sessionFactory;

    public AccountDaoMybitasImpl() {
    }

    @Override
    public void save(Account account) {

    }

    @Override
    public List<Account> getAllAccounts() {
        SqlSession session = sessionFactory.openSession();
        AccountDao mapper = session.getMapper(AccountDao.class);

        List<Account> allAccounts = mapper.getAllAccounts();
//        System.out.println(allAccounts.size());
        return allAccounts;
    }
}
