package com.mio.action;

import com.alibaba.fastjson.JSONObject;
import com.beust.jcommander.internal.Lists;
import com.beust.jcommander.internal.Maps;
import com.mio.domain.Customer;
import com.mio.domain.Payment;
import com.mio.domain.PaymentVO;
import com.mio.service.CustomerService;
import com.mio.service.DeductionService;
import com.mio.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
    @Autowired
    public DeductionService deductionService;

    @RequestMapping("findAllPayments")
    public ModelAndView listPayments(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        List<Payment> paymentList = paymentService.findAllPayments();

        modelAndView.addObject("paymentList",paymentList);

        request.getSession().setAttribute("payments",paymentList);

        modelAndView.setViewName("payment/list");
        return modelAndView;
    }


    @ResponseBody
    @RequestMapping(value = "ajaxFindAllPayments",produces = {" application/json;charset=UTF-8 "})
    public String ajaxFindAllPayments(){
        Map<Object, Object> result = Maps.newHashMap();

        List<Payment> paymentList = paymentService.findAllPayments();

        result.put("rows",paymentList);
        return JSONObject.toJSONString(result);
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


    @ResponseBody
    @RequestMapping(value = "ajaxAddPayment",produces = {" application/json;charset=UTF-8 "})
    public String ajaxAddPayment(Payment payment,Integer number){
        Map<Object, Object> result = Maps.newHashMap();

        if (payment.getMoney()==0&&payment.getDeposit()==0){
            result.put("msg","押金和套餐费至少输入一项!");
            JSONObject.toJSONString(result);
        }

        Customer customer = customerService.findCustomerByCardNumber(number);
        payment.setCustomerId(customer.getId());
        paymentService.addPayment(payment);

        result.put("msg","缴费成功");
        return JSONObject.toJSONString(result);
    }

    @ResponseBody
    @RequestMapping(value = "ajaxDeletePayment",produces = {" application/json;charset=UTF-8 "})
    public String ajaxDeletePayment(Payment payment){
        Map<Object, Object> result = Maps.newHashMap();

//        Payment paymentToBeDelete = paymentService.findPaymentById(payment.getId());
//        Customer customerById = customerService.findCustomerById(paymentToBeDelete.getCustomerId());
        paymentService.deletePayment(payment.getId());

        result.put("msg","删除成功");
        return JSONObject.toJSONString(result);
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


    /**
     * 统计所有缴费
     * @param request
     * @return
     */
    @RequestMapping("countAllPayments")
    public ModelAndView countAllPayments(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        PaymentVO paymentVO =  paymentService.countAllPayment();

        modelAndView.setViewName("statistical/count");
        modelAndView.addObject("count",paymentVO);


        Double deductionMoenySum = deductionService.countMoney();
        Double customerDepositSum = customerService.countDeposit();


        modelAndView.addObject("deductionMoenySum",deductionMoenySum);
        modelAndView.addObject("customerDepositSum",customerDepositSum);
        modelAndView.addObject("title","财务统计");
        return modelAndView;
    }


    @ResponseBody
    @RequestMapping(value = "ajaxCountAllPayments",produces = {" application/json;charset=UTF-8 "})
    public String ajaxCountAllPayments(){
        Map<Object, Object> result = Maps.newHashMap();
        Map<Object, Object> countVo = Maps.newHashMap();


        PaymentVO paymentVO =  paymentService.countAllPayment();

        countVo.put("depositSum",paymentVO.getDepositSum());
        countVo.put("moneySum",paymentVO.getMoneySum());
        countVo.put("totalSum",paymentVO.getTotalSum());


        Double deductionMoenySum = deductionService.countMoney();
        Double customerDepositSum = customerService.countDeposit();


        countVo.put("deductionMoenySum",deductionMoenySum);
        countVo.put("customerDepositSum",customerDepositSum);
        List<Object> list = Lists.newArrayList();

        list.add(countVo);

        result.put("rows",list);

        return JSONObject.toJSONString(result);
    }

}
