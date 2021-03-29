<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//receiving data
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");

	//database



%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Modify</title>
</head>
<body>
	<h3>Modify employee information</h3>
	
	<form action="./proc/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>ID</td>
				<td><input type="text" name="uid" readonly value="<%=uid%>"/></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input type="text" name="name" value="<%=name%>"/></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input type="tel" name="hp" value="<%=hp%>"/></td>
			</tr>
			<tr>
				<td>Position</td>
				<td>
					<select name="pos">
						<option>associate</option>
						<option>manager class2</option>
						<option>manager class1</option>
						<option>deputy manager</option>
						<option>head manager</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>Department</td>
				<td>
					<select name="dep">
						<option value="101">1</option>
						<option value="102">2</option>
						<option value="103">3</option>
						<option value="104">4</option>
						<option value="105">5</option>
						<option value="106">6</option>
						<option value="107">7</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="modify">
				</td>
			</tr>
		</table>
	</form>


</body>
</html>