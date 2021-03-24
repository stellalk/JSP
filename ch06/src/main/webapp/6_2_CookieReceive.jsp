<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>6_2_CookieReceive</title>
</head>
<body>
	<h3>2.check client cookie</h3>
	<%
		Cookie[] cookies = request.getCookies();
	
		for(Cookie cookie: cookies){
	%>
		<p>
			name: <%=cookie.getName() %><br/>
			value: <%=cookie.getValue() %><br/>
		</p>
	<%} %>
</body>
</html>