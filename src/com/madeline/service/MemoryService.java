package com.madeline.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.madeline.dao.MemoryDao;
import com.madeline.entity.Memory;

public class MemoryService {

	@Autowired
	private MemoryDao memoryDao;

	public MemoryDao getMemoryDao() {
		return memoryDao;
	}

	public void setMemoryDao(MemoryDao memoryDao) {
		this.memoryDao = memoryDao;
	}
	
	
	public String addMemory(Memory memory){
		if(memory == null){
			return "memory_null";
		}else if(memory.getTitle()==null){
			return "memory_null";
		}
		if(memoryDao.addMemory(memory)){
			return "succeeded";
		}else{
			return "failed";
		}
	}
	
	
	public String deleteMemory(Memory memory){
		if(memory == null){
			return "memory_null";
		}
		if(memoryDao.deleteMemory(memory)){
			return "succeeded";
		}else{
			return "failed";
		}
	}
	
	public String modifyMemory(Memory memory){
		if(memory == null){
			return "memory_null";
		}
		if(memoryDao.modifyMemory(memory)){
			return "succeeded";
		}else{
			return "failed";
		}
	}
	
	
	
	
}
