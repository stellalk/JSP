<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//encoding
	request.setCharacterEncoding("utf-8");

	//data
	String seq = request.getParameter("seq");
	
	//session user info
	UserBean user = (UserBean) session.getAttribute("suser");
	String uid = user.getUid();
	
	//database update hits
	ArticleDao dao = ArticleDao.getInstance();
	dao.updateArticleHit(seq);
	
	//database get posts
	ArticleBean ab = dao.selectArticle(seq);
	
	//database get comments
	List<ArticleBean> comments = dao.selectComments(seq);

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="view">
            <h3>View</h3>
            <table>
                <tr>
                    <td>Title</td>
                    <td><input type="text" name="title" value="<%=ab.getTitle() %>" readonly/></td>
                </tr>
                <%if(ab.getFile() > 0){ %>
                <tr>
                    <td>Attached</td>
                    <td>
                        <a href="#"><%= ab.getFb().getOldName() %></a>
                        <span><%= ab.getFb().getDownload() %> Download(s)</span>
                    </td>
                </tr>
                <%} %>
                <tr>
                    <td>Content</td>
                    <td>
                        <textarea name="content" readonly><%=ab.getContent() %></textarea>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Jboard1/delete.jsp" class="btnDelete">Delete</a>
                <a href="/Jboard1/modify.jsp" class="btnModify">Edit</a>
                <a href="/Jboard1/list.jsp" class="btnList">List</a>
            </div>  
            
            <!-- Comment List -->
            <section class="commentList">
                <h3>Comments</h3>
                <% if(ab.getComment() > 0){ %>
                	
                	<% for(ArticleBean comment : comments){ %>
		                <article class="comment">
		                    <span>
		                        <span><%= comment.getNick() %></span>
		                        <span><%= comment.getRdate().substring(2, 10) %></span>
		                    </span>
		                    <textarea name="comment" readonly><%= comment.getContent() %></textarea>
		                    <div>
		                    	<% if(uid.equals(comment.getUid())){ %>
		                        	<a href="/Jboard1/proc/deleteComment.jsp?seq=<%= comment.getSeq() %>&parent=<%= comment.getParent() %>">삭제</a>
		                        <% } %>
		                    </div>
		                </article>
	            	<% } %>
		               
                <%}else{ %>
	                <p class="empty">
	                    No Comments
	                </p>
                <%} %>
            </section>

            <!-- Comment Form -->
            <section class="commentForm">
                <h3>Write a comment</h3>
                <form action="/Jboard1/proc/comment.jsp" method="post">
                	<input type="hidden" name="seq" value="<%= ab.getSeq() %>" /> 
                    <textarea name="comment" required="required"></textarea>
                    <div>
                        <a href="/Jboard1/list.jsp" class="btnCancel">Cancel</a>
                        <input type="submit" class="btnWrite" value="Submit"/>
                    </div>
                </form>
            </section>

        </section>
    </div>    
</body>
</html>