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
import java.util.ArrayList;
import swp391.birdfarmshop.dao.BirdDAO;
import swp391.birdfarmshop.dao.OrderItemDAO;
import swp391.birdfarmshop.dto.OrderItemDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddNewOrderItemBirdPairController", urlPatterns = {"/AddNewOrderItemBirdPairController"})
public class AddNewOrderItemBirdPairController extends HttpServlet {

    private static final String DEST_NAV_HOME = "RenderHomeController";
    private static final String DEST_BIRD_PAIR_CUSTOMER = "RenderBirdPairCustomerController";

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
        String url = DEST_NAV_HOME;
        try {
            String male_bird_id = request.getParameter("male_bird");
            String female_bird_id = request.getParameter("female_bird");
            String accessory_id = request.getParameter("accessory_id");
            String order_id = request.getParameter("order_id");
            String pair_idPara = request.getParameter("pair_id");
            int pair_id = 0;
            if(pair_idPara != null){
                pair_id = Integer.parseInt(pair_idPara);
            }
            String price = request.getParameter("total_price");
            int totalPrice = 0;
            if (price != null) {
                totalPrice = Integer.parseInt(price);
            }
            OrderItemDAO oid = new OrderItemDAO();
            HttpSession session = request.getSession();
            ArrayList<OrderItemDTO> orderItemList = new ArrayList<>();
            if (male_bird_id != null && female_bird_id != null) {
                int result = oid.addNewPairOrderItem(order_id, male_bird_id, female_bird_id, accessory_id, totalPrice,pair_id);
                if (result > 0) {
                    session.setAttribute("SUCCESS", "Thanh toán thành công");

                } else {
                    session.setAttribute("ERROR", oid.error);
                    url = DEST_BIRD_PAIR_CUSTOMER;
                }
            } else if (male_bird_id != null) {
                int result1 = oid.addNewPairOrderItem(order_id, male_bird_id, female_bird_id, accessory_id, totalPrice,pair_id);
                if (result1 > 0) {
                    session.setAttribute("SUCCESS", "Thanh toán thành công");
                } else {
                    session.setAttribute("ERROR", oid.error);
                    url = DEST_BIRD_PAIR_CUSTOMER;
                }
            } else if (female_bird_id != null) {
                int result1 = oid.addNewPairOrderItem(order_id, male_bird_id, female_bird_id, accessory_id, totalPrice,pair_id);
                if (result1 > 0) {
                    session.setAttribute("SUCCESS", "Thanh toán thành công");
                    url = DEST_BIRD_PAIR_CUSTOMER;
                } else {
                    session.setAttribute("ERROR", "Thanh toán thất bại");
                    url = DEST_BIRD_PAIR_CUSTOMER;
                }
            } else {
                int result1 = oid.addNewPairOrderItem(order_id, male_bird_id, female_bird_id, accessory_id, totalPrice,pair_id);
                if (result1 > 0) {
                    session.setAttribute("SUCCESS", "Thanh toán thành công");
                    url = DEST_BIRD_PAIR_CUSTOMER;
                } else {
                    session.setAttribute("ERROR", "Thanh toán thất bại");
                    url = DEST_BIRD_PAIR_CUSTOMER;
                }
            }
            request.setAttribute("ITEMLIST", orderItemList);
        } catch (Exception e) {
            e.printStackTrace();
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
