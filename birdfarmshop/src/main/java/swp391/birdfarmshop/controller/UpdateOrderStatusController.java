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
    private static final String SHOP_ORDER = "management/shop-orders.jsp";
    private static final String HOME = "MainController?action=NavToHome";
    private static final String CUSTOMER_ORDER = "MainController?action=NavToCustomerOrder";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        OrderDAO orderDao = new OrderDAO();
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            if (user != null && !user.getRole().equals("customer")) {
                url = SHOP_ORDER;
                String page = "1";
                if(request.getParameter("page") != null) {
                    page = request.getParameter("page");
                }
                String date = request.getParameter("date");
                String startDay = request.getParameter("startDay");
                String endDay = request.getParameter("endDay");
                String search = request.getParameter("search");
                String[] statusArr = request.getParameterValues("status");
                String statusUpdate = null;
                String status = null;
                if(statusArr != null) {
                    for (int i = 0; i < statusArr.length - 1; i++) {
                        if (statusArr[i].contains("Chờ xử lý") || statusArr[i].contains("Đang xử lý") || 
                            statusArr[i].contains("Đang giao hàng") || statusArr[i].contains("Đã giao hàng") ||
                            statusArr[i].contains("Đã đánh giá") || statusArr[i].contains("Đã hủy")) {
                                statusUpdate = statusArr[i];
                        }
                    }
                    for (int i = 0; i < statusArr.length - 1; i++) {
                        if (statusArr[i].contains("wait") || statusArr[i].contains("inProgress") || 
                            statusArr[i].contains("delivering") || statusArr[i].contains("delivered") ||
                            statusArr[i].contains("rated") || statusArr[i].contains("cancel")) {
                                status = statusArr[i];
                        }
                    }
                }
                String order_id = request.getParameter("order_id");
                boolean isUpdated = orderDao.updateOrderStatus(order_id, statusUpdate);
                if(isUpdated) {
                    session.setAttribute("SUCCESS", "Bạn đã cập nhật đơn hàng thành công");
                } else {
                    session.setAttribute("ERROR", "Bạn đã cập nhật đơn hàng thất bại.");
                }
                System.out.println("UPDATE PAGE: "+ date + " " + startDay + " " + endDay + " " + status + " " + search + " " + page);
                int numberOfOrder = orderDao.numberOfOrder(date, startDay, endDay, status, search);
                int recordsPerPage = 10;
                int noOfPages = (int) Math.ceil(numberOfOrder * 1.0 / recordsPerPage);
                ArrayList<Order> orderList = orderDao.getAllOfOrder(date, startDay, endDay, status, search, page, recordsPerPage);
                request.setAttribute("ORDERLIST", orderList);
                request.setAttribute("date", date);
                request.setAttribute("startDay", startDay);
                request.setAttribute("endDay", endDay);
                request.setAttribute("search", search);
                request.setAttribute("status", status);
                request.setAttribute("page", page);
                request.setAttribute("noOfPages", noOfPages);
            } else if(user != null && user.getRole().equals("customer")){
                url = CUSTOMER_ORDER;
                String txtOrderId = request.getParameter("order_id");
                boolean isUpdated = orderDao.updateOrderStatus(txtOrderId, "cancel");
                if(isUpdated) {
                    session.setAttribute("SUCCESS", "Bạn đã hủy đơn hàng thành công");
                } else {
                    session.setAttribute("ERROR", "Bạn đã hủy đơn hàng thất bại. Liên hệ nhân viên để biết thêm thông tin.");
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
