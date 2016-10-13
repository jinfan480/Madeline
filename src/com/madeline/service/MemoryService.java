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
			return "add_succeeded";
		}else{
			return "add_failed";
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
	
	public String memorySearch(String date, String isapproved, String page, String size) {
		int status = -1;
		if(isapproved.equals("0"))
			status = 0;
		else if(isapproved.equals("1"))
			status = 1;
		else if(isapproved.equals("2"))
			status = 2;
		else if(isapproved.equals("3"))
			status = 3;
		else
			status = -1;
		int p = 0;
		int s = 0;
		try{
			p = Integer.parseInt(page);
			s = Integer.parseInt(size);
		}catch(NumberFormatException e){
			p = 1;
			s = 20;
		}
		String json = "" + memoryDao.memoryShow(date, status, p, s);
		return json;
	}

	public String memorySearch(String id) {
		String json = "" + memoryDao.memoryShow(id);
		return json;
	}

	
}
