package com.madeline.dao;

import com.madeline.entity.Artefact;

public interface ArtefactDao {
	public boolean addArtefact(Artefact artefact);
	public boolean deleteArtefact(Artefact artefact);
	public boolean modifyArtefact(Artefact artefact);
	public String artefactShow(String room, int isOld, int page, int size);
}
