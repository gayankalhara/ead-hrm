package app.servlets;

import app.models.Employee;
import app.models.Role;
import app.models.Task;
import app.utils.SessionFactoryUtil;
import java.io.IOException;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

@WebServlet(name = "home", urlPatterns = {"/home"})
public class home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Transaction tx = null;
        Session Hsession = SessionFactoryUtil.getCurrentSession();

        try {
            tx = Hsession.beginTransaction();
            long empCount = (long) Hsession.createCriteria(Employee.class).setProjection(Projections.rowCount()).uniqueResult();
            long roleCount = (long) Hsession.createCriteria(Role.class).setProjection(Projections.rowCount()).uniqueResult();
            long taskCount = (long) Hsession.createCriteria(Task.class).setProjection(Projections.rowCount()).uniqueResult();

            Criteria crit = Hsession.createCriteria(Task.class);
            crit.add(Restrictions.eq("proirity", "Low"));
            crit.setProjection(Projections.rowCount());
            long lCount = (long) crit.uniqueResult();

            Criteria crit2 = Hsession.createCriteria(Task.class);
            crit2.add(Restrictions.eq("proirity", "Medium"));
            crit2.setProjection(Projections.rowCount());
            long mCount = (long) crit2.uniqueResult();

            Criteria crit3 = Hsession.createCriteria(Task.class);
            crit3.add(Restrictions.eq("proirity", "High"));
            crit3.setProjection(Projections.rowCount());
            long hCount = (long) crit3.uniqueResult();

            float l = (float) lCount;
            float m = (float) mCount;
            float h = (float) hCount;

            DecimalFormat df2 = new DecimalFormat(".##");

            request.setAttribute("empCount", empCount);
            request.setAttribute("roleCount", roleCount);
            request.setAttribute("taskCount", taskCount);

            if (taskCount != 0) {
                request.setAttribute("lCount", df2.format((l / taskCount) * 100));
                request.setAttribute("mCount", df2.format(((m / taskCount) * 100)));
                request.setAttribute("hCount", df2.format((h / taskCount) * 100));
            } else {
                request.setAttribute("lCount", 0.00);
                request.setAttribute("mCount", 0.00);
                request.setAttribute("hCount", 0.00);
            }

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
        request.getRequestDispatcher("./pages/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
