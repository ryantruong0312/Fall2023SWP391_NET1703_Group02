/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package swp391.birdfarmshop.controller;

import java.sql.SQLException;
import swp391.birdfarmshop.dao.BirdDAO;
import swp391.birdfarmshop.dto.BirdDTO;
import swp391.birdfarmshop.dto.CartBirdDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class AddtoCartController extends HttpServlet {

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

        try {
            String bird_id = request.getParameter("bird_id");
            BirdDAO dao = new BirdDAO();
            BirdDTO dto = dao.getBirdDetailsById(bird_id);
            boolean isSoldOut = dao.isBirdSoldOut(bird_id);
            HttpSession session = request.getSession();
            if (isSoldOut) {
                session.setAttribute("ERROR", "Chim \"" + dto.getBird_name() + "\" không có sẵn");
            } else {
                CartBirdDTO cart_bird = (CartBirdDTO) session.getAttribute("CART_BIRD");
                if (cart_bird == null) {
                    cart_bird = new CartBirdDTO(null);
                }
                cart_bird.add(dto);
                session.setAttribute("CART_BIRD", cart_bird);
                session.setAttribute("SUCCESS", "Đã thêm \"" + dto.getBird_name() + "\" vào giở hàng thành công!!");

            }

        } catch (Exception e) {
            log("Error at AddtoCartController: " + e.toString());
        } finally {
            response.sendRedirect("MainController?action=NavToBird&amount=0");

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
