<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//encoding data
	request.setCharacterEncoding("UTF-8");
	
	//receiving data
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");

	//omit database logic
	if(uid.equals("abcd") && pass.equals("1234")){
		session.setAttribute("uid", uid);
		session.setAttribute("pass", pass);
		
		response.sendRedirect("./loginSuccess.jsp");
	}else{
		response.sendRedirect("./login.jsp?result=fail");
	}
	
%>