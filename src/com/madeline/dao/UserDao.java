package com.madeline.dao;

import com.madeline.entity.User;

public interface UserDao {
	public String userReg(User user);
	public String userLogin(User user);
}
