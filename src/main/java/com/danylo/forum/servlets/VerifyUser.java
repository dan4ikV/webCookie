package com.danylo.forum.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.Cookie;


/**
 * Created by rebell9191 on 12.09.2017.
 */
@WebServlet(name = "VerifyUser")
public class VerifyUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter show = response.getWriter();
        ServletConfig conf = getServletConfig();

        String correctLogin = conf.getInitParameter("adminLogin");
        String correctPassword = conf.getInitParameter("adminPassword");

        String tempLogin = request.getParameter("login");
        String tempPass = request.getParameter("password");
        String tempDate = request.getParameter("date");

        if (tempLogin.equals(correctLogin) && tempPass.equals(correctPassword)) {
            Cookie ck = new Cookie("name", tempLogin);
            Cookie ckDate = new Cookie("date", tempDate);
            ck.setMaxAge(10000);
            ckDate.setMaxAge(10000);
            response.addCookie(ck);
            response.addCookie(ckDate);
            show.println("Welcome " + ck.getValue() + "<br>");
            show.println("Login date is " + ckDate.getValue());


        } else {
            show.print("Invalid username or password!!!");
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.include(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
