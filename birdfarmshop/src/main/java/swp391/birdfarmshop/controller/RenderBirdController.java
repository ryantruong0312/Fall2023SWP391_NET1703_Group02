/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package swp391.birdfarmshop.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import swp391.birdfarmshop.dao.BirdDAO;
import swp391.birdfarmshop.dao.ImageDAO;
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.model.Image;

/**
 *
 * @author phong pc
 */
public class RenderBirdController extends HttpServlet {
   
    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "shop/birds.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String sAmount = request.getParameter("amount");
            int amount = Integer.parseInt(sAmount);
            List<Bird> birdList = new ArrayList<Bird>();
            BirdDAO birdDao = new BirdDAO();
            birdList = birdDao.getNext9Birds(amount);
            
            List<Image> imageBirdList = new ArrayList<Image>();
            ImageDAO imageDao = new ImageDAO();
            imageBirdList = imageDao.getBirdImages();
            request.setAttribute("BIRDLIST", birdList);
            request.setAttribute("IMAGEBIRDLIST", imageBirdList);
            url = SUCCESS;
        } catch (SQLException e) {
            log("Error at RenderHomeController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
