<%@page import="sub1.Account"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2_4_Class</title>
</head>
<body>
	<h3>4. JSP Class</h3>
	<%
		/*
		date: 3/23/2021
		name: Yeeun Kim
		content: JSP Class
		*/
		
		Account kb = new Account("KB Bank","121-12-1111","James Clark",10000);
		kb.deposit(40000);
		kb.withdraw(7000);
		kb.show(out);
		
		Account wr = new Account("WR Bank","111-11-1111","Sally Lou",30000);
		wr.deposit(30000);
		wr.withdraw(9000);
		wr.show(out);
	%>
</body>
</html>