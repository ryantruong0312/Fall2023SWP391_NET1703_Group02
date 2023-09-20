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

/**
 *
 * @author tlminh
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "/WEB-INF/errorpages/error.jsp";
    private static final String ACT_NAV_HOME = "NavToHome";
    private static final String DEST_NAV_HOME = "RenderHomeController";
    private static final String ACT_NAV_LOGIN = "NavToLogin";
    private static final String DEST_NAV_LOGIN = "/authentication/login.jsp";
    private static final String ACT_NAV_REGISTER = "NavToRegister";
    private static final String DEST_NAV_REGISTER = "/authentication/register.jsp";
    private static final String ACT_NAV_BIRD_COMPARE_PAGE = "NavToCompare";
    private static final String DEST_NAV_BIRD_COMPARE_PAGE = "RenderBirdCompareController";
    
//  PAGE

    private static final String ACT_LOGIN = "login";
    private static final String DEST_LOGIN = "LoginController";

    private static final String ACT_REGISTER = "register";
    private static final String DEST_REGISTER = "RegisterController";
    private static final String ACT_LOGOUT = "Logout";
    private static final String DEST_LOGOUT = "LogoutController";
    private static final String ACT_NAV_ACCESSORY = "NavToAccessory";
    private static final String DEST_NAV_ACCESSORY = "RenderAccessoryController";
    private static final String ACT_NAV_ACCESSORY_DETAILS = "NavToAccessoryDetails";
    private static final String DEST_NAV_ACCESSORY_DETAILS = "RenderAccessoryDetailsController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            switch (action) {
                case ACT_NAV_HOME:
                    url = DEST_NAV_HOME;
                    break;
                case ACT_NAV_LOGIN:
                    url = DEST_NAV_LOGIN;
                    break;
                case ACT_NAV_REGISTER:
                    url = DEST_NAV_REGISTER;
                    break;
                case ACT_LOGIN:
                    url = DEST_LOGIN;
                    break;
                case ACT_REGISTER:
                    url = DEST_REGISTER;
                    break;
                case ACT_NAV_BIRD_COMPARE_PAGE:
                    url = DEST_NAV_BIRD_COMPARE_PAGE;
                    break;
                case ACT_LOGOUT:
                    url = DEST_LOGOUT;
                    break;
                case ACT_NAV_ACCESSORY:
                    url = DEST_NAV_ACCESSORY;
                    break;
                case ACT_NAV_ACCESSORY_DETAILS:
                    url = DEST_NAV_ACCESSORY_DETAILS;
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            log("Error at MainController: " + ex.toString());
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
