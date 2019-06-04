/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.ProductsFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Products;

/**
 *
 * @author Tuan
 */
public class AutoComplete extends HttpServlet {
    @EJB
    private ProductsFacadeLocal productsFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String json = "[";
        int i = 0;
        for (Products p : productsFacade.findAll()) {
            json += "{";

            json += "\"proURL\":\""+productLink(req, p)+"\",";
            json += "\"proName\":\""+p.getProductName()+"\",";
            json += "\"proImage\":\""+ImagesLink(req, p)+"\"";
            
            json += "}";
            i++;
            if (i != productsFacade.count()) {
                json += ",";
            }

        }
        json += "]";
        out.println(json);

    }

    private String productLink(HttpServletRequest req, Products p) {
        return "http://"+req.getServerName() + ":" + req.getServerPort() + req.getContextPath()+ "/ProductDetailsServlet?id=" + p.getProductID();
    }
    

    private String ImagesLink(HttpServletRequest req, Products p) {
        return "http://"+req.getServerName() + ":" + req.getServerPort() + req.getContextPath() + "/uploadDir/" + p.getImage1();
    }
}
