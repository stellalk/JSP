<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>9_2_EL2</title>
</head>
<body>
	<h3>2. Expression Language Implicit Objects</h3>
	<%
		pageContext.setAttribute("name", "Tory");
		request.setAttribute("name", "Tim");
		session.setAttribute("name", "Thom");
		application.setAttribute("name", "Terry");	
	%>
	<p>
		pageContext name : ${pageScope.name}<br />
		request name : ${requestScope.name}<br />
		session name : ${sessionScope.name}<br />
		application name : ${applicationScope.name}<br />
	</p>
</body>
</html>



