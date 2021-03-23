<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	//data encoding
	request.setCharacterEncoding("UTF-8");

	//receive parameter
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	out.println("<h4>print login</h4>");
	out.println("<p>");
	out.println("ID: "+uid+"<br/>");
	out.println("Password: "+pass+"<br/>");
	out.println("</p>");
%>