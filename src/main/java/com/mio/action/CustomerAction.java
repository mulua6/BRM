package com.mio.action;

import com.mio.domain.Customer;
import com.mio.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
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

        Date now = new Date();
        customer.setCreateTime(now);
        //TODO set expire time

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
