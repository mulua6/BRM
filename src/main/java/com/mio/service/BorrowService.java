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
    List<BorrowVO> checkIfBorrowed(Integer customerId, Integer bookId);

    /**
     * 判断该用户持有的书是否达到上限
     * @param customer
     * @return true:达到上限 false：没有达到上限
     */
    Boolean checkIfOverCeiling(Customer customer);

    List<BorrowVO> findBookRanking();

    List<BorrowVO> findCustomerRanking();

    BorrowVO findBorrowVOById(Integer id);

    /**
     * 根据读者查询该读者借出并且没有归还的书
     * @param customerId
     * @param history 0:只查询没有归还的，1：所有的借书记录
     * @return
     */
    List<BorrowVO> findBorrowByCustomer(Integer customerId,String history);
}
