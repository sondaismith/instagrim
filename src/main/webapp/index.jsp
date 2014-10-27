<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <header class="header">
            <div class="centered-block centered-text">
                <div class="top-bar-left"><a class="bar-button" href="../Instagrim">Home</a></div>
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
                <%
                    if (lg != null) 
                    {
                        %>
                <p class="intro-text">Welcome back <%=lg.getUsername()%>!</p>
                <%
                    }
                    else
                    {
                %>
                <p class="intro-text">Welcome to Instafilter!</p>
                <%  }
                %>
                <p class="title-descriptor">Latest Images:</p>
                </div>
                <%
                    java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
                    if (lsPics == null) 
                    {
                %>
                <p class="no-pics-text">No Pictures Found</p>
                <%
                    } 
                    else 
                    {
                        Iterator<Pic> iterator;
                        iterator = lsPics.iterator();

                        while (iterator.hasNext()) 
                        {
                            Pic p = (Pic) iterator.next();
                            System.out.println("Pic Object: "+p.toString());

                %>
                <div class="image-box">
                    <a href="/Instagrim/Image/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a><br/>
                    <div class="image-box-descriptor">
                        <p>Uploaded: <%=p.getDateUploaded()%></p>
                        <p>User: <%=p.getUser()%></p>
                    </div>
                </div>
                        <%
                        }
                    }
                %>
            </div>
            <footer>
                <ul>
                    <li>&COPY; Sondai Smith</li>
                </ul>
            </footer>
        </div>
    </body>
</html>
