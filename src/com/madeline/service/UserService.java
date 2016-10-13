package com.madeline.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.madeline.dao.UserDao;
import com.madeline.entity.User;

public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public User userRegister(User user) {
		if(user == null){
			return null;
		}else if(user.getUsername()==null || user.getUserpassword()==null){
			return null;
		}
		return userDao.userReg(user);
	}
	
	public User userLogin(User user){
		if(user == null){
			return null;
		}else if(user.getUsername()==null || user.getUserpassword()==null){
			return null;
		}
		return userDao.userLogin(user);
	}

	public String userSearch(String id) {
		String json = "" + userDao.userSearch(id);
		return json;
	}

	public String userModify(User user) {
		if(user==null){
			return "Null User";
		}
		if()
	}


}
