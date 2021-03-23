<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3_2_Response</title>
	<!-- 
		date: 3/23/2021
		name: Yeeun Kim
		content: JSP response
		
		response
			- object transferred from server to client
		
		redirect(response)
			- request from server to client again
			- address applied by final request
			
		forward(pageContext)
			- process page request within the server system
			- address applied by initial request
	 -->
</head>
<body>
	<h3>2. JSP Response</h3>
	
	<a href="./proc/redirectProc.jsp">Request redirect page</a><br/>
	<a href="./proc/forwardProc.jsp">Request forward page</a>

</body>
</html>