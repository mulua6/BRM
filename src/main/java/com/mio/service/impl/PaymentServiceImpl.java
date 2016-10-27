package com.mio.service.impl;

import com.mio.domain.Customer;
import com.mio.domain.Payment;
import com.mio.domain.PaymentExample;
import com.mio.mapper.CustomerMapper;
import com.mio.mapper.PaymentMapper;
import com.mio.service.CustomerService;
import com.mio.service.PaymentService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

/**
 * Created by liuhe on 2016/10/27.
 * update
 */
public class PaymentServiceImpl implements PaymentService{

    @Autowired
    public PaymentMapper paymentMapper;
    @Autowired
    public CustomerService customerService;

    @Override
    public List<Payment> findAllPayments() {
        return paymentMapper.selectByExample(new PaymentExample());
    }

    @Override
    public void addPayment(Payment payment) {

        Customer customer = customerService.findCustomerById(payment.getCustomerId());
        if (payment.getMoney()!=null){
            payment.setReason("缴纳套餐费");

            //TODO 判断续费金额是否等于套餐费2.0

            //修改读者到期日期
            DateTime expireTime = new DateTime(customer.getExpireTime());

            //到期前续费
            if(expireTime.isAfterNow()){
                customer.setExpireTime(expireTime.plusYears(1).toDate());
            }else{
                //到期后续费
                customer.setExpireTime(new DateTime(new Date()).plusYears(1).toDate());
            }

        }

        if (payment.getDeposit()!= null){
            payment.setReason("补交押金");

            //修改读者押金
            customer.setDeposit(customer.getDeposit()+ payment.getDeposit());
        }

        payment.setTime(new Date());
        customerService.updateCustomer(customer);
        paymentMapper.insertSelective(payment);

    }

    @Override
    public void simpleAddPayment(Payment payment) {
        paymentMapper.insertSelective(payment);
    }

    /**
     * 续费
     */
    private void renewal(){

    }

    @Override
    public void deletePayment(Integer id) {

        Payment payment = findPaymentById(id);
        Customer customer = customerService.findCustomerById(payment.getCustomerId());

        //押金不是0
        if (payment.getDeposit() != 0){
            //修改用户押金余额
            customer.setDeposit(customer.getDeposit()-payment.getDeposit());
        }

        //套餐费不是0
        if (payment.getMoney() != 0){
            customer.setExpireTime(new DateTime(customer.getExpireTime()).minusYears(1).toDate());
        }

        customerService.updateCustomer(customer);
        paymentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updatePayment(Payment payment) {
        paymentMapper.updateByPrimaryKey(payment);
    }

    @Override
    public Payment findPaymentById(Integer id) {
        return paymentMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Payment> findPaymentByCustomerId(Integer id) {
        PaymentExample paymentExample = new PaymentExample();
        paymentExample.createCriteria().andCustomerIdEqualTo(id);
        return paymentMapper.selectByExample(paymentExample);
    }
}
