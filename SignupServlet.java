package com.genai;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name,email,username,password) VALUES(?,?,?,?)"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, username);
            ps.setString(4, password);

            int result = ps.executeUpdate();

            if(result > 0){
                request.getSession().setAttribute("message", "Registration Successful!");
                response.sendRedirect("signin.jsp");
            } else {
                request.getSession().setAttribute("message", "Registration Failed!");
                response.sendRedirect("signup.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error occurred!");
            response.sendRedirect("signup.jsp");
        }
    }
}