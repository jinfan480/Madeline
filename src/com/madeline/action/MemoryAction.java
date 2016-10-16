package com.madeline.action;


import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import com.madeline.entity.Memory;
import com.madeline.service.MemoryService;
import com.opensymphony.xwork2.ActionContext;

public class MemoryAction implements ServletRequestAware {

	
	private Memory memory;
	private MemoryService memoryService;
	private File image;
	private String imageFileName;
	private String imageContentType;

	private HttpServletRequest request;
	
	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

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
		if(imageFileName!=null){
			String realpath = ServletActionContext.getServletContext().getRealPath("/memory/images");
			File dir = new File(realpath);
			if(!dir.exists())
				dir.mkdirs();
			System.out.println("realpath: " + realpath);
			if (image != null) {
				File savefile = new File(new File(realpath), imageFileName.trim());
				if (!savefile.getParentFile().exists())
					savefile.getParentFile().mkdirs();
				try {
					FileUtils.copyFile(image, savefile);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			memory.setPicture("memory/images/" + imageFileName.trim());
		}
		memory.setIsdeleted(false);
		if(request.getParameter("userID")==null||request.getParameter("userID").isEmpty()){
			memory.setIsapproved(null);
		}else{
			memory.setIsapproved(true);
		}
		String id = request.getParameter("userID");
		memory.setUserid(Integer.parseInt(id));
		
		String result =  memoryService.addMemory(memory);
		System.out.println(result);
		ActionContext.getContext().put("message", result);
		return result;
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
		System.out.println("Search"+isapproved+","+page+","+size);
		//System.out.println(page+"ABCD");
		try {
			out = ServletActionContext.getResponse().getWriter();
			json = memoryService.memorySearch(date , isapproved, page, size);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//System.out.println("Search"+json);
		
		out.print(json);
		out.flush();
	}
	
	public void memoryView() {
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String json = new String();
		String id = request.getParameter("userID");
		System.out.println("id="+id);
		try {
			out = ServletActionContext.getResponse().getWriter();
			json = memoryService.memorySearch(id);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(json);
		out.print(json);
		out.flush();
	}
	
}
