<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3_1_Request</title>
	<!-- 
		date: 3/23/2021
		name: Yeeun Kim
		content: JSP request
			
		request object
		 - clients' request information
		 - receiving clients parameter
		 
	 	method
	 	- how to transfer data
		post: entered data protected, transfer data to server and request to process
		get: default method, not protected(shows on url), request data or page to server
		-> encoding needed
	 -->
</head>
<body>
	<h3>1. JSP request object</h3>
	
	<h4>Login</h4>
	<form action="./proc/loginProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>ID</td>
				<td><input type="text" name="uid" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="pass" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="login" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>