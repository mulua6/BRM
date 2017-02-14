package com.mio.action;

import com.alibaba.fastjson.JSONObject;
import com.beust.jcommander.internal.Maps;
import com.mio.domain.Shelf;
import com.mio.service.ShelfService;
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
@RequestMapping("/shelfAction")
public class ShelfAction {

    @Autowired
    public ShelfService shelfService;

    @RequestMapping("findAllShelfs")
    public ModelAndView listShelfs(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        List<Shelf> shelfList = shelfService.findAllShelfs();

        modelAndView.addObject("shelfList",shelfList);

        request.getSession().setAttribute("shelfs",shelfList);

        modelAndView.setViewName("shelf/list");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "findAllShelfsAsJson",produces = { "application/json;charset=UTF-8" })
    public String listShelfsAsJson(){
        Map<Object, Object> result = Maps.newHashMap();

        List<Shelf> shelfList = shelfService.findAllShelfs();

        result.put("rows",shelfList);

        return JSONObject.toJSONString(result);
    }


    @RequestMapping("addShelf")
    public String addShelf(Shelf shelf){
        shelfService.addShelf(shelf);
        return "redirect:/shelfAction/findAllShelfs.action";
    }

    @ResponseBody
    @RequestMapping(value = "ajaxAddShelf",produces = { "application/json;charset=UTF-8" })
    public String ajaxAddShelf(Shelf shelf){
        Map<Object, Object> result = Maps.newHashMap();
        shelfService.addShelf(shelf);

        result.put("msg","添加成功");
        return JSONObject.toJSONString(result);
    }

    @RequestMapping("deleteShelf")
    public String shelfShelf(Shelf shelf){
        shelfService.deleteShelf(shelf.getId());
        return "redirect:/shelfAction/findAllShelfs.action";
    }

    @ResponseBody
    @RequestMapping(value = "ajaxDeleteShelf",produces = { "application/json;charset=UTF-8" })
    public String ajaxDeleteShelf(Integer id){
        Map<Object, Object> result = Maps.newHashMap();
        shelfService.deleteShelf(id);

        result.put("msg","删除成功");
        return JSONObject.toJSONString(result);
    }


    @RequestMapping("updateShelf")
    public String updateShelf(Shelf shelf){
        shelfService.updateShelf(shelf);
        return "redirect:/shelfAction/findAllShelfs.action";
    }

    @ResponseBody
    @RequestMapping(value = "ajaxEditShelf",produces = { "application/json;charset=UTF-8" })
    public String ajaxEditShelf(Shelf shelf){
        Map<Object, Object> result = Maps.newHashMap();
        shelfService.updateShelf(shelf);

        result.put("msg","修改成功");
        return JSONObject.toJSONString(result);
    }

    @RequestMapping("preUpdateShelf")
    public ModelAndView preUpdateShelf(Integer id){

        Shelf shelf = shelfService.findShelfById(id);
        ModelAndView modelAndView = new ModelAndView("shelf/update");
        modelAndView.addObject("shelf",shelf);
        return modelAndView;
    }
}
