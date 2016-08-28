package com.mio.dao;

import com.mio.domain.Account;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * Created by liuhe on 16/8/26.
 * update
 */
public interface AccountMapper {
    @Select("SELECT * FROM account WHERE id = #{id}")
    Account getAccount(@Param("id")String id);
}
