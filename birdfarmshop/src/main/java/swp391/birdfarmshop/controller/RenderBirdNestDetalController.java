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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import swp391.birdfarmshop.dao.AccessoryDAO;
import swp391.birdfarmshop.dao.BirdNestDAO;
import swp391.birdfarmshop.dao.FeedbackDAO;
import swp391.birdfarmshop.dto.AccessoryDTO;
import swp391.birdfarmshop.dto.BirdNestDTO;
import swp391.birdfarmshop.dto.FeedbackDTO;
import swp391.birdfarmshop.dto.StarDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "RenderBirdNestDetalController", urlPatterns = {"/RenderBirdNestDetalController"})
public class RenderBirdNestDetalController extends HttpServlet {

    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "shop/birdnest-details.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String nest_id_txt = request.getParameter("id");
            System.out.println("abc" + nest_id_txt);
            if (nest_id_txt != null) {
                System.out.println("1");

                int nest_id = Integer.parseInt(nest_id_txt);
                BirdNestDAO birdNestDAO = new BirdNestDAO();
                BirdNestDTO birdNestDTO = birdNestDAO.getBirdNestByID(nest_id);
                System.out.println("0");
//                FeedbackDAO f = new FeedbackDAO();
//                ArrayList<FeedbackDTO> feedbackList = f.getFeedbackByIdProduct(accessory_id);
//                request.setAttribute("feedbackList", feedbackList);
//                StarDTO starCustomer = f.getRatingByIdProduct(accessory_id);
//                request.setAttribute("starCustomer", starCustomer);
                if (birdNestDTO != null) {
                    System.out.println("3");
                    request.setAttribute("birdNest", birdNestDTO);
                    url = SUCCESS;
                }

            }

        } catch (Exception e) {
            log("Error at RenderAccessoryDetailsController: " + e.toString());
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
