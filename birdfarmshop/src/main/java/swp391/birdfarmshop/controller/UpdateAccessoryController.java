/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package swp391.birdfarmshop.controller;

import java.io.IOException;
//import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//import swp391.birdfarmshop.dao.AccessoryCategoryDAO;
import swp391.birdfarmshop.dao.AccessoryDAO;
import swp391.birdfarmshop.dao.ImageDAO;
import swp391.birdfarmshop.dto.AccessoryDTO;
//import swp391.birdfarmshop.model.AccessoryCategory;
//import swp391.birdfarmshop.model.Image;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateAccessoryController", urlPatterns = {"/UpdateAccessoryController"})
public class UpdateAccessoryController extends HttpServlet {

    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "shop/accessory-details.jsp";

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
            String txtImage = request.getParameter("txtImage");
            String txtNewQuantity = request.getParameter("txtNewQuantity");

            String txtImage_1 = request.getParameter("txtImage_1");
            String txtImage_2 = request.getParameter("txtImage_2");
            String Image_id_1 = request.getParameter("Image_id_1");
            String Image_id_2 = request.getParameter("Image_id_2");
            AccessoryDAO d = new AccessoryDAO();
            ImageDAO i = new ImageDAO();
            if (txtNewQuantity == null) {
                boolean rs = d.updateAccessory(txtAccessoryID, txtAccessoryName, txtCategoryID, txtPrice, txtStockQuantity, txtDescribe, txtDiscount);
                request.setAttribute("im", txtImage);
                boolean checkImage = i.updateThumbnailImageAccessory(txtAccessoryID, true, txtImage);
                boolean checkImage_1 = i.updateImageAccessory(txtAccessoryID, false, txtImage_1, Image_id_1);
                if (Image_id_2 != null) {
                    boolean checkImage_2 = i.updateImageAccessory(txtAccessoryID, false, txtImage_2, Image_id_2);
                }
                AccessoryDAO a = new AccessoryDAO();
                AccessoryDTO ac = a.getAccessoryDetailsByID(txtAccessoryID);
                if (ac.getStatus().equalsIgnoreCase("hết hàng")) {
                    String message = "Hết hàng";
                    request.setAttribute("MESSAGE", message);
                }
                request.setAttribute("a", ac);

                url = SUCCESS;
            } else {
                boolean rs = d.updateAccessoryQuantity(txtAccessoryID, txtNewQuantity);
                String im = i.getThumbnailUrlByAccessoryId(txtAccessoryID);
                request.setAttribute("im", im);
                AccessoryDAO a = new AccessoryDAO();
                AccessoryDTO ac = a.getAccessoryDetailsByID(txtAccessoryID);
                if (ac.getStatus().equalsIgnoreCase("hết hàng")) {
                    String message = "Hết hàng";
                    request.setAttribute("MESSAGE", message);
                }
                request.setAttribute("a", ac);

                url = SUCCESS;
            }

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
