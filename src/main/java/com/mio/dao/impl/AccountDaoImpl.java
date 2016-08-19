package com.mio.dao.impl;

import com.mio.dao.AccountDao;
import com.mio.domain.Account;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by liuhe on 15/12/20.
 * update
 */
public class AccountDaoImpl  implements AccountDao{

    @Autowired
    private SessionFactory sessionFactory;

    public AccountDaoImpl() {
    }

    public AccountDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }



    public void save(Account account){

        Session currentSession = sessionFactory.getCurrentSession();
//        currentSession.save(account);

    }

    @Override
    public List<Account> getAllAccounts() {
        return null;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
