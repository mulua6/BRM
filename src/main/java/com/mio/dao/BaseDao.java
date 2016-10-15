package com.mio.dao;

import java.util.List;

/**
 * Created by liuhe on 2016/10/9.
 * update
 */
public interface BaseDao<T> {
    public void save(T t);
    public void delete(int id);
    public void update(T t);
    public List<T> findAll();
    public List<T> findByCondition(String str);
    public T findById(int id);

}
