package com.madeline.daoImpl;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.madeline.dao.UserDao;
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
	public String userReg(User user) {
		Session session = sessionFactory.openSession();
		try{
			session.save(user);
		}catch(ConstraintViolationException cve){
			return "username_exists";
		}
		return user.getUsername();
	}

	@Override
	public String userLogin(User user) {
		Session session = sessionFactory.openSession();
		Query<?> query = session.createQuery("from User where username='" + user.getUsername() + "'");
		User userResult = null;
		try{
			userResult = (User) query.getSingleResult();
		}catch(NoResultException ne){
			return "name_not_exist";
		}
		if (!user.getUserpassword().equals(userResult.getUserpassword())) {
			return "password_not_match";
		}
		return user.getUsername();

	}

}
