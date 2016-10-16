package com.madeline.daoImpl;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.madeline.dao.UserDao;
import com.madeline.entity.RelationRoomArtefact;
import com.madeline.entity.User;

@Repository @Transactional
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public User userReg(User user) {
		Session session = sessionFactory.getCurrentSession();
		try{
			session.save(user);
		}catch(ConstraintViolationException cve){
			return null;
		}
		return user;
	}

	@Override
	public User userLogin(User user) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("from User where username='" + user.getUsername() + "'");
		User userResult = null;
		try{
			userResult = (User) query.getSingleResult();
		}catch(NoResultException ne){
			return null;
		}
		if (!user.getUserpassword().equals(userResult.getUserpassword())) {
			return null;
		}
		return userResult;

	}

	@Override
	public String userSearch(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("from User where userid='" + id + "'");
		User user = null;
		try{
			user = (User)query.getSingleResult();
		}catch(NoResultException ne){
			return null;
		}
		Gson gson = new Gson();
		return gson.toJson(user);
	}

	@Override
	public boolean userModify(User user) {
		Session session = sessionFactory.getCurrentSession();
		try{
			session.update(user);
		// TODO
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
