package app.servlets.roles;

import app.models.Role;
import app.utils.SessionFactoryUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet(name = "createRoleSubmit", urlPatterns = {"/createRoleSubmit"})
public class createRole extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Role role = new Role();
        role.setTitle(request.getParameter("title"));

        Transaction tx = null;
        Session Hsession = SessionFactoryUtil.getCurrentSession();

        try {
            tx = Hsession.beginTransaction();
            Hsession.save(role);
            tx.commit();
        } catch (RuntimeException e) {
            if (tx != null && tx.isActive()) {
                try {
                    tx.rollback();
                } catch (HibernateException e1) {
                    System.out.println("Error rolling back transaction");
                }
                throw e;
            }
        }
        HttpSession session = request.getSession();
        session.setAttribute("RC", "You have successfully create a new Role.");
        response.sendRedirect("roles");
    }

}
