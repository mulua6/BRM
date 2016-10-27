package com.mio.service;

import com.mio.domain.Payment;
import com.mio.domain.PaymentVO;

import java.util.List;

/**
 * Created by liuhe on 2016/10/27.
 * update
 */
public interface PaymentService {

    public List<Payment> findAllPayments();

    /**
     * 为续费和补交押金用
     * @param payment
     */
    void addPayment(Payment payment);


    /**
     * 给添加用户用，不修改用户到期时间和押金
     * @param payment
     */
    void simpleAddPayment(Payment payment);

    void deletePayment(Integer id);

    void updatePayment(Payment payment);

    Payment findPaymentById(Integer id);

    List<Payment> findPaymentByCustomerId(Integer id);

    PaymentVO countAllPayment();
}
