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
import swp391.birdfarmshop.dao.AccessoryDAO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateAccessoryController", urlPatterns = {"/UpdateAccessoryController"})
public class UpdateAccessoryController extends HttpServlet {

    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "management/edit-accessory.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {

            String txtAccessoryID = request.getParameter("txtAccessoryID");
            String txtAccessoryName = request.getParameter("txtAccessoryName");
            String txtCategoryID = request.getParameter("txtCategoryID");
            String txtPrice = request.getParameter("txtPrice");
            String txtStockQuantity = request.getParameter("txtStockQuantity");
            String txtDescribe = request.getParameter("txtDescribe");
            String txtDiscount = request.getParameter("txtDiscount");
            String txtImage_1 = request.getParameter("txtImage_1");
            String txtImage_2 = request.getParameter("txtImage_2");
            String txtImage_3 = request.getParameter("txtImage_3");
            
            AccessoryDAO d = new AccessoryDAO();
            boolean rs = d.updateAccessory(txtAccessoryID, txtAccessoryName, txtCategoryID, txtPrice, txtStockQuantity, txtDescribe, txtDiscount);
            if(rs){
                String message = "Chỉnh sửa thành công";
                request.setAttribute("MESSAGE", message);
            }else{
                String error = "Chỉnh sửa thất bại";
                request.setAttribute("error", error);
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
