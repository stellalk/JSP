<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>6_3_Session</title>
	<!-- 
		date: 3/24/2021
		name: Yeeun Kim
		content: JSP session
		
		Session
			- Session table
			- Session ID
	 -->
</head>
<body>
	<h3>3. Session</h3>
	
	<%
		//save client information on server session table
		session.setAttribute("name", "honggildong");
		session.setAttribute("uid", "hong");
		
		//set saving interval
		session.setMaxInactiveInterval(60 * 3);
	%>
	
	<h4>session completed</h4>
	<a href="./6_4_SessionConfirm.jsp">check session data</a>
</body>
</html>