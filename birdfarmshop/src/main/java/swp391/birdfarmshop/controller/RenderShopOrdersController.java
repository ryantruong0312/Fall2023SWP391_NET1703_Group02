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
import java.util.Arrays;
import swp391.birdfarmshop.dao.OrderDAO;
import swp391.birdfarmshop.model.Order;
import swp391.birdfarmshop.model.User;

/**
 *
 * @author tlminh
 */
@WebServlet(name="RenderShopOrdersController", urlPatterns={"/RenderShopOrdersController"})
public class RenderShopOrdersController extends HttpServlet {
   
    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "management/shop-orders.jsp";
    private static final String HOME = "MainController?action=NavToHome";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String page = "1";
        page = request.getParameter("page");
        String date = null; 
        String[] dateArray = request.getParameterValues("date");
        System.out.println(dateArray);
        if(dateArray != null) {
            date = dateArray[dateArray.length - 1];
        }
        String startDay = request.getParameter("startDay");
        String endDay = request.getParameter("endDay");
        String status = null; 
        String[] statusArray = request.getParameterValues("status");
        System.out.println(Arrays.toString(statusArray));
        if(statusArray != null) {
            status = statusArray[statusArray.length - 1];
        }
        String param = request.getParameter("param");
        String search = null;
        String[] searchArray = request.getParameterValues("search");
        System.out.println(searchArray);
        if(searchArray != null) {
            search = searchArray[searchArray.length - 1];
        }
        if(param != null) {
            param = URLDecoder.decode(param, "UTF-8");
            String[] parts = param.split("&");
            if(param.contains("date")) {
                for (String part : parts) {
                    if (part.startsWith("date=")) {
                        String[] keyValue = part.split("=");
                        date = keyValue[keyValue.length-1];
                        break;
                    }
                }
            }
            if(param.contains("status")) {
                for (String part : parts) {
                    if (part.startsWith("status=")) {
                        String[] keyValue = part.split("=");
                        status = keyValue[keyValue.length-1];
                        break;
                    }
                }
            }
            if(param.contains("startDay")) {
                for (String part : parts) {
                    if (part.startsWith("startDay=")) {
                        String[] keyValue = part.split("=");
                        startDay = keyValue[keyValue.length-1];
                        break;
                    }
                }
            }
            if(param.contains("endDay")) {
                for (String part : parts) {
                    if (part.startsWith("endDay=")) {
                        String[] keyValue = part.split("=");
                        endDay = keyValue[keyValue.length-1];
                        break;
                    }
                }
            }
            if(param.contains("page")) {
                for (String part : parts) {
                    if (part.startsWith("page=")) {
                        String[] keyValue = part.split("=");
                        page = keyValue[keyValue.length-1];
                        break;
                    }
                }
            }
        }
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            if(user != null && user.getRole().equals("manager")) {
                OrderDAO orderDao = new OrderDAO();
                int recordsPerPage = 20;
                ArrayList<Order> orderList = orderDao.getAllOfOrder(date, startDay, endDay, status, search, page, recordsPerPage);
                request.setAttribute("ORDERLIST", orderList);
                request.setAttribute("date", date);
                request.setAttribute("startDay", startDay);
                request.setAttribute("endDay", endDay);
                request.setAttribute("search", search);
                request.setAttribute("status", status);
                request.setAttribute("page", page);
                url = SUCCESS;
            } else {
                response.sendRedirect(HOME);
            }
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
