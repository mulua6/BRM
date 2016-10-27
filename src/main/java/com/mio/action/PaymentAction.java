package com.mio.action;

import com.mio.domain.Customer;
import com.mio.domain.Payment;
import com.mio.service.CustomerService;
import com.mio.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by liuhe on 16/10/11.
 * update
 */
@Controller
@RequestMapping("/paymentAction")
public class PaymentAction {

    @Autowired
    public PaymentService paymentService;
    @Autowired
    public CustomerService customerService;

    @RequestMapping("findAllPayments")
    public ModelAndView listPayments(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        List<Payment> paymentList = paymentService.findAllPayments();

        modelAndView.addObject("paymentList",paymentList);

        request.getSession().setAttribute("payments",paymentList);

        modelAndView.setViewName("payment/list");
        return modelAndView;
    }
    @RequestMapping("findUserPayment")
    public ModelAndView findUserPayment(Integer cardNumber ,HttpServletRequest request){
        if (cardNumber==null){
            request.getSession().setAttribute("msg","请输入卡号!");
            return new ModelAndView("massage");
        }

        ModelAndView modelAndView = new ModelAndView();

        Customer customer = customerService.findCustomerByCardNumber(cardNumber);
        if (customer==null){
            request.getSession().setAttribute("msg","不存在该用户，请确认!");
            return new ModelAndView("massage");
        }

        List<Payment> paymentList = paymentService.findPaymentByCustomerId(customer.getId());

        modelAndView.addObject("paymentList",paymentList);
        modelAndView.addObject("customer",customer);


        modelAndView.setViewName("payment/list");
        return modelAndView;
    }


    @RequestMapping("addPayment")
    public String addPayment(Payment payment,Integer cardNumber,HttpServletRequest request){
        if (cardNumber==null){
            request.getSession().setAttribute("msg","请输入卡号!");
            return "massage";
        }
        if (payment.getMoney()==null&&payment.getDeposit()==null){
            request.getSession().setAttribute("msg","押金和套餐费至少输入一项!");
            return "massage";
        }

        Customer customer = customerService.findCustomerByCardNumber(cardNumber);
        if (customer==null){
            request.getSession().setAttribute("msg","不存在该用户，请确认!");
            return "massage";
        }

        payment.setCustomerId(customer.getId());
        paymentService.addPayment(payment);
        return "redirect:/paymentAction/findUserPayment.action?cardNumber="+cardNumber;
    }

    @RequestMapping("deletePayment")
    public String paymentPayment(Payment payment){
        Payment paymentToBeDelete = paymentService.findPaymentById(payment.getId());
        Customer customerById = customerService.findCustomerById(paymentToBeDelete.getCustomerId());
        paymentService.deletePayment(payment.getId());
        return "redirect:/paymentAction/findUserPayment.action?cardNumber="+customerById.getNumber();
    }
    @RequestMapping("updatePayment")
    public String updatePayment(Payment payment,String cardNumber){


        paymentService.updatePayment(payment);
        return "redirect:/paymentAction/findUserPayment.action?cardNumber="+cardNumber;
    }
    @RequestMapping("preUpdatePayment")
    public ModelAndView preUpdatePayment(Integer id,HttpServletRequest request){
        Payment payment = paymentService.findPaymentById(id);

        Customer customer = customerService.findCustomerById(payment.getCustomerId());
        if (customer==null){
            request.getSession().setAttribute("msg","不存在该用户，请确认!");
            return new ModelAndView("massage");
        }

        ModelAndView modelAndView = new ModelAndView("payment/update");
        modelAndView.addObject("payment",payment);
        modelAndView.addObject("customer",customer);
        return modelAndView;
    }
}
