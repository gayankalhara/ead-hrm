package app.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {      
        
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username.equalsIgnoreCase("admin") && password.equalsIgnoreCase("admin")) {
            session.setAttribute("username", username);
            session.setMaxInactiveInterval(30 * 60);
            request.getRequestDispatcher("home").forward(request, response);
        } else {
            request.setAttribute("loginError", "Username and Password Invalid");
            request.getRequestDispatcher("./pages/login.jsp").forward(request, response);
        }
    }

}
