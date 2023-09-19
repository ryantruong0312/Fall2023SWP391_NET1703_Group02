/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package swp391.birdfarmshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import swp391.birdfarmshop.dao.UserDAO;
import swp391.birdfarmshop.model.User;

/**
 *
 * @author tlminh
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

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
            String username = request.getParameter("account");
            String password = request.getParameter("password");
            String save = request.getParameter("checkbox");
            User u = UserDAO.getUser(username, password);
            String message = null;
            String url = ERROR;
            HttpSession session = request.getSession(true);
            if (u != null) {
                if(u.getStatus().equals("active")) {
                      if(session != null){
                          u.setPassword(null);
                          session.setAttribute("LOGIN_USER", u);
                          if(save != null){
                              Cookie cookie = new Cookie("token", u.getEmail());
                              cookie.setMaxAge(5*60);
                              response.addCookie(cookie);
                          }
                          response.sendRedirect(DEST_NAV_HOME);
                      } 
                } else if (u.getStatus().equals("not active")){
                    request.setAttribute("error", "Please activate your account by clicking on the link in the registered email.");
                    url = DEST_NAV_LOGIN;
                } else {
                    request.setAttribute("error", "Your account has been locked, please contact the store.");
                    url = DEST_NAV_LOGIN;
                }
            } else {
                message = "Email or password incorrect.";
                request.setAttribute("error", message);
                url = DEST_NAV_LOGIN;
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
