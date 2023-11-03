/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package swp391.birdfarmshop.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import swp391.birdfarmshop.dao.FeedbackDAO;
import swp391.birdfarmshop.model.Feedback;
import swp391.birdfarmshop.model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "CreateFeedbackController", urlPatterns = {"/CreateFeedbackController"})
public class CreateFeedbackController extends HttpServlet {

    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "MainController?action=NavToCustomerOrder";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String rating_txt = request.getParameter("star");
            int rating = Integer.parseInt(rating_txt);
            String comment = request.getParameter("feedback");
            String order_item_id_txt = request.getParameter("order_item_id");
            int order_item_id = Integer.parseInt(order_item_id_txt);
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            Feedback feedback = new Feedback(null, user.getUsername(), order_item_id, rating, comment, null);
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            boolean fb = feedbackDAO.addFeedback(feedback);
            if (fb) {
                session.setAttribute("SUCCESS", "Đã thêm đánh giá thành công");
                url = SUCCESS;
            }

        } catch (Exception e) {
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
