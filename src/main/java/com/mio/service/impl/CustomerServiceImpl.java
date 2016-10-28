package com.mio.service.impl;

import com.mio.domain.Customer;
import com.mio.domain.CustomerExample;
import com.mio.domain.CustomerTypeVO;
import com.mio.mapper.CustomerMapper;
import com.mio.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public class CustomerServiceImpl implements CustomerService{

    @Autowired
    public CustomerMapper customerMapper;

    @Override
    public List<Customer> findAllCustomers() {
        return customerMapper.selectByExample(new CustomerExample());
    }

    @Override
    public void addCustomer(Customer customer) {
        customerMapper.insertSelective(customer);
    }

    @Override
    public void deleteCustomer(Integer id) {
        customerMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateCustomer(Customer customer) {
//        customerMapper.updateByExample(customer,new CustomerExample());
        customerMapper.updateByPrimaryKey(customer);
    }

    @Override
    public Customer findCustomerById(Integer id) {
        return customerMapper.selectByPrimaryKey(id);
    }

    @Override
    public Customer findCustomerByCardNumber(Integer cardNumber) {
        CustomerExample customerExample = new CustomerExample();
        CustomerExample.Criteria criteria = customerExample.createCriteria();
        criteria.andNumberEqualTo(cardNumber);
        List<Customer> customers = customerMapper.selectByExample(customerExample);

        if (customers.size()<1){
            return null;
        }
        return customers.get(0);

    }

    @Override
    public Double countDeposit() {
        return customerMapper.countDeposit();
    }

    @Override
    public List<CustomerTypeVO> countCustomerType() {
        return customerMapper.countCustomerType();

    }

    @Override
    public List<Customer> findCustomerByInput(String input) {
        return customerMapper.findCustomerByInput(input);
    }
}
