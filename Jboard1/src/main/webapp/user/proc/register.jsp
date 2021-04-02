<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@page import="kr.co.jboard1.dao.UserDao"%>
<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//encoding
	request.setCharacterEncoding("UTF-8");
	
	//retrieving
	String uid = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String pass2 = request.getParameter("pass2");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp");
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();
	
	UserBean user = new UserBean();
	user.setUid(uid);
	user.setPass(pass1);
	user.setName(name);
	user.setNick(nick);
	user.setEmail(email);
	user.setHp(hp);
	user.setZip(zip);
	user.setAddr1(addr1);
	user.setAddr2(addr2);
	user.setRegip(regip);
	
	//database
	UserDao.getInstance().insertUser(user);
	
	//redirect to login
	response.sendRedirect("/Jboard1/user/login.jsp");
%>