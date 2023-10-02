/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package swp391.birdfarmshop.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import swp391.birdfarmshop.dao.BirdDAO;
import swp391.birdfarmshop.model.Bird;

/**
 *
 * @author phong pc
 */
public class SearchBirdController extends HttpServlet {
   
    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "shop/birds.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int page = 1;
            int recordsPerPage = 9;
            String txtBirdName = request.getParameter("txtBirdName");
            if(request.getParameter("page") != null)
                page = Integer.parseInt(request.getParameter("page"));
            BirdDAO birdDao = new BirdDAO();
            List<Bird> searchList = birdDao.searchBird(txtBirdName, page, recordsPerPage);
            if(! searchList.isEmpty()){
                int noOfRecords = birdDao.numberOfBirdListSearch(txtBirdName);
                int noOfPages = (int) Math.round(noOfRecords * 1.0 / recordsPerPage);
                request.setAttribute("noOfPages", noOfPages);   
                request.setAttribute("txtBirdName", txtBirdName);
                request.setAttribute("currentPage", page);
                Cookie cookie = new Cookie("searchedValue", txtBirdName);
                cookie.setMaxAge(24*60*60);
                response.addCookie(cookie);
            } else {
                request.setAttribute("SearchingNotMatch", "Không tìm thấy kết quả");
            }
            request.setAttribute("SEARCHLIST", searchList);
            url = SUCCESS;
        } catch (NumberFormatException | SQLException e) {
            log("Error at SearchBirdController: " + e.toString());
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
