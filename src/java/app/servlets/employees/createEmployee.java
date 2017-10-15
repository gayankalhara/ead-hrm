package app.servlets.employees;

import app.models.Employee;
import app.models.Role;
import app.utils.SessionFactoryUtil;
import java.io.IOException;
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

@WebServlet(name = "createEmployeeSubmit", urlPatterns = {"/createEmployeeSubmit"})
public class createEmployee extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Role> role = new ArrayList<Role>();
        Transaction tx = null;
        Session Hsession = SessionFactoryUtil.getCurrentSession();

        try {
            tx = Hsession.beginTransaction();
            role = Hsession.createCriteria(Role.class).list();
            request.setAttribute("list", role);
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
        request.getRequestDispatcher("./pages/employees/createEmployee.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Employee emp = new Employee();
        Role role = new Role();
        emp.setDateOfBirth(request.getParameter("dob"));
        emp.setName(request.getParameter("name"));

        Transaction tx = null;
        Session Hsession = SessionFactoryUtil.getCurrentSession();

        try {
            tx = Hsession.beginTransaction();
            long id = Long.parseUnsignedLong(request.getParameter("role"));
            role = (Role) Hsession.get(Role.class, id);
            emp.setRole(role);
            Hsession.save(emp);
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
        session.setAttribute("EC", "You have successfully create a new Employee.");
        response.sendRedirect("employees");
    }

}
