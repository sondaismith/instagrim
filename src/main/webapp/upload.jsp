<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
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
                <div class="top-bar-left"><a class="bar-button" href="../../Instagrim">Home</a></div>
                <%
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) 
                        {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) 
                            {
                    %>
                <div class="top-bar-right"><a class="bar-button" href="Logout">Logout</a></div>
                <div class="top-bar-right"><a class="bar-button" href="Images/<%=lg.getUsername()%>"><%=lg.getUsername()%>'s Images</a></div>
                <%
                            }
                        }
                        else
                        {
                %>
                <div class="top-bar-right"><a class="bar-button" href="Login">Login</a></div>
                <%
                        }
                            %>
                <div class="top-bar-center">Instafilter</div>
            </div>
        </header>
        <div class="centered-block">
            <div class="main-pad">
                <div class="welcome-box">
                    <p class="intro-text">Upload an Image</p>
                </div>
                <div class="form-box" style="width: 550px">
                    <article>
                        <form method="POST" enctype="multipart/form-data" action="Image">
                            <span>File to upload:</span><br/>
                            <input type="file" name="upfile">
                            <br/>
                            <input type="submit" value="Press"> to upload the file!
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
