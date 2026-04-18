package com.genai;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class AIChatServlet extends HttpServlet {

protected void doPost(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {

String message = request.getParameter("message");

String reply;

if(message.equalsIgnoreCase("hello"))
reply = "Hello! How can I help you?";

else if(message.contains("ai"))
reply = "AI means Artificial Intelligence.";

else if(message.contains("java"))
reply = "Java is used to build web and mobile applications.";

else
reply = "Sorry, I don't understand. Try asking something else.";

request.setAttribute("reply", reply);

RequestDispatcher rd = request.getRequestDispatcher("aichat.jsp");

rd.forward(request,response);

}

}