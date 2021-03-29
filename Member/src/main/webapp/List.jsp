<%@page import="sub1.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//database
	String host = "jdbc:mysql://192.168.10.114:3306/kye";
	String user = "kye";
	String pass = "1234";
	
	//1.load JDBC driver
	Class.forName("com.mysql.jdbc.Driver");
		
	//2.access to the dadtabase
	Connection conn = DriverManager.getConnection(host,user,pass);
		
	//3.make SQL object
	Statement stmt = conn.createStatement();
		
	//4.SQL
	String sql = "INSERT INTO `MEMBER`;";
	ResultSet rs = stmt.executeQuery(sql);
		
	//5.process the result(if SELECT)
	List<MemberBean> mbList = new ArrayList<>();
	
	while(rs.next()){
		MemberBean mb = new MemberBean();
		
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));
		mbList.add(mb);
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
	<title>List</title>
</head>
<body>
	<h3>List of employees</h3>
	
	<a href="./Register.jsp">Register</a>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Phone</th>
			<th>Position</th>
			<th>Department</th>
			<th>Registered date</th>
			<th>Modify</th>
		</tr>
		<tr>
			<td>a101</td>
			<td>Stella Kim</td>
			<td>010-1234-1111</td>
			<td>associate</td>
			<td>101</td>
			<td>03/24/21</td>
			<td>
				<a href="./Modify.jsp?uid=a101&name=Stella Kim&hp=010-1234-1111">Edit</a>
				<a href="./proc/deleteProc.jsp?uid=a101">Delete</a>
			</td>
		</tr>
		<%for(MemberBean mb:mbList){ %>
			<tr>
				<td><%=mb.getUid() %></td>
				<td><%=mb.getName() %></td>
				<td><%=mb.getHp() %></td>
				<td><%=mb.getPos() %></td>
				<td><%=mb.getDep() %></td>
				<td><%=mb.getRdate().substring(2,10) %></td>
				<td>
					<a href="./Modify.jsp?uid=<%=mb.getUid() %>&name=<%=mb.getName() %>&hp=<%=mb.getHp() %>">Edit</a>
					<a href="./proc/deleteProc.jsp?uid=<%=mb.getUid() %>">Delete</a>
				</td>
			</tr>
		<%} %>
	</table>

</body>
</html>