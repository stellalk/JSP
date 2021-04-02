<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//encoding
	request.setCharacterEncoding("utf-8");

	//data
	String seq = request.getParameter("seq");
	String comment = request.getParameter("comment");
	String regip = request.getRemoteAddr();
	
	//session user object
	UserBean user = (UserBean) session.getAttribute("suser");
	String uid = user.getUid();
	
	//database insert comments
	ArticleDao dao = ArticleDao.getInstance();
	dao.insertComment(seq, comment, uid, regip);
	
	//database update comment counts +1
	dao.updateArticleCommentInc(seq);
	
	//redirect 
	response.sendRedirect("/Jboard1/view.jsp?seq="+seq);

%>