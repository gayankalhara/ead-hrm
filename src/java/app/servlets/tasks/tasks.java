package app.servlets.tasks;

import app.models.Role;
import app.models.Task;
import app.utils.SessionFactoryUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Gayan
 */
@WebServlet(name = "tasks", urlPatterns = {"/tasks"})
public class tasks extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Task> roles = new ArrayList<Task>();
        Transaction tx = null;
        Session Hsession = SessionFactoryUtil.getCurrentSession();

        try {
            tx = Hsession.beginTransaction();
            roles = Hsession.createCriteria(Task.class).list();
            request.setAttribute("list", roles);
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
        request.getRequestDispatcher("./pages/tasks/tasks.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
