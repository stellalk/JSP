<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>6_1_Cookie</title>
	<!-- 
		date: 3/24/2021
		name: Yeeun Kim
		content: JSP cookie
		
		Cookie
			- arbitrary pieces of data, usually chosen and first sent by the web server, 
			and stored on the client computer by the web browser. 
			The browser then sends them back to the server with every request, 
			introducing states (memory of previous events) into otherwise stateless HTTP transactions.
	-->
</head>
<body>
	<h3>1. Cookie</h3>
	<%
		//make cookies
		Cookie c1 = new Cookie("name","abcabcabc");
		Cookie c2 = new Cookie("uid","aaaaaaa");
		
		//set expiration time
		c1.setMaxAge(60 * 3);
		c2.setMaxAge(60 * 3);
		
		response.addCookie(c1);
		response.addCookie(c2);
	%>
	
	<h4>cookies sent to the client!</h4>
	<a href="./6_2_CookieReceive.jsp">check cookies</a>
</body>
</html>