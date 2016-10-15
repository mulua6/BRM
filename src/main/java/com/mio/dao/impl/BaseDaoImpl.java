package com.mio.dao.impl;

import com.mio.dao.BaseDao;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by liuhe on 2016/10/9.
 * update
 */
public class BaseDaoImpl implements BaseDao{


    @Autowired
    private SqlSessionFactory sessionFactory;

    @Override
    public void save(Object o) {
//        sessionFactory.openSession().getMapper().
    }

    @Override
    /**
     * delete by ids
     */
    public void delete(int id) {

    }

    @Override
    public void update(Object o) {

    }

    @Override
    public List findAll() {
        return null;
    }

    @Override
    public List findByCondition(String str) {
        return null;
    }

    @Override
    public Object findById(int id) {
        return null;
    }
}
