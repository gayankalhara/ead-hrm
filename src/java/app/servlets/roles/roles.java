
package app.servlets.roles;

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
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet(name = "roles", urlPatterns = {"/roles"})
public class roles extends HttpServlet {

   

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Role> roles = new ArrayList<Role>();
        Transaction tx = null;
        Session Hsession = SessionFactoryUtil.getCurrentSession();
        
        try {
            tx = Hsession.beginTransaction();
            roles = Hsession.createCriteria(Role.class).list();
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
          request.getRequestDispatcher("./pages/roles/roles.jsp").forward(request, response);
   
    }
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       

    }


}
