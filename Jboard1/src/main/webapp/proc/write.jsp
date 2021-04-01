<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//encoding
	request.setCharacterEncoding("utf-8");

	//retreiving
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String regip = request.getRemoteAddr();
	
	//session user info
	UserBean user = (UserBean) session.getAttribute("suser");
	
	//database
	ArticleBean article = new ArticleBean();
	article.setTitle(title);
	article.setContent(content);
	article.setUid(user.getUid());
	article.setRegip(regip);
	
	ArticleDao.getInstance().insertArticle(article);
	
	//redirect to list
	response.sendRedirect("/Jboard1/list.jsp");

%>