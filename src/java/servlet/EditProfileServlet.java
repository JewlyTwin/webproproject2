/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Customer;
import model.controller.CustomerJpaController;
import model.controller.exceptions.RollbackFailureException;

/**
 *
 * @author Computer
 */
public class EditProfileServlet extends HttpServlet {

    @PersistenceUnit(unitName = "WonderFruitWebAppPU")
    EntityManagerFactory emf;

    @Resource
    UserTransaction utx;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, RollbackFailureException, Exception {
  HttpSession session = request.getSession(false);

        try {
            
            String password = request.getParameter("pass");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String tel = request.getParameter("tel");
            String address = request.getParameter("address");
        

            if (password != null && password.trim().length() > 0
                    && fname != null && fname.trim().length() > 0
                    && lname != null && lname.trim().length() > 0
                    && tel != null && tel.trim().length() > 0
                    && address != null && address.trim().length() > 0) {

                Customer cus = (Customer) session.getAttribute("cus");
                CustomerJpaController cusCtrl = new CustomerJpaController(utx, emf);
                Customer newcus = cusCtrl.findCustomer(cus.getUsername());
                
                Date getdob = newcus.getDob();
                SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd");
                String fdob= d.format(getdob);
                Date dob = d.parse(fdob);
                
                newcus.setUsername(newcus.getUsername());
                newcus.setPassword(password);
                newcus.setFname(fname);
                newcus.setLname(lname);
                newcus.setTelno(tel);
                newcus.setAddress(address);
                newcus.setDob(dob);

                cusCtrl.edit(newcus);

                session.setAttribute("cus", newcus);
                getServletContext().getRequestDispatcher("/Account").forward(request, response);
                return;
            }
        } catch (NullPointerException e) {
            getServletContext().getRequestDispatcher("/EditProfile.jsp").forward(request, response);
            return;
        }
        getServletContext().getRequestDispatcher("/EditProfile.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/EditProfile.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(EditProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
