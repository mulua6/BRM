package com.mio.service;

import com.mio.domain.Customer;
import com.mio.domain.CustomerTypeVO;

import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public interface CustomerService {
    List<Customer> findAllCustomers();

    void addCustomer(Customer customer);

    void deleteCustomer(Integer id);

    void updateCustomer(Customer customer);

    Customer findCustomerById(Integer id);
    Customer findCustomerByCardNumber(Integer cardNumber);

    Double countDeposit();

    List<CustomerTypeVO> countCustomerType();
}
