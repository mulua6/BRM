package com.mio.service.impl;

import com.mio.domain.Room;
import com.mio.domain.RoomExample;
import com.mio.mapper.RoomMapper;
import com.mio.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public class RoomServiceImpl implements RoomService{

    @Autowired
    public RoomMapper roomMapper;

    @Override
    public List<Room> findAllRooms() {
        return roomMapper.selectByExample(new RoomExample());
    }

    @Override
    public void addRoom(Room room) {
        roomMapper.insertSelective(room);
    }

    @Override
    public void deleteRoom(Integer id) {
        roomMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateRoom(Room room) {
//        roomMapper.updateByExample(room,new RoomExample());
        roomMapper.updateByPrimaryKey(room);
    }

    @Override
    public Room findRoomById(Integer id) {
        return roomMapper.selectByPrimaryKey(id);
    }
}
