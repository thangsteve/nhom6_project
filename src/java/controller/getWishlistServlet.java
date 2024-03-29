/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.BrandFacadeLocal;
import bean.CategoryFacadeLocal;
import bean.ProductsFacadeLocal;
import bean.WishlistFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Brand;
import model.Category;
import model.Products;

/**
 *
 * @author congm
 */
public class getWishlistServlet extends HttpServlet {

    @EJB
    private ProductsFacadeLocal productsFacade;
    @EJB
    private WishlistFacadeLocal wishlistFacade;
    @EJB
    private CategoryFacadeLocal categoryFacade;
    @EJB
    private BrandFacadeLocal brandFacade;

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String cusId = request.getParameter("customerId");
            request.setAttribute("wishlist", wishlistFacade.findByCustomer(cusId));
            HttpSession session = request.getSession();
            List<Category> listCategory = categoryFacade.FindAllByStatus();
            List<Brand> listBrand = brandFacade.FindBrandByStatus();
            List<Products> listProduct = productsFacade.AllProduct();
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("catelist", listCategory);
            request.setAttribute("brandList", listBrand);
    session.setAttribute("countWishlist", wishlistFacade.findByCustomer(cusId).size());
        
            request.getRequestDispatcher("wishlist.jsp").forward(request, response);
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
