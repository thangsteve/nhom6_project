/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import bean.CustomersFacade;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customers;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet(name = "EditAvatarServlet", urlPatterns = {"/EditAvatarServlet"})
public class EditAvatarServlet extends HttpServlet {
    
    @EJB CustomersFacade customersFacade;
    
    private static final long serialVersionUID = 1L;

    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "uploadDir";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditAvatarServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditAvatarServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        
        ServletFileUpload upload = new ServletFileUpload(factory);
       
        String uploadPath = getServletContext().getRealPath("")
                + File.separator + UPLOAD_DIRECTORY;

        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        try {
            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            
            String bra_id="";
            Customers bra = new Customers();
            
            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                    if (item.isFormField()) {
                        // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
                        switch (item.getFieldName()) {
                            case "cusID":
                                bra_id=item.getString();
                                bra = customersFacade.find(bra_id);
                                continue;                                                  
                        }
                    } else {                       
                        String fileName = new File(item.getName()).getName();
                        
                        if (fileName.isEmpty()) {
                            //do not thing
                        } else {
                           
                            String filePath = uploadPath + File.separator + fileName;
                            File storeFile = new File(filePath);
                            // saves the file on disk
                            item.write(storeFile);
                            String brandImage = (UPLOAD_DIRECTORY + "/" + fileName);
                            bra.setAvatar(brandImage); 
                        }
                    }
                }
            }
            customersFacade.edit(bra);
            session.setAttribute("LOGIN_CUSTOMER", customersFacade.find(bra_id));
        } catch (Exception ex) {
            ex.getStackTrace();
        }
        // redirects client to message page        
        getServletContext().getRequestDispatcher("/myAccount.jsp").forward(request, response);
   
    }// </editor-fold>

}
