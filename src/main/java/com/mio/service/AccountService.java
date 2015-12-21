package com.mio.service;

import com.mio.domain.Account;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by liuhe on 15/12/20.
 * update
 */
@Service
@Transactional("tx")
public interface AccountService {
    void save(Account account);
}
