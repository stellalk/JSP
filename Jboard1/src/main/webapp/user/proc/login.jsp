<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@page import="kr.co.jboard1.dao.UserDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//encoding
	request.setCharacterEncoding("utf-8");
	
	//retrieving
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");

	//database
	UserBean user = UserDao.getInstance().selectUser(uid, pass);
	
	
	if(user != null){	
		//save session user info
		session.setAttribute("suser", user);
		
		//redirect to board
		response.sendRedirect("/Jboard1/list.jsp");
	}else{
		response.sendRedirect("/Jboard1/user/login.jsp?result=0");
	}
	
%>