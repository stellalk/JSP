<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// encoding
	request.setCharacterEncoding("UTF-8");

	// retrieving
	String hp = request.getParameter("hp");

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
	
	//4. sql
	String sql = "SELECT COUNT('hp') FROM `JBOARD_USER` WHERE `hp`='"+hp+"';";
	ResultSet rs = stmt.executeQuery(sql);
	
	//5. SELECT
	int count = 0;
	
	if(rs.next()){
		count = rs.getInt(1);
	}
	
	//6. exit
	rs.close();
	stmt.close();
	conn.close();
	
	//return results
	JsonObject json = new JsonObject();
	json.addProperty("result", count);
	
	out.print(json);
%>