<%@page import="kr.co.jboard1.dao.UserDao"%>
<%@page import="kr.co.jboard1.bean.TermsBean"%>
<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	TermsBean tb = UserDao.getInstance().selectTerms();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Terms</title>
    <link rel="stylesheet" href="../css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    	$(function(){
    		var btnNext = $("#user>div>a:eq(1)");
    		btnNext.click(function() {
    			var chk1 = $('input[name=chk1]').is(':checked');
        		var chk2 = $('input[name=chk2]').is(':checked');
        		
    			if(chk1 && chk2){
    				return true;
    			}else{
    				alert('Please agree both terms.');
    				return false;
    			}
    		})
    	});
    </script>
</head>
<body>
    <div id="wrapper">
        <section id="user" class="terms">
            <table>
                <caption>Terms of Service</caption>
                <tr>
                    <td>
                        <textarea readonly><%=tb.getTerms() %></textarea>
                        <p>
                            <label><input type="checkbox" name="chk1"/> I agree.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <table>
                <caption>Privacy Policy</caption>
                <tr>
                    <td>
                        <textarea readonly><%=tb.getPrivacy() %></textarea>
                        <p>
                            <label><input type="checkbox" name="chk2"/> I agree.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Jboard1/user/login.jsp">Cancel</a>
                <a href="/Jboard1/user/register.jsp">Next</a>
            </div>
        </section>
    </div>
</body>
</html>