<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//receive from loginProc when failed
	String result = request.getParameter("result");

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login</title>
	<script>
		var result = "<%=result%>";
		
		if(result == "fail"){
			alert("Login failed. \nPlease login again.")
		}else if(result == "logout"){
			alert("You are logouted. \nSee you soon!")
		}
	</script>
</head>
<body>
	<h4>Login</h4>
	<form action="./loginProc.jsp" method="post">
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