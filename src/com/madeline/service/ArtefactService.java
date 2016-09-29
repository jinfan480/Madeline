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
		}else if(artefact.getTitle()==null || artefact.getRoomid()==null){
			return "artefact_null";
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
}
	
