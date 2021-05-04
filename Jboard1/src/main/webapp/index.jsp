<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserBean user = (UserBean) session.getAttribute("suser");

	if(user != null){
		//logged in
		pageContext.forward("/Jboard1/list.jsp");
	}else{
		//logged out
		pageContext.forward("/Jboard1/user/login.jsp");
	}
%>