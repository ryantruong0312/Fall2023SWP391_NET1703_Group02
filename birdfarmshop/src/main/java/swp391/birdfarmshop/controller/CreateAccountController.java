/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package swp391.birdfarmshop.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import swp391.birdfarmshop.dao.UserDAO;
import swp391.birdfarmshop.util.JWTUtils;

/**
 *
 * @author tlminh
 */
@WebServlet(name="CreateAccountController", urlPatterns={"/CreateAccountController"})
public class CreateAccountController extends HttpServlet {
   
   private static final String ERROR = "/WEB-INF/errorpages/error.jsp";
    private static final String SUCCESS = "RenderAccountsController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            String full_name = request.getParameter("fullname");
            String username = request.getParameter("username");
            String role = request.getParameter("role");
            UserDAO userDao = new UserDAO();
            String token = JWTUtils.randomPasswordToken();
            String password = JWTUtils.encodeJWT(token);
            userDao.createUser(username, "", password, full_name, "", role, "", "inactive");
            url = SUCCESS;
        } catch (Exception ex) {
            log("Error at CreateAccountController: " + ex.toString());
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
