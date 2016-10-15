package com.mio.action;

import com.mio.domain.Card;
import com.mio.domain.Status;
import com.mio.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
@Controller
@RequestMapping("/")
public class ForwardAction {

    @Autowired
    CardService cardService;

    @RequestMapping("forward")
    public String turnTo(String[] turnTo){
        return "frame/"+turnTo[0];
    }

    @RequestMapping("index")
    public String index(HttpServletRequest request){
        //查询所有的套餐
        List<Card> cardList = cardService.findAllCards();
        request.getSession().setAttribute("cardList",cardList);

        //设置读者状态信息
        /**
         * 0:正常
         * 1:挂失
         * 2:逾期
         */
        ArrayList<Status> statusList = new ArrayList<>();
        statusList.add(new Status(0,"正常"));
        statusList.add(new Status(1,"挂失"));
        statusList.add(new Status(2,"逾期"));
        request.getSession().setAttribute("statusList",statusList);

        //设置性别
        /**
         * 1:男
         * 2:女
         */
        HashMap<Integer, String> sexList = new HashMap<>();
        sexList.put(0,"女");
        sexList.put(1,"男");
        request.getSession().setAttribute("sexList",sexList);

        return "frame/index";
    }


    @RequestMapping("go")
    public ModelAndView link(ModelAndView modelAndView,String to){

        modelAndView.setViewName(to);
        return modelAndView;
    }
}
