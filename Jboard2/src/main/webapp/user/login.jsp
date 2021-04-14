<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="/Jboard2/css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="user" class="login">
            <form action="/Jboard2/user/login.do" method="POST">
                <table border="0">
                    <tr>
                        <td><img src="/Jboard2/img/login_ico_id.png" alt="아이디"/></td>
                        <td><input type="text" name="uid" placeholder="Enter ID" /></td>
                    </tr>
                    <tr>
                        <td><img src="/Jboard2/img/login_ico_pw.png" alt="비밀번호"/></td>
                        <td><input type="password" name="pass" placeholder="Enter password" /></td>
                    </tr>
                </table>
                <input type="submit" class="btnLogin" value="Login"/>
            </form>

            <div class="info">
                <p>
                    Sign up if you don't already have an account.
                </p>
                <a href="/Jboard2/user/terms.do">Sign Up</a>
            </div>

        </section>
    </div>    
</body>
</html>