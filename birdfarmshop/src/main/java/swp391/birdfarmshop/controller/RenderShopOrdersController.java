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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import swp391.birdfarmshop.dao.OrderDAO;
import swp391.birdfarmshop.dao.OrderItemDAO;
import swp391.birdfarmshop.model.Order;
import swp391.birdfarmshop.model.OrderItem;

/**
 *
 * @author tlminh
 */
@WebServlet(name="RenderShopOrdersController", urlPatterns={"/RenderShopOrdersController"})
public class RenderShopOrdersController extends HttpServlet {
   
    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "management/shop-orders.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            OrderDAO orderDao = new OrderDAO();
            ArrayList<Order> orderList = orderDao.getAllOfOrder();
            for (Order order : orderList) {
                System.out.println(order.getOrder_id());
            }
            OrderItemDAO orderItemDao = new OrderItemDAO();
            ArrayList<OrderItem> orderItemList;
            HashMap<String, ArrayList> orderItemMap = new HashMap<>();
            for (Order order : orderList) {
                orderItemList = orderItemDao.getItemOfOrder(order.getOrder_id());
                orderItemMap.put(order.getOrder_id(), orderItemList);
            }
            request.setAttribute("ORDERLIST", orderList);
            request.setAttribute("ORDERITEMMAP", orderItemMap);
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at RenderShopOrdersController: " + e.toString());
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
