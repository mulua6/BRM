package com.mio.service.impl;

import com.mio.domain.Customer;
import com.mio.domain.Deduction;
import com.mio.domain.DeductionExample;
import com.mio.mapper.CustomerMapper;
import com.mio.mapper.DeductionMapper;
import com.mio.service.DeductionService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public class DeductionServiceImpl implements DeductionService{

    @Autowired
    public DeductionMapper deductionMapper;

    @Autowired
    public CustomerMapper customerMapper;

    @Override
    public List<Deduction> findAllDeductions() {
        return deductionMapper.findAllDeductions();
    }

    @Override
    public void addDeduction(Deduction deduction) {
        deductionMapper.insertSelective(deduction);
    }

    @Override
    public void deleteDeduction(Deduction deduction) {

        //删除扣费记录
        deductionMapper.deleteByPrimaryKey(deduction.getId());

        //返还客户的扣费金额到押金中
        Customer customer = customerMapper.selectByPrimaryKey(deduction.getCustomerId());

        Double deposit = customer.getDeposit();

        customer.setDeposit(deposit+deduction.getMoney());
        customerMapper.updateByPrimaryKey(customer);

    }

    @Override
    public void updateDeduction(Deduction deduction) {
        deductionMapper.updateByPrimaryKey(deduction);
    }

    @Override
    public Deduction findDeductionById(Integer id) {
        return deductionMapper.selectByPrimaryKey(id);
    }

    @Override
    public Double countMoney() {
        return deductionMapper.countMoney();
    }

    @Override
    public List<Deduction> findDeductionByCustomerId(Integer id) {
        return deductionMapper.findDeductionByCustomerId(id);
    }


}
