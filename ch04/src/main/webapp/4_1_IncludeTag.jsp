<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>4_1_IncludeTag</title>
<!-- 
		date: 3/24/2021
		name: Yeeun Kim
		content: JSP include action tag
-->
</head>
<body>
	<h3>1. JSP Include action tag</h3>
	
	<h4>include selector</h4>
	<%@ include file="./inc/_header.jsp" %>
	<%@ include file="./inc/_footer.jsp" %>
	
	<h4>include action tag</h4>
	<jsp:include page="./inc/_header.jsp"></jsp:include>
	<jsp:include page="./inc/_footer.jsp"></jsp:include>
</body>
</html>