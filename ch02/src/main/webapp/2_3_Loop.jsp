<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2_3_Loop</title>
</head>
<body>
	<%-- date: 3/23/2021
		 name: Yeeun Kim
		 content: JSP Loop
	--%>
	<h3>3. JSP Loop</h3>
	
	<h4>for</h4>
	<%
		for(int i=0; i<=5; i++){
			out.println("<h4>for: "+i+"</h4>");
		}
	%>
	
	<h4>while</h4>
	<%
		int i=1;
		while(i<=5){
	%>
		<h4>while: <%=i %></h4>
	<%
			i++;
		}
	%>
	
	<h4>times table</h4>
	<table border="1">
		<tr>
			<th>2 times</th>
			<th>3 times</th>
			<th>4 times</th>
			<th>5 times</th>
			<th>6 times</th>
			<th>7 times</th>
			<th>8 times</th>
			<th>9 times</th>
		</tr>
		<%
			for(int a=2; a<=9; a++){
		%>
			<tr>
			<%
				for(int b=1; b<=9; b++){
					int c=a*b;
			%>
				<td><%=b %>x<%=a %>=<%=c %></td>
			<%
				}
			%>
			</tr>
		<%
			}
		%>
	</table>
	
</body>
</html>