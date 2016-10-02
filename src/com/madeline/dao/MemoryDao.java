package com.madeline.dao;

import com.madeline.entity.Memory;

public interface MemoryDao {
	public boolean addMemory(Memory memory);
	
	public boolean deleteMemory(Memory memory);
	
	public boolean modifyMemory(Memory memory);
	
	public boolean searchMemory(Memory memory);
}
