/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import bean.CustomersFacadeLocal;
import bean.WishlistFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customers;
import model.Products;
import model.Wishlist;

/**
 *
 * @author congm
 */
public class loginCustomerServlet extends HttpServlet {
    @EJB
    private WishlistFacadeLocal wishlistFacade1;
    @EJB
    private WishlistFacadeLocal wishlistFacade;
    @EJB
    private CustomersFacadeLocal customersFacade;

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          HttpSession session = request.getSession(true);
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Customers custom = new Customers();
            if ((custom = customersFacade.checkLogin(email, password)) != null) {              
                if (custom.getCustomerState()) {
                       session.setAttribute("LOGIN_CUSTOMER", custom);
                       session.setAttribute("cusID", custom.getCustomerID());
                         session.setAttribute("countWishlist", wishlistFacade.findByCustomer(custom.getCustomerID()).size());
    
                         List<Products> productList = new ArrayList<>();

                for (Wishlist item : wishlistFacade.findByCustomer(customersFacade.checkLogin(email, password).getCustomerID())) {
                    productList.add(item.getProductID());

                }
                    session.setAttribute("wishlist", productList);
                    request.getRequestDispatcher("ProductServlet").forward(request, response);
                    
                } else {
                    request.setAttribute("error", "Your account has been locked");
                    request.getRequestDispatcher("logreg.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Email address or password is invalid");
                request.getRequestDispatcher("logreg.jsp").forward(request, response);
            }
            
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
