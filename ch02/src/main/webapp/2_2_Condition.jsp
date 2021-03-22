<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2_2_Condition</title>
</head>
<body>
	<%-- date: 3/22/2021
		 name: Yeeun Kim
		 content: JSP condition
	--%>
	<h3>2. Condition</h3>
	<%
		int num1 = 1;
		int num2 = 2;
		int num3 = 3;
		int num4 = 4;
		
		if(num1 > 0){
			out.print("<h4>num1 is bigger than 0.</h4>");
		}
		if(num1 > num2){
	%>
		<h4>num1 is larger than num2.</h4>
	<%
		}else{
	%>
		<h4>num1 is smaller than num2.</h4>
	<%
		}
	%>
	
	<hr/>
	<% if(num1>num2){ %>
		<h4>num1 is larger than num2.</h4>
	<% } else if(num2>num3){ %>
		<h4>num2 is larger than num3.</h4>
	<% } else if(num3>num4){ %>
		<h4>num3 is larger than num4.</h4>
	<% } else{ %>
		<h4>num4 is the largest.</h4>
	<% } %>
</body>
</html>