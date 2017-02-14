package com.mio.action;

import com.alibaba.fastjson.JSONObject;
import com.beust.jcommander.internal.Maps;
import com.mio.domain.Customer;
import com.mio.domain.Deduction;
import com.mio.domain.Payment;
import com.mio.service.CustomerService;
import com.mio.service.DeductionService;
import com.mio.service.DeductionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by liuhe on 16/10/11.
 * update
 */
@Controller
@RequestMapping("/deductionAction")
public class DeductionAction {


    @Autowired
    public CustomerService customerService;
    @Autowired
    public DeductionService deductionService;

    @RequestMapping("findAllDeductions")
    public ModelAndView listDeductions(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        List<Deduction> deductionList = deductionService.findAllDeductions();

        modelAndView.addObject("deductionList",deductionList);

        request.getSession().setAttribute("deductions",deductionList);

        modelAndView.setViewName("deduction/list");
        return modelAndView;
    }


    @ResponseBody
    @RequestMapping(value = "findAllDeductionsAsJson",produces = {" application/json;charset=UTF-8 "})
    public String findAllDeductionsAsJson(){
        Map<Object, Object> result = Maps.newHashMap();

        List<Deduction> deductionList = deductionService.findAllDeductions();

        result.put("rows",deductionList);
        return JSONObject.toJSONString(result);
    }


    @ResponseBody
    @RequestMapping(value = "ajaxDeleteDeduction",produces = {" application/json;charset=UTF-8 "})
    public String ajaxDeleteDeduction(Deduction deduction){
        Map<Object, Object> result = Maps.newHashMap();


        deduction = deductionService.findDeductionById(deduction.getId());
        deductionService.deleteDeduction(deduction);

        result.put("msg","删除成功");
        return JSONObject.toJSONString(result);
    }



    @RequestMapping("findUserDeduction")
    public ModelAndView findUserDeduction(String input ,HttpServletRequest request){
        List<Deduction> deductionList;
        ModelAndView modelAndView = new ModelAndView();

        //查询所有的扣费记录
        if (input==null||"".equals(input.trim())){
            deductionList = deductionService.findAllDeductions();
        }else {//查询某个用户的扣费记录
            Customer customer = customerService.findCustomerByCardNumber(Integer.parseInt(input));
            if (customer==null){
                request.getSession().setAttribute("msg","不存在该用户，请确认!");
                return new ModelAndView("massage");
            }

            deductionList = deductionService.findDeductionByCustomerId(customer.getId());
        }

        modelAndView.addObject("deductionList",deductionList);
        modelAndView.setViewName("deduction/list");
        return modelAndView;
    }



}
