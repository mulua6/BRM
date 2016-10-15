package com.mio.service;

import com.mio.domain.Shelf;

import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public interface ShelfService {
    List<Shelf> findAllShelfs();

    void addShelf(Shelf shelf);

    void deleteShelf(Integer id);

    void updateShelf(Shelf shelf);

    Shelf findShelfById(Integer id);
}
