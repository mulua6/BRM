package com.mio.mapper;

import com.mio.domain.Customer;
import com.mio.domain.CustomerExample;
import java.util.List;

import com.mio.domain.CustomerTypeVO;
import org.apache.ibatis.annotations.Param;

public interface CustomerMapper {
    int countByExample(CustomerExample example);

    int deleteByExample(CustomerExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Customer record);

    int insertSelective(Customer record);

    List<Customer> selectByExample(CustomerExample example);
    List<Customer> selectAllCustomersVo();

    Customer selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Customer record, @Param("example") CustomerExample example);

    int updateByExample(@Param("record") Customer record, @Param("example") CustomerExample example);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);

    Double countDeposit();

    List<CustomerTypeVO> countCustomerType();

    List<Customer> findCustomerByInput(String input);

    List<Customer> queryNearExpireCustomer(int days);

    List<Customer> queryLackDepositCustomer(int money);
}