<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="sub1.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	//database
	String host = "jdbc:mysql://192.168.10.114:3306/kye";
	String user = "kye";
	String pass = "1234";
	
	//1
	Class.forName("com.mysql.jdbc.Driver");
	
	//2
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	//3
	Statement stmt = conn.createStatement();
	
	//4
	String sql = "SELECT * FROM `MEMBER`";
	ResultSet rs = stmt.executeQuery(sql);
	
	//5
	List<MemberBean> members = new ArrayList<>();
	
	while(rs.next()){
		MemberBean mb = new MemberBean();
		
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));
		
		members.add(mb);
	}
	
	//6
	rs.close();
	stmt.close();
	conn.close();

	//json data(gson library)
	Gson gson = new Gson();
	String json = gson.toJson(members);
	
	//print json
	out.print(json);
	
	
%>