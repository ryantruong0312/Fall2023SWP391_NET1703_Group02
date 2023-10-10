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
import jakarta.servlet.http.HttpSession;
import swp391.birdfarmshop.dao.UserDAO;
import swp391.birdfarmshop.model.User;
import swp391.birdfarmshop.util.JWTUtils;

/**
 *
 * @author tlminh
 */
@WebServlet(name = "CreateAccountController", urlPatterns = {"/CreateAccountController"})
public class CreateAccountController extends HttpServlet {

    private static final String ERROR = "/WEB-INF/errorpages/error.jsp";
    private static final String SUCCESS = "RenderAccountsController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String full_name = request.getParameter("fullname");
            String username = request.getParameter("username");
            String role = request.getParameter("role");
            UserDAO userDao = new UserDAO();
            String token = "Thegioivetcanh123@";
            String password = JWTUtils.encodeJWT(token);
            User u = userDao.getUserByUsername(username);
            if (u == null) {
                int result = userDao.createUser(username, "", password, full_name, "", role, "form", "inactive");
                if (result == 0) {
                    session.setAttribute("ERROR", "Tạo tài khoản thất bại");
                } else {
                    session.setAttribute("SUCCESS", "Tạo tài khoản thành công");
                }
            } else {
                session.setAttribute("ERROR", "Tài khoản này đã sử dụng");
            }
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
