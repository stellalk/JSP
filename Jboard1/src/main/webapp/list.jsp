<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// session user info
	UserBean user = (UserBean) session.getAttribute("suser");
	
	if(user == null){
		// when not logged in yet
		response.sendRedirect("/Jboard1/user/login.jsp?result=2");
		return; // exit program
	}
	
	//receive
	String pg = request.getParameter("pg");
	
	//page
	ArticleDao dao = ArticleDao.getInstance();
	
	int total 		= dao.selectCountArticle();
	int lastPageNum = dao.getLastPageNum(total);
	int currentPage = dao.getCurrentPage(pg);
	int start 		= dao.getLimitStart(currentPage); 
	int[] groups	= dao.getPageGroup(currentPage, lastPageNum);
	int pageStartNum= dao.getPageStartNum(total, start);

	//database
	List<ArticleBean> articles = dao.selectArticles(start);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css">    
</head>
<body>
    <div id="wrapper">
        <section id="board" class="list">
            <h3>List</h3>
            <article>
                <p>
                    Welcome,  <%= user.getNick() %>.
                    <a href="/Jboard1/user/proc/logout.jsp" class="logout">[Logout]</a>
                </p>
                <table border="0">
                    <tr>
                        <th>No</th>
                        <th>Title</th>
                        <th>Name</th>
                        <th>Date</th>
                        <th>Hit</th>
                    </tr>
                    <% for(ArticleBean ab : articles){ %>
                    	<tr>
                        	<td><%=pageStartNum-- %></td>
                        	<td><a href="/Jboard1/view.jsp?seq=<%=ab.getSeq()%>"><%=ab.getTitle() %></a>&nbsp;[<%=ab.getComment() %>]</td>
                        	<td><%=ab.getNick() %></td>
                        	<td><%=ab.getRdate().substring(2, 10) %></td>
                        	<td><%=ab.getHit() %></td>
                    	</tr>
                    <%} %>
                </table>
            </article>

            <!-- page navigation -->
            <div class="paging">
            	<% if(groups[0] > 1){ %>
                <a href="/Jboard1/list.jsp?pg=<%= groups[0] - 1 %>" class="prev">Prev</a>
                <% } %>
                
                <% for(int i=groups[0] ; i<=groups[1] ; i++){ %>
                	<a href="/Jboard1/list.jsp?pg=<%= i %>" class="num <%= (currentPage == i) ? "current":"off" %>"><%= i %></a>                
                <% } %>
                
                <% if(groups[1] < lastPageNum){ %>
                <a href="/Jboard1/list.jsp?pg=<%= groups[1] + 1 %>" class="next">Next</a>
                <% } %>
            </div>

            <!-- write button -->
            <a href="/Jboard1/write.jsp" class="btnWrite">New Post</a>

        </section>
    </div>    
</body>
</html>