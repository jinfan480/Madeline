package com.madeline.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.madeline.dao.ArtefactDao;
import com.madeline.entity.Artefact;

public class ArtefactService {

	@Autowired
	private ArtefactDao artefactDao;

	public ArtefactDao getArtefactDao() {
		return artefactDao;
	}

	public void setArtefactDao(ArtefactDao artefactDao) {
		this.artefactDao = artefactDao;
	}
	
	public String addArtefact(Artefact artefact){
		if(artefact == null){
			return "artefact_null";
		}else if(artefact.getTitle().isEmpty() || artefact.getRoomid()==null){
			return "incomplete content";
		}
		if(artefactDao.addArtefact(artefact)){
			return "succeeded";
		}else{
			return "failed";
		}
	}
	
	public String deleteArtefact(Artefact artefact){
		if(artefact == null){
			return "artefact_null";
		}
		if(artefactDao.deleteArtefact(artefact)){
			return "succeeded";
		}else{
			return "failed";
		}
	}
	
	public String modifyArtefact(Artefact artefact){
		if(artefact == null){
			return "artefact_null";
		}
		if(artefactDao.modifyArtefact(artefact)){
			return "succeeded";
		}else{
			return "failed";
		}
	}

	public String artefactSearch(String room, String isOld, String page, String size) {
		int old = -1;
		if(isOld.equals("New"))
			old = 0;
		else if(isOld.equals("Old"))
			old = 1;
		else
			old = -1;
		int p = 0;
		int s = 0;
		try{
			p = Integer.parseInt(page);
			s = Integer.parseInt(size);
		}catch(NumberFormatException e){
			p = 1;
			s = 20;
		}
		String json = "" + artefactDao.artefactShow(room, old, p, s);
		return json;
	}
}
	
