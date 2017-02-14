package com.mio.service.impl;

import com.mio.domain.Customer;
import com.mio.domain.CustomerExample;
import com.mio.domain.CustomerTypeVO;
import com.mio.mapper.CustomerMapper;
import com.mio.service.CustomerService;
import com.mio.utils.ConfHelper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public class CustomerServiceImpl implements CustomerService, com.mio.service.impl.CustomerService {

    @Autowired
    public CustomerMapper customerMapper;

    @Override
    public List<Customer> findAllCustomers() {
        return customerMapper.selectAllCustomersVo();
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

        Customer old = customerMapper.selectByPrimaryKey(customer.getId());
        customer.setBirthday(old.getBirthday());
//        customer.setDeposit(old.getDeposit());
        customer.setCreateTime(old.getCreateTime());
//        customer.setExpireTime(old.getExpireTime());

        customerMapper.updateByPrimaryKey(customer);
    }

    @Override
    public void updateCustomerExpireTime(Customer customer) {

        Customer old = customerMapper.selectByPrimaryKey(customer.getId());
        customer.setBirthday(old.getBirthday());
        customer.setDeposit(old.getDeposit());
        customer.setCreateTime(old.getCreateTime());

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
        System.out.println(input+"service");
        return customerMapper.findCustomerByInput(input);
    }

    @Override
    public List<Customer> queryNearExpireCustomer() {

        int days = ConfHelper.getIntConfig("near.expire.days");
        return customerMapper.queryNearExpireCustomer(days);
    }

    @Override
    public List<Customer> queryLackDepositCustomer() {
        int money = ConfHelper.getIntConfig("lack.deposit");
        return customerMapper.queryLackDepositCustomer(money);
    }
}
