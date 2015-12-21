package com.mio.dao.impl;

import com.mio.dao.AccountDao;
import com.mio.domain.Account;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

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
        System.out.println("con session fac");
        this.sessionFactory = sessionFactory;
    }



    public void save(Account account){

//        String pathStr = Thread.currentThread().getContextClassLoader().getResource("/").getPath();

//        sessionFactory = new Configuration()
//                .configure(hibernate/hibernate.cfg.xml") // configures settings from hibernate.cfg.xml
//                .buildSessionFactory();



//        getHibernateTemplate().getSessionFactory().getCurrentSession().setFlushMode(Flu‌​shMode.AUTO);
//        Session currentSession = this.getHibernateTemplate().getSessionFactory().

//        currentSession.setFlushMode(FlushMode.AUTO);
//        ThreadLocal<BeanFactory> beanFactoryAwareThreadLocal = new ThreadLocal<BeanFactory>();
//        BeanFactory beanFactory = beanFactoryAwareThreadLocal.get();
//        beanFactory.getBean("sessionFactory");
        Session currentSession = sessionFactory.getCurrentSession();

        currentSession.save(account);

    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        System.out.println("set session factory");
        this.sessionFactory = sessionFactory;
    }
}
