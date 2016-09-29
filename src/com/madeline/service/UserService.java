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

	public String userRegister(User user) {
		if(user == null){
			return "user_null";
		}else if(user.getUsername()==null || user.getUserpassword()==null){
			return "user_null";
		}
		return userDao.userReg(user);
	}
	
	public String userLogin(User user){
		if(user == null){
			return "user_null";
		}else if(user.getUsername()==null || user.getUserpassword()==null){
			return "user_null";
		}
		return userDao.userLogin(user);
	}


}
