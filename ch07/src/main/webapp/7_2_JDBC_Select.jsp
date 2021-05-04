<%@page import="java.util.ArrayList"%>
<%@page import="sub1.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//database 
	String host = "jdbc:mysql://18.220.30.100:3306/kye";
	String user = "kye";
	String pass = "1234";
	
	//1.load JDBC driver
	Class.forName("com.mysql.jdbc.Driver");
	
	//2.access to the dadtabase
	Connection conn = DriverManager.getConnection(host, user, pass);

	//3.make SQL object
	Statement stmt = conn.createStatement();
	
	//4.SQL
	String sql = "SELECT * FROM `USER1`;";
	ResultSet rs = stmt.executeQuery(sql);
	
	//5.process the result(if SELECT)
	List<UserBean> ubList = new ArrayList<>();
	
	//change the cursor to the row below
	while(rs.next()){
		UserBean ub = new UserBean();
		
		ub.setUid(rs.getString(1));
		ub.setName(rs.getString(2));
		ub.setHp(rs.getString(3));
		ub.setAge(rs.getInt(4));
		
		ubList.add(ub);
	}
	
	//6.exit database
	rs.close();
	stmt.close();
	conn.close();
		
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>7_2_JDBC_Select</title>
</head>
<body>
	<h3>2. JDBC Select</h3>
	
	<a href="./7_1_JDBC_Insert.jsp">register</a>
	
	<table border="1">
		<tr>
			<th>ID</th>
			<th>name</th>
			<th>phone</th>
			<th>age</th>
			<th>edit/delete</th>
		</tr>
		<% for(UserBean ub: ubList){ %>
			<tr>
				<td><%=ub.getUid() %></td>
				<td><%=ub.getName() %></td>
				<td><%=ub.getHp() %></td>
				<td><%=ub.getAge() %></td>
				<td>
					<a href="#">edit</a>
					<a href="#">delete</a>
				</td>
			</tr>
		<%} %>
	</table>

</body>
</html>