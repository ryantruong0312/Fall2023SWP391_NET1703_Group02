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
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import swp391.birdfarmshop.dao.OrderDAO;
import swp391.birdfarmshop.model.Order;
import swp391.birdfarmshop.model.User;

/**
 *
 * @author phong pc
 */
public class UpdateOrderStatusController extends HttpServlet {
   
    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "management/shop-orders.jsp";
    private static final String HOME = "MainController?action=NavToHome";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            if (user != null && !user.getRole().equals("customer")) {
                String[] statusArray = request.getParameterValues("status");
                String status = statusArray[statusArray.length - 1];
                if("Giao hàng thành công".equals(status)) {
                    status = "Đã giao hàng";
                }
                if("Giao hàng thất bại".equals(status)) {
                    status = "Đã hủy";
                }
                String order_id = request.getParameter("order_id");
                OrderDAO orderDao = new OrderDAO();
                boolean isUpdated = orderDao.updateOrderStatus(order_id, status);
                Order order = orderDao.getOrderById(order_id);
                ArrayList<Order> orderList = new ArrayList<>();
                orderList.add(order);
                if(isUpdated) {
                    request.setAttribute("MESSAGE", "Cập nhật thành công");
                    request.setAttribute("ORDERLIST", orderList);
                }else {
                    request.setAttribute("MESSAGE", "Cập nhật thất bại");
                }
                url = SUCCESS;
            } else {
                url = HOME;
            }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateOrderStatusController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateOrderStatusController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
