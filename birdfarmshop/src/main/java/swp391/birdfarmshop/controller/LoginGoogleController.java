/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package swp391.birdfarmshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import swp391.birdfarmshop.dao.UserDAO;
import swp391.birdfarmshop.model.GooglePojo;
import swp391.birdfarmshop.model.User;
import swp391.birdfarmshop.util.GoogleUtils;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginGoogleController", urlPatterns = {"/LoginGoogleController"})
public class LoginGoogleController extends HttpServlet {

    private static final String DEST_NAV_LOGIN = "/authentication/login.jsp";
    private static final String DEST_NAV_HOME = "RenderHomeController";
    private static final String ERROR = "/WEB-INF/errorpages/error.jsp";

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
        try ( PrintWriter out = response.getWriter()) {
            String code = request.getParameter("code");
            String message = null;
            String url = ERROR;
            if (code == null || code.isEmpty()) {
                message = "Can't connect to Google, you should try another way";
            } else {
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo account = GoogleUtils.getUserInfo(accessToken);
                User u = UserDAO.findUser(account.getId(), account.getEmail());
                if (u != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("LOGIN_USER", u);
                    response.sendRedirect(DEST_NAV_HOME);
                } else {
                    int createUser = UserDAO.createUser(account.getId(), account.getEmail(), "", account.getName(), "","active");
                    if (createUser == 0) {
                        message = "Create account by Google fail!";
                        url = DEST_NAV_LOGIN;
                    }else{
                        HttpSession session = request.getSession(true);
                        User newUser = UserDAO.findUser(account.getId(), account.getEmail());
                        session.setAttribute("LOGIN_USER", u);
                        response.sendRedirect(DEST_NAV_HOME);
                    }
                }
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
