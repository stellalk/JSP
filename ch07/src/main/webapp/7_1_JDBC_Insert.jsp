<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>7_1_JDBCinsert</title>
</head>
<body>
	<!-- 
		date: 3/25/2021
		name: Yeeun Kim
		content: JDBC Insert
	 -->
	 
	 <h3>1. JSP JDBC Insert</h3>
	 
	 <a href="./7_2_JDBC_Select.jsp">List</a>
	 
	 <form action ="./proc/insertProc.jsp" method="get">
	 	<table border="1">
		 	<tr>
		 		<td>ID</td>
				<td><input type="text" name="uid"/></td>
		 	</tr>
		 	<tr>
		 		<td>name</td>
				<td><input type="text" name="name"/></td>
		 	</tr>
		 	<tr>
		 		<td>hp</td>
				<td><input type="tel" name="hp"/></td>
		 	</tr>
		 	<tr>
		 		<td>age</td>
				<td><input type="number" name="age"/></td>
		 	</tr>
		 	<tr>
		 		<td colspan="2" align="right">
		 			<input type="submit" value="submit"/>
		 		</td>
		 	</tr>
		 </table>
	 </form>
</body>
</html>