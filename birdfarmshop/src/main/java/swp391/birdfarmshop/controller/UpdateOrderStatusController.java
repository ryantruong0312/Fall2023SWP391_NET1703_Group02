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
import java.text.ParseException;
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
    throws ServletException, IOException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        OrderDAO orderDao = new OrderDAO();
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            if (user != null && !user.getRole().equals("customer")) {
                url = SUCCESS;
                String page = "1";
                if(request.getParameter("page") != null) {
                    page = request.getParameter("page");
                }
                String date = request.getParameter("date");
                String startDay = request.getParameter("startDay");
                String endDay = request.getParameter("endDay");
                String search = request.getParameter("search");
                String filterStatus = request.getParameter("filterStatus");
                String[] statusArray = request.getParameterValues("status");
                String statusUpdate = statusArray[statusArray.length - 1];
                String order_id = request.getParameter("order_id");
                
                boolean isUpdated = orderDao.updateOrderStatus(order_id, statusUpdate);
                if(isUpdated) {
                    session.setAttribute("SUCCESS", "Cập nhật thành công");
                }else {
                    session.setAttribute("ERROR", "Cập nhật thất bại");
                }
                
                int recordsPerPage = 10;
                int numberOfOrder = orderDao.numberOfOrder(date, startDay, endDay, filterStatus, search);
                int noOfPages = (int) Math.ceil(numberOfOrder * 1.0 / recordsPerPage);
                ArrayList<Order>  orderList = orderDao.getAllOfOrder(date, startDay, endDay, filterStatus, search, page, recordsPerPage);
                request.setAttribute("ORDERLIST", orderList);
                request.setAttribute("date", date);
                request.setAttribute("startDay", startDay);
                request.setAttribute("endDay", endDay);
                request.setAttribute("search", search);
                request.setAttribute("filterStatus", filterStatus);
                request.setAttribute("page", page);
                request.setAttribute("noOfPages", noOfPages);
            } else if(user != null && user.getRole().equals("customer")){
                String txtOrderId = request.getParameter("order_id");
                boolean isUpdated = orderDao.updateOrderStatus(txtOrderId, "cancel");
                url = "MainController?action=NavToCustomerOrder";
                if(isUpdated) {
                    session.setAttribute("SUCCESS", "Bạn đã hủy đơn hàng thành công");
                } else {
                    session.setAttribute("ERROR", "Bạn hủy đơn hàng thất bại. Liên hệ nhân viên để biết thêm thông tin.");
                }
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
        } catch (ParseException ex) {
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
        } catch (ParseException ex) {
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
