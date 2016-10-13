package com.madeline.dao;

import com.madeline.entity.Memory;

public interface MemoryDao {
	public boolean addMemory(Memory memory);
	
	public boolean deleteMemory(Memory memory);
	
	public boolean modifyMemory(Memory memory);
	

	String memoryShow(String room, int isApproved, int page, int size);

	String memoryShow(String id);
}
