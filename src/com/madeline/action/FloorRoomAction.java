package com.madeline.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.madeline.entity.Floor;
import com.madeline.entity.Room;
import com.madeline.service.FloorRoomService;

public class FloorRoomAction implements ServletRequestAware{
	
	private Floor floor;
	private Room room;
	private FloorRoomService floorRoomService;
	
	private HttpServletRequest request;
	
	public Floor getFloor() {
		return floor;
	}
	public void setFloor(Floor floor) {
		this.floor = floor;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public FloorRoomService getFloorRoomService() {
		return floorRoomService;
	}
	public void setFloorRoomService(FloorRoomService floorRoomService) {
		this.floorRoomService = floorRoomService;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}
	
	public void floorAdd(){
		floor = new Floor();
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String message = new String();
		try{
			out = ServletActionContext.getResponse().getWriter();
			floor.setFloornum(Integer.parseInt(request.getParameter("floorNum")));
			floor.setFloordescript(request.getParameter("floorDescript"));
			message = floorRoomService.floorAdd(floor);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		out.print(message);
		out.flush();
	}
	
	public void floorDelete(){
		floor = new Floor();
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String message = new String();
		try{
			out = ServletActionContext.getResponse().getWriter();
			floor.setFloorid(Integer.parseInt(request.getParameter("floorId")));
			message = floorRoomService.floorDelete(floor);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		out.print(message);
		out.flush();
	}
	
	public void floorModify(){
		floor = new Floor();
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String message = new String();
		try{
			out = ServletActionContext.getResponse().getWriter();
			floor.setFloorid(Integer.parseInt(request.getParameter("floorId")));
			floor.setFloornum(Integer.parseInt(request.getParameter("floorNum")));
			floor.setFloordescript(request.getParameter("floorDescript"));
			message = floorRoomService.floorModify(floor);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		out.print(message);
		out.flush();
	}
	
	public void floorShow() {
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String json = new String();
		try {
			out = ServletActionContext.getResponse().getWriter();
			json = floorRoomService.floorShow();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(json);
		out.flush();
	}
	
	public void roomAdd(){
		room = new Room();
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String message = new String();
		try{
			out = ServletActionContext.getResponse().getWriter();
			room.setRoomnum(Integer.parseInt(request.getParameter("roomNum")));
			room.setRoomname(request.getParameter("roomName"));
			room.setRoominfo(request.getParameter("roomInfo"));
			room.setFloorid(Integer.parseInt(request.getParameter("level")));
			message = floorRoomService.roomAdd(room);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		out.print(message);
		out.flush();
	}
	
	public void roomDelete(){
		room = new Room();
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String message = new String();
		try{
			out = ServletActionContext.getResponse().getWriter();
			room.setRoomid(Integer.parseInt(request.getParameter("roomId")));
			message = floorRoomService.roomDelete(room);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		out.print(message);
		out.flush();
	}
	
	public void roomModify(){
		room = new Room();
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String message = new String();
		try{
			out = ServletActionContext.getResponse().getWriter();
			room.setRoomid(Integer.parseInt(request.getParameter("roomId")));
			room.setRoomnum(Integer.parseInt(request.getParameter("roomNum")));
			room.setRoomname(request.getParameter("roomName"));
			room.setRoominfo(request.getParameter("roomInfo"));
			room.setFloorid(Integer.parseInt(request.getParameter("level")));
			message = floorRoomService.roomModify(room);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		out.print(message);
		out.flush();
	}
	
	public void roomShow(){
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String json = new String();
		String level = request.getParameter("level");
		try {
			out = ServletActionContext.getResponse().getWriter();
			if(level!=null)
				json = floorRoomService.roomShow(level);
			else
				json = floorRoomService.roomShow();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(json);
		out.flush();
	}
}
