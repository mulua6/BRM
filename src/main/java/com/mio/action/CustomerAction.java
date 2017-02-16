package com.mio.action;

import com.alibaba.fastjson.JSONObject;
import com.beust.jcommander.internal.Maps;
import com.mio.domain.Card;
import com.mio.domain.Customer;
import com.mio.domain.CustomerTypeVO;
import com.mio.domain.Payment;
import com.mio.service.CardService;
import com.mio.service.CustomerService;
import com.mio.service.PaymentService;
import com.mio.utils.DataDictUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
    @Autowired
    public PaymentService paymentService;

    @RequestMapping("findAllCustomers")
    public ModelAndView listCustomers(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        List<Customer> customerList = customerService.findAllCustomers();

        modelAndView.addObject("customerList",customerList);

        request.getSession().setAttribute("customers",customerList);

        modelAndView.setViewName("customer/list");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "findAllCustomersAsJson",produces = {" application/json;charset=UTF-8 "})
    public String listCustomersAsJson(){
        Map<Object, Object> result = Maps.newHashMap();

        List<Customer> customerList = customerService.findAllCustomers();

        result.put("rows",customerList);
        result.put("total",customerList.size());

        return JSONObject.toJSONString(result);
    }

    @ResponseBody
    @RequestMapping(value = "getAllCustomerStatus",produces = {" application/json;charset=UTF-8 "})
    public String getAllCustomerStatus(){
        return JSONObject.toJSONString(DataDictUtils.getAllCustomerStatus());
    }


    @RequestMapping("queryNearExpireCustomer")
    public ModelAndView queryNearExpireCustomer(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        List<Customer> customerList = customerService.queryNearExpireCustomer();

                modelAndView.addObject("customerList",customerList);

        request.getSession().setAttribute("customers",customerList);

        modelAndView.setViewName("customer/list");
        return modelAndView;
    }
    @RequestMapping("queryLackDepositCustomer")
    public ModelAndView queryLackDepositCustomer(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        List<Customer> customerList = customerService.queryLackDepositCustomer();

        modelAndView.addObject("customerList",customerList);

        request.getSession().setAttribute("customers",customerList);

        modelAndView.setViewName("customer/list");
        return modelAndView;
    }


    @ResponseBody
    @RequestMapping(value = "ajaxFindCustomerByInput",produces = {" application/json;charset=UTF-8 "})
    public String ajaxFindCustomerByInput(String input) throws UnsupportedEncodingException {
        Map<Object, Object> result = Maps.newHashMap();

        input = URLDecoder.decode(input,"UTF-8");
        //处理卡号前边的0
        if (input.startsWith("0")){
            input = input.substring(1);
        }
        System.out.println(input);
        List<Customer> customerList = customerService.findCustomerByInput(input);

        result.put("rows",customerList);
        result.put("total",customerList.size());

        return JSONObject.toJSONString(result);
    }

    @RequestMapping("findCustomerByInput")
    public ModelAndView findCustomerByInput(HttpServletRequest request,String input){
        ModelAndView modelAndView = new ModelAndView();

        if (input.startsWith("0")){
            input = input.substring(1);
        }

        List<Customer> customerList = customerService.findCustomerByInput(input);

        modelAndView.addObject("customerList",customerList);

        request.getSession().setAttribute("customers",customerList);

        modelAndView.setViewName("customer/list");
        return modelAndView;
    }

    @RequestMapping("countCustomer")
    public ModelAndView countCustomer(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        List<CustomerTypeVO> customerTypeVOList = customerService.countCustomerType();

        modelAndView.addObject("customerTypeVOList",customerTypeVOList);
        modelAndView.addObject("title","客户套餐统计");

        modelAndView.setViewName("statistical/customerCountList");
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
        customerService.addCustomer(customer);

        customer = customerService.findCustomerByCardNumber(customer.getNumber());

        Payment payment = new Payment();
        payment.setDeposit(customer.getDeposit());
        payment.setCustomerId(customer.getId());
        payment.setReason("读者注册，缴纳套餐费和押金");
        payment.setOther("千万不要删除！！！");
        payment.setTime(new Date());
        payment.setMoney(card.getPrice());
        paymentService.simpleAddPayment(payment);

        return "redirect:/customerAction/findAllCustomers.action";
    }



    @ResponseBody
    @RequestMapping(value = "ajaxAddCustomer",produces = {" application/json;charset=UTF-8 "})
    public String ajaxAddCustomer(Customer customer){

        Map<Object, Object> result = Maps.newHashMap();



        DateTime today = new DateTime();
        customer.setCreateTime(today.toDate());


        //根据套餐类型设置押金
        Card card = cardService.findCardById(customer.getCardId());
        customer.setDeposit(card.getDeposit());


        //获取但钱套餐的有效期
        int months = card.getMonths().intValue();
        //设置到期时间 默认一年后到期
        customer.setExpireTime(today.plusMonths(months).toDate());

        //设置默认状态为正常
        customer.setStatus("0");
        customerService.addCustomer(customer);

        customer = customerService.findCustomerByCardNumber(customer.getNumber());

        Payment payment = new Payment();
        payment.setDeposit(customer.getDeposit());
        payment.setCustomerId(customer.getId());
        payment.setReason("读者注册，缴纳套餐费和押金");
        payment.setOther("千万不要删除！！！");
        payment.setTime(new Date());
        payment.setMoney(card.getPrice());
        paymentService.simpleAddPayment(payment);



        result.put("msg","添加成功！");

        return JSONObject.toJSONString(result);
    }


    @ResponseBody
    @RequestMapping(value = "ajaxAlterPackage",produces = {" application/json;charset=UTF-8 "})
    public String ajaxAlterPackage(Customer customer){

        Map<Object, Object> result = Maps.newHashMap();


        Customer oldCustomer = customerService.findCustomerById(customer.getId());
        Card oldCard = cardService.findCardById(oldCustomer.getCardId());
        Card newCard = cardService.findCardById(customer.getCardId());

        //计算差价
        //套餐差价
        Double payableMoney = newCard.getPrice()-oldCard.getPrice();
        //押金差价
        Double payableDeposit = newCard.getDeposit()-oldCard.getDeposit();
        //添加缴费记录
        Payment payment = new Payment();
        payment.setDeposit(payableDeposit);
        payment.setCustomerId(customer.getId());
        payment.setReason("读者套餐变更，补交套餐费和押金差价");
        payment.setOther("千万不要删除！！！");
        payment.setTime(new Date());
        payment.setMoney(payableMoney);
        paymentService.simpleAddPayment(payment);

        //修改套餐类型
        oldCustomer.setCardId(customer.getCardId());

        //修改读者押金余额
        oldCustomer.setDeposit(oldCustomer.getDeposit()+payableDeposit);

        customerService.updateCustomer(oldCustomer);


        result.put("msg","修改套餐成功！");

        return JSONObject.toJSONString(result);
    }
    @RequestMapping("alterPackage")
    public String alterPackage(Customer customer){

        Customer oldCustomer = customerService.findCustomerById(customer.getId());
        Card oldCard = cardService.findCardById(oldCustomer.getCardId());
        Card newCard = cardService.findCardById(customer.getCardId());

        //计算差价
        //套餐差价
        Double payableMoney = newCard.getPrice()-oldCard.getPrice();
        //押金差价
        Double payableDeposit = newCard.getDeposit()-oldCard.getDeposit();
        //添加缴费记录
        Payment payment = new Payment();
        payment.setDeposit(payableDeposit);
        payment.setCustomerId(customer.getId());
        payment.setReason("读者套餐变更，补交套餐费和押金差价");
        payment.setOther("千万不要删除！！！");
        payment.setTime(new Date());
        payment.setMoney(payableMoney);
        paymentService.simpleAddPayment(payment);

        //修改套餐类型
        oldCustomer.setCardId(customer.getCardId());

        //修改读者押金余额
        oldCustomer.setDeposit(oldCustomer.getDeposit()+payableDeposit);

        customerService.updateCustomer(oldCustomer);
        return "redirect:/customerAction/findAllCustomers.action";
    }




    @RequestMapping("deleteCustomer")
    public String customerCustomer(Customer customer){
        customerService.deleteCustomer(customer.getId());
        return "redirect:/customerAction/findAllCustomers.action";
    }

    @ResponseBody
    @RequestMapping(value = "ajaxDeleteCustomer",produces = {" application/json;charset=UTF-8 "})
    public String ajaxDeleteCustomer(Customer customer){

        Map<Object, Object> result = Maps.newHashMap();

        customerService.deleteCustomer(customer.getId());
        result.put("msg","删除成功！");

        return JSONObject.toJSONString(result);
    }



    @RequestMapping("updateCustomer")
    public String updateCustomer(Customer customer){
        customerService.updateCustomer(customer);
        return "redirect:/customerAction/findAllCustomers.action";
    }



    @ResponseBody
    @RequestMapping(value = "ajaxEditCustomer",produces = {" application/json;charset=UTF-8 "})
    public String ajaxEditCustomer(Customer customer){

        System.out.println(customer);
        Map<Object, Object> result = Maps.newHashMap();

        customerService.updateCustomer(customer);

        result.put("msg","修改成功！");

        return JSONObject.toJSONString(result);
    }

    @RequestMapping("preUpdateCustomer")
    public ModelAndView preUpdateCustomer(Integer id){

        Customer customer = customerService.findCustomerById(id);
        ModelAndView modelAndView = new ModelAndView("customer/update");
        modelAndView.addObject("customer",customer);
        return modelAndView;
    }
    @RequestMapping("preAlterPackage")
    public ModelAndView preAlterPackage(Integer id){

        Customer customer = customerService.findCustomerById(id);
        ModelAndView modelAndView = new ModelAndView("customer/alterPackage");
        modelAndView.addObject("customer",customer);
        return modelAndView;
    }






}
