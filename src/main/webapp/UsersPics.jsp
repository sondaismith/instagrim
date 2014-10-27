<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="../css/styles.css" />
    </head>
    <body>
        <header class="header">
            <div class="centered-block centered-text">
                <div class="top-bar-left"><a class="bar-button" href="../../Instagrim">Home</a></div>
                <div class="top-bar-right"><a class="bar-button" href="../Logout">Logout</a></div>
                <div class="top-bar-right"><a class="bar-button" href="../Upload">Upload</a></div>
                <div class="top-bar-center">Instafilter</div>
            </div>
        </header>
        <div class="centered-block">
            <div class="main-pad">
                <div class="welcome-box">
                <%
                    LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                            if (lg != null) 
                            {
                                String UserName = lg.getUsername();
                            }
                    %>
                    <p class="intro-text"><%=lg.getUsername()%>'s Pics</p>
                </div>
                <article>
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
                </article>
                </div>
                <footer>
                    <ul>
                        <li>&COPY; Sondai Smith</li>
                    </ul>
                </footer>
            </div>
        </div>
    </body>
</html>
