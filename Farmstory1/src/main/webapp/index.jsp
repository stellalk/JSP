<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.farmstory1.config.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.farmstory1.config.DBConfig"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<%
	//1,2
	Connection conn = DBConfig.getInstance().getConnection();

	//3
	Statement stmt = conn.createStatement();
	
	//4
	ResultSet rs = stmt.executeQuery(Sql.SELECT_ARTICLE_LATEST);
	
	//5
	Map<String, List<ArticleBean>> map = new HashMap<>();
	
	for(int k=0; k<3; k++){
		String key = null;
		List<ArticleBean> list = new ArrayList<>();
		
		for(int i=0; i<5; i++){
			rs.next();
			
			ArticleBean article = new ArticleBean();
			article.setSeq(rs.getInt(1));
			article.setTitle(rs.getString(5));
			article.setRdate(rs.getString(11).substring(2, 10));
			list.add(article);
			
			key = rs.getString(4);
		}
		map.put(key, list);
	}
	
	//6
	rs.close();
	stmt.close();
	conn.close();
%>
<main>
    <div class="slider">
        <ul>
            <li><img src="/Farmstory1/img/main_slide_img1.jpg" alt="slide1"></li>
            <li><img src="/Farmstory1/img/main_slide_img2.jpg" alt="slide2"></li>
            <li><img src="/Farmstory1/img/main_slide_img3.jpg" alt="slide3"></li>
        </ul>
        <img src="/Farmstory1/img/main_slide_img_tit.png" alt="slogan img">
        <div>
            <img src="/Farmstory1/img/main_banner_txt.png" alt="GRAND OPEN">
            <img src="/Farmstory1/img/main_banner_tit.png" alt="30% sale">
            <img src="/Farmstory1/img/main_banner_img.png" alt="GRAND OPEN">
        </div>
    </div>
    <div class="banner">
        <a href="#"><img src="/Farmstory1/img/main_banner_sub1_tit.png" alt=""></a>
        <a href="#"><img src="/Farmstory1/img/main_banner_sub2_tit.png" alt=""></a>
    </div>
    <div class="latest">
        <div>
            <img src="/Farmstory1/img/main_latest1_tit.png" alt="">
            <img src="/Farmstory1/img/main_latest1_img.jpg" alt="">
            <table border="0">
            <%for(ArticleBean article: map.get("grow")) { %>
                <tr>
                    <td>></td>
                    <td><a href="#"><%=article.getTitle() %></a></td>
                    <td><%=article.getRdate() %></td>
                </tr>
            <%} %>
            </table>
        </div>
        <div>
            <img src="/Farmstory1/img/main_latest2_tit.png" alt="">
            <img src="/Farmstory1/img/main_latest2_img.jpg" alt="">
            <table border="0">
            <%for(ArticleBean article: map.get("school")) { %>
                <tr>
                    <td>></td>
                    <td><a href="#"><%=article.getTitle() %></a></td>
                    <td><%=article.getRdate() %></td>
                </tr>
            <%} %>
            </table>
        </div>
        <div>
            <img src="/Farmstory1/img/main_latest3_tit.png" alt="">
            <img src="/Farmstory1/img/main_latest3_img.jpg" alt="">
            <table border="0">
            <%for(ArticleBean article: map.get("story")) { %>
                <tr>
                    <td>></td>
                    <td><a href="#"><%=article.getTitle() %></a></td>
                    <td><%=article.getRdate() %></td>
                </tr>
            <%} %>
            </table>
        </div>
    </div>
    <div class="info"></div>
</main>
<%@ include file="./_footer.jsp" %>  