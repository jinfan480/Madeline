package com.madeline.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.madeline.dao.ArtefactDao;
import com.madeline.entity.Artefact;
import com.madeline.entity.Floor;
import com.madeline.entity.RelationRoomArtefact;

@Repository @Transactional
public class ArtefactDaoImpl implements ArtefactDao {

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public boolean addArtefact(Artefact artefact) {
		Session session = sessionFactory.getCurrentSession();
		try{
			session.save(artefact);
			Query<?> query = session.createQuery("from Artefact where id = (select max(a.id) from Artefact a)");
			Artefact result = (Artefact)query.getSingleResult();
			RelationRoomArtefact ra = new RelationRoomArtefact(result.getArtefactid(), artefact.getRoomid());
			session.save(ra);
		}catch(ConstraintViolationException cve){
			return false;
		}catch(NoResultException ne){
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteArtefact(Artefact artefact) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("from Artefact where artefactid='" + artefact.getArtefactid() + "'");
		try{
			artefact = (Artefact) query.getSingleResult();
		}catch(NoResultException ne){
			return false;
		}
		try{
			artefact.setIsdeleted(true);
			session.update(artefact);
		// TODO
		}catch(Exception e){
			return false;
		}
		return true;
	}

	@Override
	public boolean modifyArtefact(Artefact artefact) {
		Session session = sessionFactory.getCurrentSession();
		try{
			session.update(artefact);
		// TODO
		}catch(Exception e){
			return false;
		}
		Query<?> query = session.createQuery("from RelationRoomArtefact where artefactid='" + artefact.getArtefactid() + "'");
		RelationRoomArtefact ra;
		try{
			ra = (RelationRoomArtefact) query.getSingleResult();
			ra.setRoomid(artefact.getRoomid());
			session.update(ra);
		}catch(NoResultException ne){
			return false;
		// TODO
		}catch(Exception e){
			return false;
		}
		return true;
	}

	@Override
	public String artefactShow(String room, int isOld, int page, int size) {
		Session session = sessionFactory.getCurrentSession();
		String HQL = "from Artefact where 1=1";
		if(!room.equals("All")&&!room.equals(""))
			HQL += " and roomid=" + room;
		if(isOld!=-1)
			HQL += " and isold=" + isOld;
		HQL += " and isdeleted=0";
		Query<?> query = session.createQuery(HQL).setFirstResult((page-1)*size).setMaxResults(size);
		List<Floor> result = new ArrayList<Floor>();
		try{
			result = (List<Floor>) query.getResultList();
		}catch(Exception e){
			return null;
		}
		Gson gson = new Gson();
		HQL = "select count(*)" + HQL;
		query = session.createQuery(HQL);
		long pages = (long)query.getSingleResult()/size + ((long)query.getSingleResult()%size==0?0:1);
		return pages + "||" + gson.toJson(result);
	}

	@Override
	public String artefactShow(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("from Artefact where artefactid='" + id + "'");
		Artefact artefact = null;
		try{
			artefact = (Artefact)query.getSingleResult();
		}catch(NoResultException ne){
			return null;
		}
		Gson gson = new Gson();
		return gson.toJson(artefact);
	}
}
