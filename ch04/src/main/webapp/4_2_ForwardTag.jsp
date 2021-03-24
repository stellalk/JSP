<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>4_2_ForwardTag</title>
	<!-- 
		date: 3/24/2021
		name: Yeeun Kim
		content: JSP forward action tag
	-->
</head>
<body>
	<h3>2. Forward action tag</h3>
	
	<jsp:forward page="./4_1_IncludeTag.jsp"></jsp:forward>
	
	<%
		//pageContext.forward("./4_1_IncludeTag.jsp");
	%>
</body>
</html>