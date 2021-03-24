<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3_3_Out</title>
	<!-- 
		date: 3/24/2021
		name: Yeeun Kim
		content: JSP print out
	 -->
</head>
<body>
	<h3>3.JSP out</h3>
	<%
		//print on system
		System.out.println("Hello!");
	
		//print on brouser
		out.println("<ul>");
		out.println("<li>a</li>");
		out.println("<li>b</li>");
		out.println("<li>c</li>");
		out.println("<li>d</li>");
		out.println("<li>e</li>");
		out.println("</ul>");
	%>
</body>
</html>