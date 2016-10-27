package com.mio.dao.impl;

import com.mio.dao.BorrowVODao;
import com.mio.domain.BorrowVO;
import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;

/**
 * Created by liuhe on 2016/10/22.
 * update
 */
public class BorrowVODaoImpl extends SqlSessionDaoSupport implements BorrowVODao {
    @Override
    public List<BorrowVO> findBorrowByCondition(Integer customerId) {

        SqlSession sqlSession = this.getSqlSession();

        String sql = "SELECT customer.customer_name,customer.number,book.bookName,book.isbn,book.publisher,borrow.borrow_time,borrow.expire_time\n" +
                "      FROM book ,borrow,customer " +
                "      WHERE book.id=borrow.book_id AND borrow.customer_id=customer.id AND customer.id=?";
        sqlSession.select(sql, customerId, new ResultHandler() {
            @Override
            public void handleResult(ResultContext resultContext) {

            }
        });


        return null;
    }
}
