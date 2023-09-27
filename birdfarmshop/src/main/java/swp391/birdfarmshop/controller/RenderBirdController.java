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
import java.util.logging.Level;
import java.util.logging.Logger;
import swp391.birdfarmshop.dao.BirdDAO;
import swp391.birdfarmshop.model.Bird;

/**
 *
 * @author phong pc
 */
public class RenderBirdController extends HttpServlet {
   
    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "shop/birds.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
//            String sAmount = request.getParameter("amount");
//            int amount = Integer.parseInt(sAmount);
//            List<Bird> birdList = new ArrayList<Bird>();
//            BirdDAO birdDao = new BirdDAO();
//            birdList = birdDao.getNext9Birds(amount);
            int page = 1;
            int recordsPerPage = 9;

            if(request.getParameter("page") != null)
                page = Integer.parseInt(request.getParameter("page"));
            BirdDAO birdDao = new BirdDAO();
            // Gọi phương thức truy vấn cơ sở dữ liệu để lấy dữ liệu dựa trên trang và số bản ghi trên trang
            List<Bird> birds = birdDao.getDataFromDatabase(page, recordsPerPage);

            int noOfRecords = birdDao.totalBirds(); // Lấy tổng số bản ghi

            int noOfPages = (int) Math.round(noOfRecords * 1.0 / recordsPerPage);
            request.setAttribute("BIRDLIST", birds);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RenderBirdController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RenderBirdController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
