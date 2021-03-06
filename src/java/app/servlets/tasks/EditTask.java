package app.servlets.tasks;

import app.models.Employee;
import app.models.Task;
import app.utils.SessionFactoryUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Gayan
 */
@WebServlet(name = "editTask", urlPatterns = {"/editTask"})
public class EditTask extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        long id = Long.parseUnsignedLong(request.getParameter("id"));

        Transaction tx = null;
        Session Hsession = SessionFactoryUtil.getCurrentSession();

        try {
            tx = Hsession.beginTransaction();
            String hql = "FROM Employee";
            Query query = Hsession.createQuery(hql);
            List<Employee> results = query.list();
            Task task = (Task) Hsession.get(Task.class, id);
            request.setAttribute("task", task);
            request.setAttribute("list", results);
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
        request.getRequestDispatcher("./pages/tasks/editTask.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Task task = new Task();
        task.setDescription(request.getParameter("description"));
        task.setPriority(request.getParameter("pro"));
        task.setId(Long.parseUnsignedLong(request.getParameter("id")));
        
        Transaction tx = null;
        Session Hsession = SessionFactoryUtil.getCurrentSession();
        
        try {
            tx = Hsession.beginTransaction();
            if (!request.getParameter("emp").equalsIgnoreCase("0")) {
                long id = Long.parseUnsignedLong(request.getParameter("emp"));
                Employee emp = (Employee) Hsession.get(Employee.class, id);
                task.setEmployee(emp);
            }
            
            Hsession.update(task);
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
        session.setAttribute("TC", "You have successfully updated the Task.");
        response.sendRedirect("tasks");
    }

}
