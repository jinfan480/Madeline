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
import com.madeline.dao.FloorDao;
import com.madeline.entity.Floor;

@Repository @Transactional
public class FloorDaoImpl implements FloorDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean floorAdd(Floor floor) {
		Session session = sessionFactory.getCurrentSession();
		try{
			session.save(floor);
		}catch(ConstraintViolationException cve){
			return false;
		}
		return true;
	}

	@Override
	public boolean floorDelete(Floor floor) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("from Floor where floorid='" + floor.getFloorid() + "'");
		try{
			floor = (Floor) query.getSingleResult();
		}catch(NoResultException ne){
			return false;
		}
		try{
			session.delete(floor);
		// TODO
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean floorModify(Floor floor) {
		Session session = sessionFactory.getCurrentSession();
		try{
			session.update(floor);
		// TODO
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public String floorShow() {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("from Floor order by floornum asc");
		List<Floor> result = new ArrayList<Floor>();
		try{
			result = (List<Floor>) query.getResultList();
		}catch(Exception e){
			return null;
		}
		Gson gson = new Gson();
		return gson.toJson(result);
	}
}
