package com.mio.mapper;

import com.mio.domain.BorrowVO;
import com.mio.domain.QueryBorrowVO;

import java.util.List;

/**
 * Created by liuhe on 2016/10/22.
 * update
 */
public interface BorrowVOMapper {

    public List<BorrowVO> findBorrowByCondition(QueryBorrowVO queryBorrowVO);

    List<BorrowVO> findExpireBorrow();

    List<BorrowVO> queryDidNotReturnBorrow(Integer days);

    int countHoldBooks(Integer customerId);
}
