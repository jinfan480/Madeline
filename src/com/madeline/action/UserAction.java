package com.madeline.action;

import com.madeline.entity.User;
import com.madeline.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{
	
	private User user;
	private UserService userService;
	
	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String userRegister(){
		user.setIssubscribed(false);
		String result = userService.userRegister(user);
		if(result.equals("username_exists")){
			return result;
		}
		return "resgister_succeeded";
	}
	
	public String userLogin(){
		String result = userService.userLogin(user);
		if(result.equals("name_not_exist")){
			return "login_failed";
		}else if(result.equals("password_not_match")){
			return "login_failed";
		}else if(result.equals("user_null")){
			return "login_failed";
		}
		else{
			return "login_succeeded";
		}
	}
}

