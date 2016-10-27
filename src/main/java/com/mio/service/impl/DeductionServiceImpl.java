package com.mio.service.impl;

import com.mio.domain.Deduction;
import com.mio.domain.DeductionExample;
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

    @Override
    public List<Deduction> findAllDeductions() {
        return deductionMapper.selectByExample(new DeductionExample());
    }

    @Override
    public void addDeduction(Deduction deduction) {
        deductionMapper.insertSelective(deduction);
    }

    @Override
    public void deleteDeduction(Integer id) {
        deductionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateDeduction(Deduction deduction) {
        deductionMapper.updateByPrimaryKey(deduction);
    }

    @Override
    public Deduction findDeductionById(Integer id) {
        return deductionMapper.selectByPrimaryKey(id);
    }


}
