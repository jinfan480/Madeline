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
import com.madeline.dao.RoomDao;
import com.madeline.entity.Room;

@Repository @Transactional
public class RoomDaoImpl implements RoomDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean roomAdd(Room room) {
		Session session = sessionFactory.getCurrentSession();
		try{
			session.save(room);
		}catch(ConstraintViolationException cve){
			return false;
		}
		return true;
	}

	@Override
	public boolean roomDelete(Room room) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("from Room where roomid='" + room.getRoomid() + "'");
		try{
			room = (Room) query.getSingleResult();
		}catch(NoResultException ne){
			return false;
		}
		try{
			session.delete(room);
		// TODO
		}catch(Exception e){
			return false;
		}
		return true;
	}

	@Override
	public boolean roomModify(Room room) {
		Session session = sessionFactory.getCurrentSession();
		try{
			session.update(room);
		// TODO
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public String roomShow(String level) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("from Room where floorid=" + level + " order by roomnum asc");
		List<Room> result = new ArrayList<Room>();
		try{
			result = (List<Room>) query.getResultList();
		}catch(Exception e){
			return null;
		}
		Gson gson = new Gson();
		return gson.toJson(result);
	}

	@Override
	public String roomShow() {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("from Room order by roomnum asc");
		List<Room> result = new ArrayList<Room>();
		try{
			result = (List<Room>) query.getResultList();
		}catch(Exception e){
			return null;
		}
		Gson gson = new Gson();
		return gson.toJson(result);
	}
}