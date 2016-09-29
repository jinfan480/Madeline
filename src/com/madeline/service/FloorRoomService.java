package com.madeline.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.madeline.dao.FloorDao;
import com.madeline.dao.RoomDao;
import com.madeline.entity.Floor;
import com.madeline.entity.Room;

public class FloorRoomService {
	
	@Autowired
	private FloorDao floorDao;
	private RoomDao roomDao;
	
	public FloorDao getFloorDao() {
		return floorDao;
	}
	public void setFloorDao(FloorDao floorDao) {
		this.floorDao = floorDao;
	}
	public RoomDao getRoomDao() {
		return roomDao;
	}
	public void setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
	}
	
	public String floorAdd(Floor floor){
		if(floor == null){
			return "floor_null";
		}else if(floor.getFloornum()==null){
			return "floor_null";
		}
		if(floorDao.floorAdd(floor)){
			return "Floor Added";
		}else{
			return "Fail to Add\r\nExisting Level";
		}
	}
	
	public String floorDelete(Floor floor){
		if(floor == null){
			return "floor_null";
		}
		if(floorDao.floorDelete(floor)){
			return "Floor Deleted";
		}else{
			return "Fail to Delete\r\nNo such Level";
		}
	}
	
	public String floorModify(Floor floor){
		if(floor == null){
			return "floor_null";
		}else if(floor.getFloornum()==null){
			return "floor_null";
		}
		if(floorDao.floorModify(floor)){
			return "Floor Modified";
		}else{
			return "Fail to modify";
		}
	}
	
	public String floorShow(){
		String json = "" + floorDao.floorShow();
		return json;
	}
	
	public String roomAdd(Room room){
		if(room == null){
			return "room_null";
		}else if(room.getRoomnum()==null ||room.getRoomname()==null || room.getFloorid()==null){
			return "room_null";
		}
		if(roomDao.roomAdd(room)){
			return "Room added";
		}else{
			return "Fail to Add\r\nExisting Room";
		}
	}
	
	public String roomDelete(Room room){
		if(room == null){
			return "room_null";
		}
		if(roomDao.roomDelete(room)){
			return "Room deleted";
		}else{
			return "Fail to delete\r\nNo such Room";
		}
	}
	
	public String roomModify(Room room){
		if(room == null){
			return "room_null";
		}else if(room.getRoomnum()==null ||room.getRoomname()==null || room.getFloorid()==null){
			return "room_null";
		}
		if(roomDao.roomModify(room)){
			return "Room Modified";
		}else{
			return "Fail to modify";
		}
	}
	
	public String roomShow(String level){
		String json = "" + roomDao.roomShow(level);
		return json;
	}
	public String roomShow() {
		String json = "" + roomDao.roomShow();
		return json;
	}
}
