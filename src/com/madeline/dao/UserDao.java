package com.madeline.dao;

import com.madeline.entity.User;

public interface UserDao {
	public User userReg(User user);
	public User userLogin(User user);
	public String userSearch(String id);
	public boolean userModify(User user);
}
