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
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            OrderDAO orderDao = new OrderDAO();
            ArrayList<Order> orderList;
            int recordsPerPage = 20;
            int numberOfOrder;
            int noOfPages;
            if (user != null && !user.getRole().equals("customer")) {
                String page = "1";
//                String[] pageArray = request.getParameterValues("page");
//                if (pageArray != null) {
//                    page = pageArray[pageArray.length - 1];
//                }
//                String date = null;
//                String[] dateArray = request.getParameterValues("date");
//                if (dateArray != null) {
//                    date = dateArray[dateArray.length - 1];
//                }
//                String status = null;
//                String[] statusArray = request.getParameterValues("status");
//                if (statusArray != null) {
//                    status = statusArray[statusArray.length - 1];
//                }
//                String search = null;
//                String[] searchArray = request.getParameterValues("search");
//                if (searchArray != null) {
//                    search = searchArray[searchArray.length - 1];
//                }
//                String startDay = null;
//                String[] startDayArray = request.getParameterValues("startDay");
//                if (startDayArray != null) {
//                    startDay = startDayArray[startDayArray.length - 1];
//                }
//                String endDay = null;
//                String[] endDayArray = request.getParameterValues("endDay");
//                if (endDayArray != null) {
//                    endDay = endDayArray[endDayArray.length - 1];
//                }
                if(request.getParameter("page") != null) {
                    page = request.getParameter("page");
                }
                String date = request.getParameter("date");
                String startDay = request.getParameter("startDay");
                String endDay = request.getParameter("endDay");
                String search = request.getParameter("search");
                String status = request.getParameter("status");
                System.out.println(date + " " + startDay + " " + endDay + " " + status + " " + search + " " + page);
                if (startDay != null && endDay != null && !startDay.isEmpty() && !endDay.isEmpty()) {
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    Date from = dateFormat.parse(startDay);
                    Date to = dateFormat.parse(endDay);
                    if(from.after(to)) {
                        orderList = orderDao.getAllOfOrder(date, null, null, status, search, page, recordsPerPage);
                        numberOfOrder = orderDao.numberOfOrder(date, null, null, status, search);
                        noOfPages = (int) Math.ceil(numberOfOrder * 1.0 / recordsPerPage);
                        request.setAttribute("ORDERLIST", orderList);
                        request.setAttribute("date", date);
                        request.setAttribute("startDay", null);
                        request.setAttribute("endDay", null);
                        request.setAttribute("search", search);
                        request.setAttribute("status", status);
                        request.setAttribute("page", page);
                        request.setAttribute("noOfPages", noOfPages);
                        session.setAttribute("ERROR", "Khoảng thời gian không hợp lệ");
                        request.getRequestDispatcher(SUCCESS).forward(request, response);
                        return;
                    }
                }
                numberOfOrder = orderDao.numberOfOrder(date, startDay, endDay, status, search);
                noOfPages = (int) Math.ceil(numberOfOrder * 1.0 / recordsPerPage);
                orderList = orderDao.getAllOfOrder(date, startDay, endDay, status, search, page, recordsPerPage);
//                ArrayList<String> statuses = orderDao.getOrderStatus();
//                request.setAttribute("statuses", statuses);
                request.setAttribute("ORDERLIST", orderList);
                request.setAttribute("date", date);
                request.setAttribute("startDay", startDay);
                request.setAttribute("endDay", endDay);
                request.setAttribute("search", search);
                request.setAttribute("status", status);
                request.setAttribute("page", page);
                request.setAttribute("noOfPages", noOfPages);
                url = SUCCESS;
            } else {
                response.sendRedirect(HOME);
            }
        } catch (ServletException | IOException | SQLException | ParseException e) {
            log("Error at RenderShopOrdersController: " + e.toString());
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
