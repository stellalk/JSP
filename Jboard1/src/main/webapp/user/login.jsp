<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="../css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="user" class="login">
            <form action="../list.html">
                <table border="0">
                    <tr>
                        <td><img src="../img/login_ico_id.png" alt="id"/></td>
                        <td><input type="text" name="uid" placeholder="User ID" /></td>
                    </tr>
                    <tr>
                        <td><img src="../img/login_ico_pw.png" alt="password"/></td>
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