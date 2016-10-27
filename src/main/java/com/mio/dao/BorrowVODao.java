package com.mio.dao;

import com.mio.domain.BorrowVO;

import java.util.List;

/**
 * Created by liuhe on 2016/10/22.
 * update
 */
public interface BorrowVODao {
    public List<BorrowVO> findBorrowByCondition(Integer customerId);
}
