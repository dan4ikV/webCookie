<%@ page import="com.danylo.forum.servlets.VerifyUser" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<a href="login.jsp">Login</a>
<p></p>
<a href="logout.jsp">Logout</a>
<p></p>
<a href="profile.jsp">Profile</a>
<h2>Your profile</h2>
<p>Name:
    <%
    Cookie[] cookies = request.getCookies();
    PrintWriter show = response.getWriter();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("login")) {
                show.println(c.getValue());
                System.out.println("\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n" + c.getValue() + "\n" + "\n" + "\n" + "\n" + "\n");
            }
        }
    } else {
        show.println("<p>No active session you have to log in:</p>\n");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.include(request, response);
    }
%></p>
<p>Surname :<%
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("surname")) {
                show.println(c.getValue());
                System.out.println("\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n" + c.getValue() + "\n" + "\n" + "\n" + "\n" + "\n");
            }
        }
    }
%></p>
</body>
</html>
