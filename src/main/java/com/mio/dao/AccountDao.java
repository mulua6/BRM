package com.mio.dao;

import com.mio.domain.Account;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by liuhe on 15/12/20.
 * update
 */
@Repository
public interface AccountDao {

    void save(Account account);


    List<Account> getAllAccounts();
}
