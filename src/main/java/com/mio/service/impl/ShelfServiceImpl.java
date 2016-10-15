package com.mio.service.impl;

import com.mio.domain.Shelf;
import com.mio.domain.ShelfExample;
import com.mio.mapper.ShelfMapper;
import com.mio.service.ShelfService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public class ShelfServiceImpl implements ShelfService{

    @Autowired
    public ShelfMapper shelfMapper;

    @Override
    public List<Shelf> findAllShelfs() {
        return shelfMapper.selectByExample(new ShelfExample());
    }

    @Override
    public void addShelf(Shelf shelf) {
        shelfMapper.insertSelective(shelf);
    }

    @Override
    public void deleteShelf(Integer id) {
        shelfMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateShelf(Shelf shelf) {
        shelfMapper.updateByPrimaryKey(shelf);
    }

    @Override
    public Shelf findShelfById(Integer id) {
        return shelfMapper.selectByPrimaryKey(id);
    }
}
