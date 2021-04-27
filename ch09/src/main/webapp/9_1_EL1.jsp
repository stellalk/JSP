<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>9_1_EL1</title>
</head>
<body>
	<h3>1. Expression Language</h3>
	<%
		String name = "Stella Kim";
		int num1 = 1;
		int num2 = 2;
		
		// Save in JSP Implicit Objects
		pageContext.setAttribute("name", name);
		request.setAttribute("num1", num1);
		session.setAttribute("num2", num2);
	%>
	
	<h4>Expression</h4>
	<p>
		name : <%= name %><br />
		num1 : <%= num1 %><br />
		num2 : <%= num1 %><br />
		num1 + num2 = <%= num1 + num2 %>
	</p>
	
	<h4>Expression Language</h4>
	<p>
		name : ${name}<br />
		num1 : ${num1}<br />
		num2 : ${num2}<br />
		num1 + num2 = ${num1 + num2}
	</p>
	
</body>
</html>



