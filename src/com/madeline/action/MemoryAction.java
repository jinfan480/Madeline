package com.madeline.action;


import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import com.madeline.entity.Memory;
import com.madeline.service.MemoryService;

public class MemoryAction implements ServletRequestAware {

	
	private Memory memory;
	private MemoryService memoryService;
	private HttpServletRequest request;
	
	
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

	
	@Override 
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}
	
	public String memoryAdd() {
		System.out.println(memory.getTitle());
		
		memory.setIsdeleted(false);
		return memoryService.addMemory(memory);
	}
	
	public void memoryDelete() {
		memory = new Memory();
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String message = new String();
		try{
			out = ServletActionContext.getResponse().getWriter();
			memory.setMemoryid(Integer.parseInt(request.getParameter("memoryId")));
			message = memoryService.deleteMemory(memory);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		out.print(message);
		out.flush();
	}
	
	public String memoryModify() {
		memory.setIsdeleted(false);
		return memoryService.modifyMemory(memory);
	}
	
	public void memorySearch() {
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String json = new String();
		String date = request.getParameter("date");
		String isapproved = request.getParameter("isapproved");
		String page = request.getParameter("page");
		String size = request.getParameter("size");
		//System.out.println(page+"ABCD");
		try {
			out = ServletActionContext.getResponse().getWriter();
			json = memoryService.memorySearch(date , isapproved, page, size);
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(json);
		out.flush();
	}
	
	public void memoryView() {
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String json = new String();
		String id = request.getParameter("memoryId");
		try {
			out = ServletActionContext.getResponse().getWriter();
			json = memoryService.memorySearch(id);
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(json);
		out.flush();
	}
	
}
