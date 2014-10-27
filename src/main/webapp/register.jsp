<%-- 
    Document   : register.jsp
    Created on : Sep 28, 2014, 6:29:51 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </head>
    <body>
        <header class="header">
            <div class="centered-block centered-text">
                <div class="top-bar-left"><a class="bar-button" href="../Instagrim">Home</a></div>
                <div class="top-bar-right"><a class="bar-button" href="Login">Login</a></div>
                <div class="top-bar-center">Instafilter</div>
            </div>
        </header>
        <div class="centered-block">
            <div class="main-pad">
                <div class="welcome-box">
                    <p class="intro-text">Register as user</p>
                </div>
                <div class="form-box">
                    <article>
                        <form method="POST"  action="Register">
                            <ul>
                                <li>User Name:<input type="text" name="username"></li>
                                <li>Password:<input type="password" name="password"></li>
                            </ul>
                            <input type="submit" value="Register"> 
                        </form>
                    </article>
                </div>
            </div>
            <footer>
                <ul>
                    <li>&COPY; Sondai Smith</li>
                </ul>
            </footer>
        </div>
    </body>
</html>
