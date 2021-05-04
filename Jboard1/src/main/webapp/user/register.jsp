<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/Jboard1/js/CheckUser.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/Jboard1/js/zipcode.js"></script>
	<script src="/Jboard1/js/validation.js"></script>
</head>
<body>
    <div id="wrapper">
        <section id="user" class="register">
            <form action="/Jboard1/user/proc/register.jsp" method="POST">
                <table border="1">
                    <caption>Create your account</caption>
                    <tr>
                        <td>ID</td>
                        <td>
                            <input type="text" name="uid" placeholder="User ID"/>
                            <span class="resultId"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td>
                            <input type="password" name="pass1" placeholder="Password"/>                            
                        </td>
                    </tr>
                    <tr>
                        <td>Confirm</td>
                        <td>
                            <input type="password" name="pass2" placeholder="Confirm password"/>
                            <span class="resultPass"></span>
                        </td>
                    </tr>
                </table>
                <table border="1">
                    <caption>Enter your information</caption>
                    <tr>
                        <td>Name</td>
                        <td>
                            <input type="text" name="name" placeholder="Name"/>   
                            <span class="resultName"></span>                          
                        </td>
                    </tr>
                    <tr>
                        <td>Nickname</td>
                        <td>
                            <p>You can use letters & numbers</p>
                            <input type="text" name="nick" placeholder="Nickname"/>
                            <span class="resultNick"></span>                            
                        </td>
                    </tr>
                    <tr>
                        <td>E-Mail</td>
                        <td>
                            <input type="email" name="email" placeholder="Email"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td>
                            <input type="text" name="hp" placeholder="Enter as 000-0000-0000" minlength="13" maxlength="13" />
                        </td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td>
                            <div>
                                <input type="text" id="zip" name="zip" placeholder="zip code" readonly/>
                                <button type="button" class="btnZip" onclick="zipcode()">Search</button>
                            </div>                            
                            <div>
                                <input type="text" id="addr1" name="addr1" placeholder="Address Line 1" readonly/>
                            </div>
                            <div>
                                <input type="text" id="addr2" name="addr2" placeholder="Address Line 2"/>
                            </div>
                        </td>
                    </tr>
                </table>

                <div>
                    <a href="/Jboard1/user/login.jsp" class="btnCancel">Cancel</a>
                    <input type="submit"   class="btnJoin" value="Sign Up"/>
                </div>

            </form>
        </section>
    </div>    
</body>
</html>