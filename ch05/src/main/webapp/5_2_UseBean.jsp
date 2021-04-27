<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>5_2_UseBean</title>
	<!-- 
		date: 3/24/2021
		name: Yeeun Kim
		content: JavaBean
		
		Javabean
			- general java object/component 
			- class with form entering field as member
			- class with database table's column as member
			- use as vo object on JSP Model 1,2
	-->
</head>
<body>
	<h3>2.UseBean tag</h3>
	
	<%
		//String name = request.getParameter("name");
		//String gender = request.getParameter("gender");
		//String[] hobbies = request.getParameterValues("hobby");
		//String addr = request.getParameter("addr");
		
	%>
	
	<jsp:useBean id="member" class="sub1.MemberBean">
		<jsp:setProperty name="member" property="name" />
		<jsp:setProperty name="member" property="gender" />
		<jsp:setProperty name="member" property="hobby" />
		<jsp:setProperty name="member" property="addr" />
	</jsp:useBean>
	
	<p>
		name: <%= member.getName() %><br/>
		gender: <%= member.getGender() %><br/>
		hobby: 
		<% 
			for(String hobby: member.getHobby()){
				out.print(hobby+", ");
			}
		%><br/>
		address: <%= member.getAddr() %><br/>
	</p>
</body>
</html>