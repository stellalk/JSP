<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String result = request.getParameter("result");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css"/>
    <script>
    	var result = "<%= result %>";
    	if(result == 0){
    		alert('The account is not registered. Please try again.');
    	}else if(result == 1){
    		alert('You are logged out.');
    	}else if(result == 2){
    		alaert('You need to log in first.');
    	}
    </script>
</head>
<body>
    <div id="wrapper">
        <section id="user" class="login">
            <form action="/Jboard1/user/proc/login.jsp" method="post">
                <table border="0">
                    <tr>
                        <td><img src="/Jboard1/img/login_ico_id.png" alt="id"/></td>
                        <td><input type="text" name="uid" placeholder="User ID" /></td>
                    </tr>
                    <tr>
                        <td><img src="/Jboard1/img/login_ico_pw.png" alt="password"/></td>
                        <td><input type="password" name="pass" placeholder="Password" /></td>
                    </tr>
                </table>
                <input type="submit" class="btnLogin" value="Sign in"/>
            </form>

            <div class="info">
                <h3>Registration info</h3>
                <p>
                    Sign up if you don't already have an account.
                </p>
                <a href="/JBoard1/user/terms.jsp">Register</a>
            </div>

        </section>
    </div>    
</body>
</html>