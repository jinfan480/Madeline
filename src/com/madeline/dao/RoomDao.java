package com.madeline.dao;

import com.madeline.entity.Room;

public interface RoomDao {
	public boolean roomAdd(Room room);
	public boolean roomDelete(Room room);
	public boolean roomModify(Room room);
	public String roomShow(String level);
	public String roomShow();
}
