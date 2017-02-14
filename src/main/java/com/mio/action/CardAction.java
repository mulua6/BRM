package com.mio.action;

import com.alibaba.fastjson.JSONObject;
import com.beust.jcommander.internal.Maps;
import com.mio.domain.Card;
import com.mio.service.CardService;
import com.mio.utils.DataDictUtils;
import org.joda.time.DateTime;
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

    @ResponseBody
    @RequestMapping(value = "findAllCardsAsJson",produces = { "application/json;charset=UTF-8" })
    public String listCardsAsJson(){

        Map<Object, Object> result = Maps.newHashMap();
        List<Card> cardList = cardService.findAllCards();

        result.put("rows",cardList);
        result.put("total",cardList.size());

        return JSONObject.toJSONString(result);
    }

    @RequestMapping("addCard")
    public String addCard(Card card){
        DateTime dateTime = new DateTime();
        dateTime.getDayOfMonth();
        cardService.addCard(card);
        return "redirect:/cardAction/findAllCards.action";
    }

    @ResponseBody
    @RequestMapping(value = "ajaxAddCard",produces = { "application/json;charset=UTF-8" })
    public String ajaxAddCard(Card card){

        Map<Object, Object> result = Maps.newHashMap();

        DateTime dateTime = new DateTime();
        cardService.addCard(card);

        result.put("msg","添加成功");

        return JSONObject.toJSONString(result);
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


    @ResponseBody
    @RequestMapping(value = "ajaxEditCard",produces = { "application/json;charset=UTF-8" })
    public String ajaxEditCard(Card card){

        Map<Object, Object> result = Maps.newHashMap();

        cardService.updateCard(card);

        result.put("msg","修改成功");

        return JSONObject.toJSONString(result);
    }

    @RequestMapping("preUpdateCard")
    public ModelAndView preUpdateCard(Integer id){

        Card card = cardService.findCardById(id);
        ModelAndView modelAndView = new ModelAndView("card/update");
        modelAndView.addObject("card",card);
        return modelAndView;
    }


}
