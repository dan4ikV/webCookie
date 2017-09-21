package com.danylo.forum.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by rebell9191 on 18.09.2017.
 */
@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String correctLogin = getInitParameter("login");
        String correctPass = getInitParameter("password");

        String login = request.getParameter("login");
        String pass = request.getParameter("password");
        String surname = request.getParameter("surname");
        if(login.equals(correctLogin) && pass.equals(correctPass)){
            Cookie loginCoockie = new Cookie("login", login);
            Cookie passCoockie = new Cookie("pass", pass);
            Cookie surnameCoockie = new Cookie("surname", surname);
            loginCoockie.setMaxAge(9999999);
            passCoockie.setMaxAge(9999999);
            surnameCoockie.setMaxAge(9999999);
            response.addCookie(loginCoockie);
            response.addCookie(passCoockie);
            response.addCookie(surnameCoockie);
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
