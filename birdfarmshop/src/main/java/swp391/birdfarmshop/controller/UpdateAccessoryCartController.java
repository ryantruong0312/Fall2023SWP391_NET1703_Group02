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
import swp391.birdfarmshop.dao.AccessoryDAO;
import swp391.birdfarmshop.dto.CartDTO;
import swp391.birdfarmshop.model.Accessory;

/**
 *
 * @author Admin
 */
@WebServlet(name="UpdateAccessoryCartController", urlPatterns={"/UpdateAccessoryCartController"})
public class UpdateAccessoryCartController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String accessory_id = request.getParameter("accessory_id");
            String type = request.getParameter("type");
            AccessoryDAO adao = new AccessoryDAO();
            Accessory accessory = adao.getAccessoryByID(accessory_id);
            HttpSession session = request.getSession();
            if (type != null && type.equals("up")) {
                if (session != null) {
                    CartDTO cart = (CartDTO) session.getAttribute("CART");
                    if (cart == null) {
                        cart = new CartDTO();
                    }
                    boolean checkAdd = cart.addAccessoryToCart(accessory, 1);
                    if (checkAdd) {
                        out.println(cart.getCartTotalPrice());
                        session.setAttribute("CART", cart);
                    }else{
                        out.println(0);
                    }
                    return;
                }
            } else {
               if (session != null) {
                    CartDTO cart = (CartDTO) session.getAttribute("CART");
                    if (cart == null) {
                        cart = new CartDTO();
                    }
                    boolean checkAdd = cart.updateQuatityAccessory(accessory, 1);
                    if (checkAdd) {
                        out.println(cart.getCartTotalPrice());
                        session.setAttribute("CART", cart);
                    }
                    return;
                }
            }
        }catch (Exception e){
            e.printStackTrace();
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