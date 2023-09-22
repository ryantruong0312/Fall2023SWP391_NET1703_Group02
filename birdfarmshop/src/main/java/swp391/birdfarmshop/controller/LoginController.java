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
import swp391.birdfarmshop.util.JWTUtils;

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
            String encodePassword = JWTUtils.encodeJWT(password);
            User u = UserDAO.findUser(username, username);
            String message = null;
            String url = ERROR;
            HttpSession session = request.getSession(true);
            if (u != null) {
                String decodePassword = JWTUtils.decodeJWT(u.getPassword());
                if (password.equals(decodePassword)) {
                    if (u.getStatus().equals("active")) {
                        if (session != null) {
                            session.setAttribute("LOGIN_USER", u);
                            if (save != null) {
                                String encodeEmail = JWTUtils.encodeJWT(u.getEmail());
                                Cookie cookie = new Cookie("token", encodeEmail);
                                cookie.setMaxAge(24 * 60 * 60);
                                response.addCookie(cookie);
                            }
                            response.sendRedirect(DEST_NAV_HOME);
                        }
                    } else if (u.getStatus().equals("inactive")) {
                        request.setAttribute("error", "Vui lòng kích hoạt tài khoản của bạn bằng cách nhấp vào liên kết trong email đã đăng ký.");
                        url = DEST_NAV_LOGIN;
                    } else {
                        request.setAttribute("error", "Tài khoản của bạn đã bị khóa, vui lòng liên hệ với cửa hàng.");
                        url = DEST_NAV_LOGIN;
                    }
                } else {
                    message = "Email hoặc mật khẩu không chính xác.";
                    request.setAttribute("error", message);
                    url = DEST_NAV_LOGIN;
                }
            } else {
                message = "Email hoặc mật khẩu không chính xác.";
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
