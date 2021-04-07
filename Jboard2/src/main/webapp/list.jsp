<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List</title>
    <link rel="stylesheet" href="/Jboard2/css/style.css">    
</head>
<body>
    <div id="wrapper">
        <section id="board" class="list">
            <h3>Board</h3>
            <article>
                <p>
                    Welcome, ${suser.getNick()}.
                    <a href="/Jboard2/user/logout.do" class="logout">[LOGOUT]</a>
                </p>
                <table border="0">
                    <tr>
                        <th>No</th>
                        <th>Title</th>
                        <th>Name</th>
                        <th>Date</th>
                        <th>Hit</th>
                    </tr>
                    
                    <c:forEach var="article" items="${articles}">
                    <tr>
                        <td>${listStartNum = listStartNum-1}</td>
                        <td><a href="./view.html">${article.title}</a>&nbsp;[${article.comment}]</td>
                        <td>${article.nick}</td>
                        <td>${article.rdate.substring(2, 10)}</td>
                        <td>${article.hit}</td>
                    </tr>
                    </c:forEach>
                </table>
            </article>

            <!-- page navigation -->
            <div class="paging">
            
            	<c:if test="${groups[0]>1}">
                	<a href="/Jboard2/list.do?pg=${groups[0]-1}" class="prev">Prev</a>
                </c:if>
                
                <c:forEach var="i" begin="${groups[0]}" end="${groups[1]}">
	                <a href="/Jboard2/list.do?pg=${i}" class="num ${currentPage == i ? 'current' : 'off'}">${i}</a>                         
                </c:forEach>      
                
                <c:if test="${groups[1]<lastPageNum}">
               		<a href="/Jboard2/list.do?pg=${groups[1]+1}" class="next">Next</a>
               	</c:if>
            </div>

            <!-- write button -->
            <a href="./write.html" class="btnWrite">Post</a>

        </section>
    </div>    
</body>
</html>