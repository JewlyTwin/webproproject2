/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
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
import model.Cart;
import model.Customer;
import model.ItemsinCart;
import model.Orderdetail;
import model.Orders;
import model.Payment;
import model.controller.CustomerJpaController;
import model.controller.OrderdetailJpaController;
import model.controller.OrdersJpaController;
import model.controller.PaymentJpaController;

/**
 *
 * @author Computer
 */
public class OrderDetailServlet extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        HttpSession session = request.getSession(false);
        Customer cus = (Customer) session.getAttribute("cus");
        CustomerJpaController cusCtrl = new CustomerJpaController(utx, emf);
        Customer newcus = cusCtrl.findCustomer(cus.getUsername());

        String orderidStr = request.getParameter("orderid");
        if (orderidStr != null && orderidStr.trim().length() > 0) {
            int orderid = Integer.valueOf(orderidStr);
            OrdersJpaController orderCtrl = new OrdersJpaController(utx, emf);
            Orders order = orderCtrl.findOrders(orderid);
            OrderdetailJpaController orderDeCtrl = new OrderdetailJpaController(utx, emf);

            Cart cart = (Cart) session.getAttribute("cart");
            List<ItemsinCart> itemlist = cart.getitemsInCart();
            for (ItemsinCart item : itemlist) {
                Orderdetail orderdetail = new Orderdetail();
                orderdetail.setOrderid(order);
                orderdetail.setProductid(item.getProduct());
                orderdetail.setQuantity(item.getQuantity());
                orderdetail.setTotalprice(item.getTotalPrice());
                orderDeCtrl.create(orderdetail);
            }
        }

        session.setAttribute("cus", newcus);
        getServletContext().getRequestDispatcher("/CardInfo.jsp").forward(request, response);

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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(OrderDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
            Logger.getLogger(OrderDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
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
