<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//encoding data
	request.setCharacterEncoding("utf-8");

	//receiving data
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String pos = request.getParameter("pos");
	String dep = request.getParameter("dep");
	
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
	String sql = "INSERT INTO `MEMBER` VALUES('"+uid+"','"+name+"','"+hp+"','"+pos+"','"+dep+"', NOW());";
	stmt.executeUpdate(sql);
		
	//5.process the result(if SELECT)
	//6.exit database
	stmt.close();
	conn.close();

	//redirect
	response.sendRedirect("../List.jsp");
%>