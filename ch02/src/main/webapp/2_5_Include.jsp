<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2_5_Include</title>
</head>
<body>
	<%--
		date: 3/23/2021
		name: Yeeun Kim
		content: JSP include
	 --%>
	 <h3>5. JSP Include</h3>
	<%@ include file="./inc/_header.jsp" %>

	 <main>
	 	<h1>page contents</h1>
	 </main>
	 
	<%@ include file="./inc/_footer.jsp" %>
</body>
</html>