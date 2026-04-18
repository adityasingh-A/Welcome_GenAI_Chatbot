package com.genai;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("username");

        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("newPass");

        String message = "";
        String redirectPage = "settings.jsp";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE username=? AND password=?"
            );

            ps.setString(1, username);
            ps.setString(2, oldPass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                PreparedStatement update = con.prepareStatement(
                    "UPDATE users SET password=? WHERE username=?"
                );

                update.setString(1, newPass);
                update.setString(2, username);

                update.executeUpdate();

                message = "Password Changed Successfully!";
                redirectPage = "settings.jsp";

                // 🔥 session use kar (redirect ke liye)
                request.getSession().setAttribute("message", message);

            } else {
                request.getSession().setAttribute("message", "Wrong Current Password!");
                redirectPage = "settings.jsp";
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error occurred!");
        }

        response.sendRedirect(redirectPage);
    }
}