package com.mio.service;

import com.mio.domain.Deduction;

import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public interface DeductionService {
    List<Deduction> findAllDeductions();

    void addDeduction(Deduction deduction);

    void deleteDeduction(Integer id);

    void updateDeduction(Deduction deduction);

    Deduction findDeductionById(Integer id);

    Double countMoney();
}
