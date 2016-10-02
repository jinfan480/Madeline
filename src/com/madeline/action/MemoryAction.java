package com.madeline.action;

import javax.servlet.http.HttpServletRequest;

import com.madeline.entity.Memory;
import com.madeline.service.MemoryService;

public class MemoryAction {

	
	private Memory memory;
	private MemoryService memoryService;
	
	
	
	public Memory getMemory() {
		return memory;
	}

	public void setMemory(Memory memory) {
		this.memory = memory;
	}

	public MemoryService getMemoryService() {
		return memoryService;
	}

	public void setMemoryService(MemoryService memoryService) {
		this.memoryService = memoryService;
	}

	
	
	private HttpServletRequest request;
	
}
