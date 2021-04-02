<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//encoding
	request.setCharacterEncoding("utf-8");
	
	//data
	String seq = request.getParameter("seq");
	String parent = request.getParameter("parent");
	
	//database delete comment
	ArticleDao dao = ArticleDao.getInstance();
	dao.deleteComment(seq);
	
	//database update comment counts -1
	dao.updateArticleCommentDec(parent);
	
	//redirect
	response.sendRedirect("/Jboard1/view.jsp?seq="+parent);

%>