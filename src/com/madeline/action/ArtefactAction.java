package com.madeline.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.madeline.entity.Artefact;
import com.madeline.service.ArtefactService;

public class ArtefactAction implements ServletRequestAware {

	private Artefact artefact;
	private ArtefactService artefactService;

	private HttpServletRequest request;
	
	public Artefact getArtefact() {
		return artefact;
	}

	public void setArtefact(Artefact artefact) {
		this.artefact = artefact;
	}

	public ArtefactService getArtefactService() {
		return artefactService;
	}

	public void setArtefactService(ArtefactService artefactService) {
		this.artefactService = artefactService;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}

	public String artefactAdd() {
		artefact.setIsdeleted(false);
		return artefactService.addArtefact(artefact);
	}

	public void artefactDelete() {
		artefact = new Artefact();
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String message = new String();
		try{
			out = ServletActionContext.getResponse().getWriter();
			artefact.setArtefactid(Integer.parseInt(request.getParameter("artefactId")));
			message = artefactService.deleteArtefact(artefact);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		out.print(message);
		out.flush();
	}

	public String artefactModify() {
		artefact.setIsdeleted(false);
		return artefactService.modifyArtefact(artefact);
	}
	
	public void artefactSearch() {
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String json = new String();
		String room = request.getParameter("room");
		String isOld = request.getParameter("isOld");
		String page = request.getParameter("page");
		String size = request.getParameter("size");
		try {
			out = ServletActionContext.getResponse().getWriter();
			json = artefactService.artefactSearch(room , isOld, page, size);
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(json);
		out.flush();
	}
	
	public void artefactView() {
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String json = new String();
		String id = request.getParameter("artefactId");
		try {
			out = ServletActionContext.getResponse().getWriter();
			json = artefactService.artefactSearch(id);
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(json);
		out.flush();
	}
	
	public void artefactUpload() throws IOException {

	}
}
