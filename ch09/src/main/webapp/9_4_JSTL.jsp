<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>9_4_JSTL</title>
</head>
<body>
	<h3>4.JSTL (Java Standards Tag Library)</h3>
	<h4>Scriptlet</h4>
	<%
		String str = "hello";
		out.print("<p>str : "+str+"</p>");
	
		int num1 = 1;
		int num2 = 2;
		int num3 = 3;
		
		if(num1 < num2){
			out.print("<p>num1 is smaller than num2.</p>");
		}
		
		if(num1 > num2){
			out.print("<p>num1 is larger than num2.</p>");
		}else{
			out.print("<p>num1 is smaller than num2.</p>");
		}
		
		if(num1 > num2){
			out.print("<p>num1 is larger than num2.</p>");
		}else if(num2 > num3){
			out.print("<p>num2 is larger than num3.</p>");
		}else{
			out.print("<p>num3 is the largest.</p>");
		}
		
		for(int i=1 ; i<=5 ; i++){
			out.print("<p>"+i+".Hello JSTL!</p>");
		}
		
		String[] people = {"Tory", "Tim", "Thom", "Terry", "Tank"};
		
		for(String person : people){
			out.print("<p>"+person+"</p>");
		}
		
		int sum = 0;
		
		for(int k=1 ; k<=10 ; k++){
			sum += k;
		}
		
		out.print("<p>sum from 1 to 10 : "+sum+"</p>");
		
		// String
		String hello = "Hello Korea";
		
		out.print("<p>Length of the string : "+hello.length()+"</p>");
		out.print("<p>Substring : "+hello.substring(6, 10)+"</p>");
		out.print("<p>Replace the string : "+hello.replace("Korea", "Busan")+"</p>");
		out.print("<p>Index of the string : "+hello.indexOf("e")+"</p>");
		
	%>
	<h4>JSTL</h4>
	<c:set var="str" value="hello"></c:set>
	<p>str : ${str}</p>
	
	<c:set var="num1" value="1"/>
	<c:set var="num2" value="2"/>
	<c:set var="num3" value="3"/>
	
	<c:if test="${num1 lt num2}">
		<p>num1 is smaller than num2.</p>	
	</c:if>
	
	<c:choose>
		<c:when test="${num1 gt num2}">
			<p>num1 is larger than num2.</p>
		</c:when>
		<c:otherwise>
			<p>num1 is smaller than num2.</p>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${num1 gt num2}">
			<p>num1 is larger than num2.</p>
		</c:when>
		<c:when test="${num2 gt num3}">
			<p>num2 is larger than num3.</p>
		</c:when>
		<c:otherwise>
			<p>num3 is the largest.</p>
		</c:otherwise>
	</c:choose>
	
	<c:forEach var="i" begin="1" end="5">
		<p>${i}.Hello JSTL!</p>	
	</c:forEach>
	
	<c:set var="people">Tory, Tim, Thom, Terry, Tank</c:set>
	<c:forEach var="person" items="${people}">
		<p>${person}</p>
	</c:forEach>
	
	<c:set var="sum" value="0"/>
	
	<c:forEach var="k" begin="1" end="10">
		<c:set var="sum" value="${sum + k}"/>	
	</c:forEach>
	
	<p>sum from 1 to 10 : ${sum}</p>
	
	<c:set var="hello" value="Hello Korea"/>
	<p>Length of the string : ${f:length(hello)}</p>
	<p>Substring : ${f:substring(hello, 6, 10)}</p>
	<p>Replace the string : ${f:replace(hello, "Korea", "Busan")}</p>
	<p>Index of the string : ${f:indexOf(hello, "e")}</p>
	
</body>
</html>


