package com.madeline.dao;

import com.madeline.entity.Floor;

public interface FloorDao {
	public boolean floorAdd(Floor floor);
	public boolean floorDelete(Floor floor);
	public boolean floorModify(Floor floor);
	public String floorShow();
}
