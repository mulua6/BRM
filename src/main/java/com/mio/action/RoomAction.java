package com.mio.action;

import com.mio.domain.Room;
import com.mio.service.RoomService;
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
@RequestMapping("/roomAction")
public class RoomAction {

    @Autowired
    public RoomService roomService;

    @RequestMapping("findAllRooms")
    public ModelAndView listRooms(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        List<Room> roomList = roomService.findAllRooms();

        modelAndView.addObject("roomList",roomList);

        request.getSession().setAttribute("rooms",roomList);

        modelAndView.setViewName("room/list");
        return modelAndView;
    }


    @RequestMapping("addRoom")
    public String addRoom(Room room){
        roomService.addRoom(room);
        return "redirect:/roomAction/findAllRooms.action";
    }

    @RequestMapping("deleteRoom")
    public String roomRoom(Room room){
        roomService.deleteRoom(room.getId());
        return "redirect:/roomAction/findAllRooms.action";
    }
    @RequestMapping("updateRoom")
    public String updateRoom(Room room){
        roomService.updateRoom(room);
        return "redirect:/roomAction/findAllRooms.action";
    }
    @RequestMapping("preUpdateRoom")
    public ModelAndView preUpdateRoom(Integer id){

        Room room = roomService.findRoomById(id);
        ModelAndView modelAndView = new ModelAndView("room/update");
        modelAndView.addObject("room",room);
        return modelAndView;
    }
}
