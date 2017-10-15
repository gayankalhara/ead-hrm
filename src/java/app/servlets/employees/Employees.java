package app.servlets.employees;

import app.models.Employee;
import app.models.Role;
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
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet(name = "employees", urlPatterns = {"/employees"})
public class Employees extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Employee> emp = new ArrayList<Employee>();
        Transaction tx = null;
        Session Hsession = SessionFactoryUtil.getCurrentSession();

        try {
            tx = Hsession.beginTransaction();
            emp = Hsession.createCriteria(Employee.class).list();
            request.setAttribute("list", emp);
            tx.commit();
        } catch (RuntimeException e) {
            if (tx != null && tx.isActive()) {
                try {
                    tx.rollback();
                } catch (HibernateException e1) {
                    System.out.println("Error rolling back transaction");
                }
                // throw again the first exception
                throw e;
            }
        }
      
        request.getRequestDispatcher("./pages/employees/employees.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
