package com.mio.action;

import com.mio.domain.Card;
import com.mio.service.CardService;
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
@RequestMapping("/cardAction")
public class CardAction {

    @Autowired
    public CardService cardService;

    @RequestMapping("findAllCards")
    public ModelAndView listCards(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        List<Card> cardList = cardService.findAllCards();

        modelAndView.addObject("cardList",cardList);

        request.getSession().setAttribute("cards",cardList);

        modelAndView.setViewName("card/list");
        return modelAndView;
    }


    @RequestMapping("addCard")
    public String addCard(Card card){
        DateTime dateTime = new DateTime();
        dateTime.getDayOfMonth();
        cardService.addCard(card);
        return "redirect:/cardAction/findAllCards.action";
    }

    @RequestMapping("deleteCard")
    public String cardCard(Card card){
        cardService.deleteCard(card.getId());
        return "redirect:/cardAction/findAllCards.action";
    }
    @RequestMapping("updateCard")
    public String updateCard(Card card){
        cardService.updateCard(card);
        return "redirect:/cardAction/findAllCards.action";
    }
    @RequestMapping("preUpdateCard")
    public ModelAndView preUpdateCard(Integer id){

        Card card = cardService.findCardById(id);
        ModelAndView modelAndView = new ModelAndView("card/update");
        modelAndView.addObject("card",card);
        return modelAndView;
    }
}
