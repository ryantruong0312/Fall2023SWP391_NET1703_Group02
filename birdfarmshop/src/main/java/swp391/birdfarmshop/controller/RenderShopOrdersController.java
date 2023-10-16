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
import java.net.URLDecoder;
import java.util.ArrayList;
import swp391.birdfarmshop.dao.OrderDAO;
import swp391.birdfarmshop.model.Order;
import swp391.birdfarmshop.model.User;

/**
 *
 * @author tlminh
 */
@WebServlet(name = "RenderShopOrdersController", urlPatterns = {"/RenderShopOrdersController"})
public class RenderShopOrdersController extends HttpServlet {

    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "management/shop-orders.jsp";
    private static final String HOME = "MainController?action=NavToHome";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String page = "1";
        String[] pageArray = request.getParameterValues("page");
        
        String date = null;
        String[] dateArray = request.getParameterValues("date");
        
        String startDay = null;
        String[] startDayArray = request.getParameterValues("startDay");
        
        String endDay = null;
        String[] endDayArray = request.getParameterValues("endDay");
        
        String status = null;
        String[] statusArray = request.getParameterValues("status");
        
        String search = null;
        String[] searchArray = request.getParameterValues("search");
        if (dateArray != null) {
            date = dateArray[dateArray.length - 1];
        }
        if (startDayArray != null) {
            startDay = startDayArray[startDayArray.length - 1];
        }
        if (endDayArray != null) {
            endDay = endDayArray[endDayArray.length - 1];
        }
        if (statusArray != null) {
            status = statusArray[statusArray.length - 1];
        }
        if (searchArray != null) {
            search = searchArray[searchArray.length - 1];
        }
        if (pageArray != null) {
            page = pageArray[pageArray.length - 1];
        }
        if(startDay != null && endDay != null && !startDay.isEmpty() && !endDay.isEmpty()) {
            String[] startDayElement = startDay.split("-");
            String[] endDayElement = endDay.split("-");
            int day1 = Integer.parseInt(startDayElement[2]);
            int day2 = Integer.parseInt(endDayElement[2]);
            int month1 = Integer.parseInt(startDayElement[1]);
            int month2 = Integer.parseInt(endDayElement[1]);
            int year1 = Integer.parseInt(startDayElement[0]);
            int year2 = Integer.parseInt(endDayElement[0]);
            if(day1 > day2 || month1 > month2 || year1 > year2) {
                request.setAttribute("MESSAGE", "Khoảng thời gian nhập vào không hợp lệ");
                request.getRequestDispatcher(SUCCESS).forward(request, response);
            }
        }
        System.out.println(date+" "+startDay+" "+endDay+" "+status+" "+search+" "+page);
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            if (user != null && user.getRole().equals("manager")) {
                OrderDAO orderDao = new OrderDAO();
                int recordsPerPage = 2;
                int numberOfOrder = orderDao.numberOfOrder(date, startDay, endDay, status, search);
                int noOfPages = (int) Math.ceil(numberOfOrder * 1.0 / recordsPerPage);
                ArrayList<Order> orderList = orderDao.getAllOfOrder(date, startDay, endDay, status, search, page, recordsPerPage);
                ArrayList<String> statuses = orderDao.getOrderStatus();
                request.setAttribute("statuses", statuses);
                request.setAttribute("ORDERLIST", orderList);
                request.setAttribute("date", date);
                request.setAttribute("startDay", startDay);
                request.setAttribute("endDay", endDay);
                request.setAttribute("search", search);
                request.setAttribute("status", status);
                request.setAttribute("page", page);
                request.setAttribute("noOfPages", noOfPages);
                url = SUCCESS;
                request.getRequestDispatcher(url).forward(request, response);

            } else {
                response.sendRedirect(HOME);
            }
        } catch (Exception e) {
            log("Error at RenderShopOrdersController: " + e.toString());
        } finally {
//            request.getRequestDispatcher(url).forward(request, response);
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
