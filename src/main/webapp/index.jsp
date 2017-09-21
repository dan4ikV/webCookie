<%@ page import="com.danylo.forum.servlets.VerifyUser" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<a href="login.jsp">Login</a> |
<%
    Cookie[] cookies = request.getCookies();
    PrintWriter show = response.getWriter();
    ServletContext context = getServletConfig().getServletContext();

    String adminPasswrod = context.getInitParameter("pass");
    String adminLogin = context.getInitParameter("login");

    String cookieLogin = "";
    String cookiePassword = "";
    String cookieSurname = "";

    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("login")) cookieLogin = c.getValue();
            if (c.getName().equals("pass")) cookiePassword = c.getValue();
            if (c.getName().equals("surname")) cookiePassword = c.getValue();
        }
    }

    if(cookieLogin.equals(adminLogin) && cookiePassword.equals(adminPasswrod)){
        show.print("<a href=\"logout.jsp\">Logout</a> |\n" +
                "<a href=\"profile.jsp?uname=" + cookieLogin + "&surname=" + cookieSurname + "\""+">Profile</a>");
    }
    %>
 |
<h2>Welcome to our site</h2>
</body>
</html>
