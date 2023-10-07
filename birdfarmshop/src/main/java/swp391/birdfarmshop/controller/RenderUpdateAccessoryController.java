/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package swp391.birdfarmshop.controller;

import java.io.IOException;
//import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import swp391.birdfarmshop.dao.AccessoryCategoryDAO;
import swp391.birdfarmshop.dao.AccessoryDAO;
import swp391.birdfarmshop.dao.ImageDAO;
import swp391.birdfarmshop.model.Accessory;
import swp391.birdfarmshop.model.AccessoryCategory;
import swp391.birdfarmshop.model.Image;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RenderUpdateAccessoryController", urlPatterns = {"/RenderUpdateAccessoryController"})
public class RenderUpdateAccessoryController extends HttpServlet {

    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "management/edit-accessory.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String user = request.getParameter("user_role");
            String id = request.getParameter("accessory_id");
            AccessoryDAO d = new AccessoryDAO();
            Accessory a = d.getAccessoryByID(id);
            AccessoryCategoryDAO dao = new AccessoryCategoryDAO();
            List<AccessoryCategory> ac = dao.getAccessoryCategories();
            ImageDAO im = new ImageDAO();
            String url_thumnail = im.getThumbnailUrlByAccessoryId(id);
            List<Image> list = im.getImageByAccessoryId(id);
            if(!list.isEmpty()){
                request.setAttribute("list", list);
            }
            if(url_thumnail != null){
                request.setAttribute("url_thumnail", url_thumnail);
            }
            if (ac != null) {
                request.setAttribute("ac", ac);
            }
            if(user.equals("admin") || user.equals("manager")){
                request.setAttribute("user", user);
            }
            if(a != null){
                request.setAttribute("a", a);
            }
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at RenderAddAccessoryController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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