package com.madeline.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.madeline.entity.User;
import com.madeline.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements ServletRequestAware{
	
	private User user;
	private UserService userService;
	
	private HttpServletRequest request;
	
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
	
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}
	
	public String userRegister(){
		user.setIssubscribed(false);
		user.setRoleid(1);
		user.setRolename("User");
		User result = userService.userRegister(user);
		if(result == null){
			ActionContext.getContext().put("message", "Username Exists");
			Map session = ActionContext.getContext().getSession();
			session.put("user", result);
			return "username_exists";
		}
		return "resgister_succeeded";
	}
	
	public String userLogin(){
		User result = userService.userLogin(user);
		if(result == null){
			ActionContext.getContext().put("message", "Username does not Exist\r\nOr Password does not match");
			return "login_failed";
		}
		else{
			if(result.getRoleid()==0){
				Map session = ActionContext.getContext().getSession();
				session.put("user", result);
				return "login_as_admin";
			}
			else if(result.getRoleid()==1){
				Map session = ActionContext.getContext().getSession();
				session.put("user", result);
				return "login_as_user";
			}
			else
				return null;
		}
	}
	
	public void userSearch(){
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = null;
		String json = new String();
		String id = request.getParameter("userID");
		try {
			out = ServletActionContext.getResponse().getWriter();
			json = userService.userSearch(id);
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(json);
		out.flush();
	}
	
	public String userModify(){
		user.setIssubscribed(false);
		String result =  userService.userModify(user);
		ActionContext.getContext().put("message",result);
		return result;
	}
}

