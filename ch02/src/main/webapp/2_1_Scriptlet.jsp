<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2_1_Scriptlet</title>
</head>
<body>
	<!-- date: 3/22/2021
		 name: Yeeun Kim
		 content: 1. JSP components - Scriptlet 
		 -->
	<h1>1. Scriptlet</h1>
	<%
		// Scriptlet java codes
		int var1 = 1;
		boolean var2 = true;
		double var3 = 3.14;
		String var4 = "Hello";
		
		// Print
		out.print("<h4>var1 : "+var1+"</h4>");
		out.print("<h4>var2 : "+var2+"</h4>");
	%>
	
	<!-- print by expression --> 
	<h4>var3 : <%= var3 %></h4>
	<h4>var4 : <%= var4 %></h4>
</body>
</html>