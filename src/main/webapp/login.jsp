<html>
<body>
<a href="login.jsp">Login</a>
<p>                      </p>
<a href="logout.jsp">Logout</a>
<p>                      </p>
<a href="profile.jsp">Profile</a>
<h2>Sign in: </h2>
<form method="post" action="LoginServlet">
    <input type="text" name="login"/>
    <br>
    <input type="password" name="password">
    <br>
    <input type="text" name="surname">
    <br>
    <input id="date" type="date" name="date">
    <br>
    <p><input type="submit" value="Submit"></p>
</form>
</body>
</html>
