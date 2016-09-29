package com.madeline.daoImpl;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.madeline.dao.ArtefactDao;
import com.madeline.entity.Artefact;
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
		Session session = sessionFactory.openSession();
		try{
			session.save(artefact);
			Query<?> query = session.createQuery("select max(a.id) from Artefact a");
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
		Session session = sessionFactory.openSession();
		Query<?> query = session.createQuery("from Artefact where artefactid='" + artefact.getArtefactid() + "'");
		try{
			artefact = (Artefact) query.getSingleResult();
		}catch(NoResultException ne){
			return false;
		}
		artefact.setIsdeleted(true);
		try{
			session.update(artefact);
		// TODO
		}catch(Exception e){
			return false;
		}
		query = session.createQuery("from RelationRoomArtefact where artefactid='" + artefact.getArtefactid() + "'");
		RelationRoomArtefact ra;
		try{
			ra = (RelationRoomArtefact) query.getSingleResult();
			session.delete(ra);
		}catch(NoResultException ne){
			return false;
		// TODO
		}catch(Exception e){
			return false;
		}
		return true;
	}

	@Override
	public boolean modifyArtefact(Artefact artefact) {
		Session session = sessionFactory.openSession();
		Query<?> query = session.createQuery("from Artefact where artefactid='" + artefact.getArtefactid() + "'");
		try{
			query.getSingleResult();
		}catch(NoResultException ne){
			return false;
		}
		try{
			session.update(artefact);
		// TODO
		}catch(Exception e){
			return false;
		}
		query = session.createQuery("from RelationRoomArtefact where artefactid='" + artefact.getArtefactid() + "'");
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

}
