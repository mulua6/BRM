package com.mio.service.impl;

import com.mio.domain.*;
import com.mio.mapper.BorrowMapper;
import com.mio.mapper.BorrowVOMapper;
import com.mio.mapper.CardMapper;
import com.mio.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public class BorrowServiceImpl implements BorrowService{

    @Autowired
    public BorrowMapper borrowMapper;
    @Autowired
    public BorrowVOMapper borrowVOMapper;
    @Autowired
    public CardMapper cardMapper;


    @Override
    public List<Borrow> findAllBorrows() {
        return borrowMapper.selectByExample(new BorrowExample());
    }

    @Override
    public void addBorrow(Borrow borrow) {
        borrowMapper.insertSelective(borrow);
    }

    @Override
    public void deleteBorrow(Integer id) {
        borrowMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateBorrow(Borrow borrow) {
        borrowMapper.updateByPrimaryKey(borrow);
    }

    @Override
    public Borrow findBorrowById(Integer id) {
        return borrowMapper.selectByPrimaryKey(id);
    }

    @Override
    @SuppressWarnings("all")
    public List<BorrowVO> findBorrowByConditions(String customerName,Integer customerId, Integer bookId, Date startTime, Date endTime,String list) {
        QueryBorrowVO queryBorrowVO = new QueryBorrowVO();
        queryBorrowVO.setBookId(bookId);
        queryBorrowVO.setCustomerId(customerId);
        queryBorrowVO.setCustomerName(customerName);

        if (startTime != null&& endTime != null){
            queryBorrowVO.setStartTime(startTime);
            queryBorrowVO.setEndTime(endTime);
        }else if (startTime != null && endTime == null){
            queryBorrowVO.setStartTime(startTime);
            queryBorrowVO.setEndTime(new Date());
        }else if (endTime != null && startTime == null){
            queryBorrowVO.setStartTime(new Date(1970,1,1));
            queryBorrowVO.setEndTime(endTime);
        }else {
            queryBorrowVO.setStartTime(null);
            queryBorrowVO.setEndTime(null);
        }

        if ("part".equals(list)){
            return  borrowVOMapper.findBorrowByCondition(queryBorrowVO);
        }else {
            //all
            return  borrowVOMapper.findAllBorrowByCondition(queryBorrowVO);
        }

    }

    @Override
    public List<BorrowVO> findExpireBorrow() {


        return borrowVOMapper.findExpireBorrow();
    }

    @Override
    public List<BorrowVO> queryDidNotReturnBorrow(Integer days) {
        return borrowVOMapper.queryDidNotReturnBorrow(days);
    }

    @Override
    public List<Borrow> checkIfBorrowed(Integer customerId, Integer bookId) {

        BorrowExample borrowExample = new BorrowExample();
        borrowExample.createCriteria().andCustomerIdEqualTo(customerId).andBookIdEqualTo(bookId);

        return borrowMapper.selectByExample(borrowExample);
    }

    @Override
    public Boolean checkIfOverCeiling(Customer customer) {

        //查询用户持有的书
        int hold = borrowVOMapper.countHoldBooks(customer.getId());
        //查询用户的上限
        Card card = cardMapper.selectByPrimaryKey(customer.getCardId());
        //用户的上限
        Integer number = card.getNumber();


        return hold >= number;
    }

    @Override
    public List<BorrowVO> findBookRanking() {
        return borrowVOMapper.findBookRanking();
    }

    @Override
    public List<BorrowVO> findCustomerRanking() {
        return borrowVOMapper.findCustomerRanking();
    }
}
