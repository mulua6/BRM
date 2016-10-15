package com.mio.service;

import com.mio.domain.Room;

import java.util.List;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public interface RoomService {

    public List<Room> findAllRooms();

    void addRoom(Room room);

    void deleteRoom(Integer id);

    void updateRoom(Room room);

    Room findRoomById(Integer id);
}
