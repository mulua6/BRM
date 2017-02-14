package com.mio.action;

import com.mio.domain.Card;
import com.mio.domain.User;
import com.mio.service.CardService;
import com.mio.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by liuhe on 15/12/20.
 * update
 */
@Controller
@RequestMapping("/")
public class LoginAction {

        @Autowired
        UserService userService;

    @Autowired
    CardService cardService;

    @RequestMapping("login")
    public String index(User user){

        System.out.println("login");
        System.out.println(user.getUsername());
        System.out.println(user.getPassword());
        return "index";
    }

    @RequestMapping("login2")
    public String index(Model model, HttpServletRequest request,User user){

        user = userService.login(user);
        request.getSession().setAttribute("admin",user);


        //查询所有的套餐
        List<Card> cardList = cardService.findAllCards();
        request.getSession().setAttribute("cardList",cardList);

        return "redirect:/index.action";
    }


    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
