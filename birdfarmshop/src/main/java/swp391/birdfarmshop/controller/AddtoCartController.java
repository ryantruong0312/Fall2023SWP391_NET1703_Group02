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
import swp391.birdfarmshop.dao.BirdNestDAO;
import swp391.birdfarmshop.dto.BirdNestDTO;
import swp391.birdfarmshop.dto.CartBirdNestDTO;

/**
 *
 * @author ASUS
 */
public class AddtoCartController extends HttpServlet {

    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS_BIRD = "MainController?action=NavToBird&amount=0";
    private static final String SUCCESS_NEST = "MainController?action=NavToBirdNests";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String id = request.getParameter("id");
            String type = request.getParameter("type");
            HttpSession session = request.getSession();

            if (id != null && type != null) {
                if ("bird".equals(type)) {
                    BirdDAO dao = new BirdDAO();
                    BirdDTO dto = dao.getBirdDetailsById(id);
                    boolean isSoldOut = dao.isBirdSoldOut(id);
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
                        url = SUCCESS_BIRD;
                    }
                } else if ("nest".equals(type)) {
                    System.out.println("12");
                    BirdNestDAO dao = new BirdNestDAO();
                    BirdNestDTO dto = dao.getBirdNestDetailsById(Integer.parseInt(id));
                    System.out.println(dto.getNest_id());
                    CartBirdNestDTO cart_bird_nest = (CartBirdNestDTO) session.getAttribute("CART_BIRD_NEST");
                    System.out.println("6");
                    if (cart_bird_nest == null) {

                        cart_bird_nest = new CartBirdNestDTO(null);
                    }
                    System.out.println("3");
                    cart_bird_nest.add(dto);
                    session.setAttribute("CART_BIRD_NEST", cart_bird_nest);
                    session.setAttribute("SUCCESS", "Đã thêm sản phẩm\"" + dto.getNest_name() + "\" vào giở hàng thành công!!");
                    System.out.println("5");
                    url = SUCCESS_NEST;
                }
            }

        } catch (Exception e) {
            log("Error at AddtoCartController: " + e.toString());
        } finally {
            response.sendRedirect(url);

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
