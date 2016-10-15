package com.mio.dao;

import com.mio.domain.Account;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by liuhe on 16/8/26.
 * update
 */
@Component("AccountMapper")
public interface AccountMapper {
    @Select("SELECT * FROM account WHERE id = #{id}")
    Account getAccount(@Param("id")String id);
    List<Account> findSomeAccount(int number);
    int count1();
}


