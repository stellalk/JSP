<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//data encoding
	request.setCharacterEncoding("UTF-8");

	//data collecting
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String[] hobbies=request.getParameterValues("hobby");
	String addr=request.getParameter("addr");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>registerProc</title>
</head>
<body>
	<h3>Registered data</h3>
	<table border="1">
		<tr>
			<td>Name</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>Gender</td>
			<td>
				<%
					if(gender.equals("1")){
						out.print("Male");
					}else{
						out.print("Female");
					}
				%>
			</td>
		</tr>
		<tr>
			<td>Hobby</td>
			<td>
				<%
					for(String hobby: hobbies){
						out.print(hobby+", ");
					}
				%>
			</td>
		</tr>
		<tr>
			<td>Address</td>
			<td><%=addr %></td>
		</tr>
	</table>
	<a href="../3_1_Request.jsp">Back</a>
</body>
</html>