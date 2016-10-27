package com.mio.service;

import com.mio.domain.Borrow;
import com.mio.domain.BorrowVO;
import com.mio.domain.Customer;

import java.util.Date;
import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public interface BorrowService {
    List<Borrow> findAllBorrows();

    void addBorrow(Borrow borrow);

    void deleteBorrow(Integer id);

    void updateBorrow(Borrow borrow);

    Borrow findBorrowById(Integer id);


    List<BorrowVO> findBorrowByConditions(String customerName,Integer customerId, Integer bookId, Date startTime, Date endTIme,String list);

    List<BorrowVO> findExpireBorrow();

    List<BorrowVO> queryDidNotReturnBorrow(Integer days);

    /**
     * 查询该用户是否借过这本书
     *
     * @param customerId
     * @param bookId
     * @return
     */
    List<Borrow> checkIfBorrowed(Integer customerId, Integer bookId);

    /**
     * 判断该用户持有的书是否达到上限
     * @param customer
     * @return true:达到上限 false：没有达到上限
     */
    Boolean checkIfOverCeiling(Customer customer);

    List<BorrowVO> findBookRanking();

    List<BorrowVO> findCustomerRanking();
}
