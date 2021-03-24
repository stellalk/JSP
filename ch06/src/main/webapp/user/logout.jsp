<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//remove client info from the session
	session.invalidate();

	response.sendRedirect("./login.jsp?result=logout");

%>