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

@WebServlet(name = "editRole", urlPatterns = {"/editRole"})
public class EditRole extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        long id = Long.parseUnsignedLong(request.getParameter("id"));

        Transaction tx = null;
        Session Hsession = SessionFactoryUtil.getCurrentSession();

        try {
            tx = Hsession.beginTransaction();
            Role role = (Role) Hsession.get(Role.class, id);
            request.setAttribute("data", role);
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

        request.getRequestDispatcher("./pages/roles/editRole.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Role role = new Role();
        role.setId(Long.parseUnsignedLong(request.getParameter("id")));
        role.setTitle(request.getParameter("title"));

        Transaction tx = null;
        Session Hsession = SessionFactoryUtil.getCurrentSession();

        try {
            tx = Hsession.beginTransaction();
            Hsession.update(role);
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
        session.setAttribute("RC", "You have successfully updated the Role.");
        response.sendRedirect("roles");

    }

}
