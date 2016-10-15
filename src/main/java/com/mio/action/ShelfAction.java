package com.mio.action;

import com.mio.domain.Shelf;
import com.mio.service.ShelfService;
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


    @RequestMapping("addShelf")
    public String addShelf(Shelf shelf){
        shelfService.addShelf(shelf);
        return "redirect:/shelfAction/findAllShelfs.action";
    }

    @RequestMapping("deleteShelf")
    public String shelfShelf(Shelf shelf){
        shelfService.deleteShelf(shelf.getId());
        return "redirect:/shelfAction/findAllShelfs.action";
    }
    @RequestMapping("updateShelf")
    public String updateShelf(Shelf shelf){
        shelfService.updateShelf(shelf);
        return "redirect:/shelfAction/findAllShelfs.action";
    }
    @RequestMapping("preUpdateShelf")
    public ModelAndView preUpdateShelf(Integer id){

        Shelf shelf = shelfService.findShelfById(id);
        ModelAndView modelAndView = new ModelAndView("shelf/update");
        modelAndView.addObject("shelf",shelf);
        return modelAndView;
    }
}
