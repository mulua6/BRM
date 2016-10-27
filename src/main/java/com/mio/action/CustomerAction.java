package com.mio.action;

import com.mio.domain.Card;
import com.mio.domain.Customer;
import com.mio.service.CardService;
import com.mio.service.CustomerService;
import org.joda.time.DateTime;
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
@RequestMapping("/customerAction")
public class CustomerAction {

    @Autowired
    public CustomerService customerService;
    @Autowired
    public CardService cardService;

    @RequestMapping("findAllCustomers")
    public ModelAndView listCustomers(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        List<Customer> customerList = customerService.findAllCustomers();

        modelAndView.addObject("customerList",customerList);

        request.getSession().setAttribute("customers",customerList);

        modelAndView.setViewName("customer/list");
        return modelAndView;
    }


    @RequestMapping("addCustomer")
    public String addCustomer(Customer customer,String cardId){

        DateTime today = new DateTime();
        customer.setCreateTime(today.toDate());

        //设置到期时间 默认一年后到期
        customer.setExpireTime(today.plusYears(1).toDate());

        //根据套餐类型设置押金
        Card card = cardService.findCardById(customer.getCardId());
        customer.setDeposit(card.getDeposit());



        //TODO 保存缴费记录和押金记录

        //TODO 补交押金处理

        customerService.addCustomer(customer);
        return "redirect:/customerAction/findAllCustomers.action";
    }

    @RequestMapping("deleteCustomer")
    public String customerCustomer(Customer customer){
        customerService.deleteCustomer(customer.getId());
        return "redirect:/customerAction/findAllCustomers.action";
    }
    @RequestMapping("updateCustomer")
    public String updateCustomer(Customer customer){
        customerService.updateCustomer(customer);
        return "redirect:/customerAction/findAllCustomers.action";
    }
    @RequestMapping("preUpdateCustomer")
    public ModelAndView preUpdateCustomer(Integer id){

        Customer customer = customerService.findCustomerById(id);
        ModelAndView modelAndView = new ModelAndView("customer/update");
        modelAndView.addObject("customer",customer);
        return modelAndView;
    }
}
