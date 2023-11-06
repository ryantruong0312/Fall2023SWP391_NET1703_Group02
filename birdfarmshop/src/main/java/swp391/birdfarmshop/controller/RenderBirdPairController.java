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
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import swp391.birdfarmshop.dao.BirdBreedDAO;
import swp391.birdfarmshop.dao.BirdCustomerDAO;
import swp391.birdfarmshop.dao.BirdDAO;
import swp391.birdfarmshop.model.BirdCustomer;
import swp391.birdfarmshop.dto.BirdDTO;
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.model.BirdBreed;

/**
 *
 *
 * @author tlminh
 */
@WebServlet(name = "RenderBirdPairController", urlPatterns = {"/RenderBirdPairController"})
public class RenderBirdPairController extends HttpServlet {

    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "shop/bird-pair.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        PrintWriter out = response.getWriter();
        try {
            String username = request.getParameter("username");
            String birdCustomerId = request.getParameter("birdCustomerId");
            String breedIdMale = request.getParameter("breedIdMale");
            String breedIdFemale = request.getParameter("breedIdFemale");
            String breedId = request.getParameter("breedId");
            String gender = request.getParameter("gender");
            String birdId = request.getParameter("birdId");
            List<BirdBreed> breedList = new ArrayList<>();
            BirdBreedDAO breedDao = new BirdBreedDAO();
            BirdCustomerDAO bcd = new BirdCustomerDAO();
            BirdDAO birdDao = new BirdDAO();
            breedList = breedDao.getBirdBreeds();
            request.setAttribute("BIRD_BREEDS", breedList);
            NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
      
            if (breedIdMale == null && breedIdFemale == null
                    && birdId == null && breedId == null
                    && gender == null && username == null
                    && birdCustomerId == null) {
                request.getRequestDispatcher(SUCCESS).forward(request, response);
            }

            if (breedId != null && "1".equals(gender)) {
                List<Bird> birdList = new ArrayList<>();
                birdList = birdDao.getBirdsByBreedId(breedId);
                out.println("<option value = \"\">Chọn vẹt</option>");
                for (Bird bird : birdList) {
                    if (bird.isGender() == false && bird.getAge() >= bird.getGrown_age()
                            && bird.getStatus().equals("Còn hàng")) {
                        out.println("<option value=\"" + bird.getBird_id() + "\">" + bird.getBird_name() + "</option>");
                    };
                }
                return;
            }
            if (breedId != null && "0".equals(gender)) {
                List<Bird> birdList = new ArrayList<>();
                birdList = birdDao.getBirdsByBreedId(breedId);
                out.println("<option value = \"\">Chọn vẹt</option>");
                for (Bird bird : birdList) {
                    if (bird.isGender() == true && bird.getAge() >= bird.getGrown_age()
                            && bird.getStatus().equals("Còn hàng")) {
                        out.println("<option value=\"" + bird.getBird_id() + "\">" + bird.getBird_name() + "</option>");
                    };
                }
                return;
            }

            if (breedIdMale != null) {
                List<Bird> birdList = new ArrayList<>();
                birdList = birdDao.getBirdsByBreedId(breedIdMale);
                out.println("<option value = \"\">Chọn vẹt</option>");
                for (Bird bird : birdList) {
                    if (bird.isGender() == true && bird.getAge() >= bird.getGrown_age()
                            && bird.getStatus().equals("Còn hàng")) {
                        out.println("<option value=\"" + bird.getBird_id() + "\">" + bird.getBird_name() + "</option>");
                    }
                }
                return;
            }
            if (breedIdFemale != null) {
                List<Bird> birdList = new ArrayList<>();
                birdList = birdDao.getBirdsByBreedId(breedIdFemale);
                out.println("<option value = \"\">Chọn vẹt</option>");
                for (Bird bird : birdList) {
                    if (bird.isGender() == false && bird.getAge() >= bird.getGrown_age()
                            && bird.getStatus().equals("Còn hàng")) {
                        out.println("<option value=\"" + bird.getBird_id() + "\">" + bird.getBird_name() + "</option>");
                    }
                }
                return;
            }
            if (username != null && breedId != null) {
                List<BirdCustomer> birdCustomerList = new ArrayList<>();
                birdCustomerList = bcd.getBirdCustomerByCustomer(username, breedId, null, 0);
                out.println("<option value = \"\">Chọn vẹt</option>");
                for (BirdCustomer bird : birdCustomerList) {
                    if (bird.getStatus().equals("Chưa ghép cặp")) {
                        out.println("<option value=\"" + bird.getBird_id() + "\">" + bird.getName() + "</option>");
                    }
                }
                return;
            }
            if (birdId != null && username != null) {
                Bird bird = birdDao.getBirdById(birdId);
                out.println("                          <div class=\"bird-info-row\">\n"
                        + "                                <!-- Placeholder for bird image -->\n"
                        + "                                <img id=\"birdImage1\" src=\"" + bird.getImage_url() + "\" alt=\"" + bird.getBird_name() + "\">\n"
                        + "                            </div>\n");
                return;
            }
            if (birdId != null) {
                Bird bird = birdDao.getBirdById(birdId);  
                out.println("                          <div class=\"bird-info-row\">\n"
                        + "                                <!-- Placeholder for bird image -->\n"
                        + "                                <img id=\"birdImage1\" src=\"" + bird.getImage_url() + "\" alt=\"" + bird.getBird_name() + "\">\n"
                        + "                            </div>\n"
                        + "                            <div class=\"bird-info-row info-name customer-hidden\">\n"
                        + "                                <span id=\"birdName1\">" + bird.getBird_name() + "</span>\n"
                        + "                            </div>\n"
                        + "                            <div class=\"bird-info-row customer-hidden\">\n"
                        + "                                <span class=\"info-title\">Tuổi</span>\n"
                        + "                                <span id=\"birdAge1\" class=\"info-content\">" + bird.getAge() + "</span>\n"
                        + "                            </div>\n"
                        + "                            <div class=\"bird-info-row customer-hidden\">\n"
                        + "                                <span class=\"info-title\">Thành tích</span>\n"
                        + "                                <pre id=\"birdAchievement1\" class=\"info-content\">" + bird.getAchievement() + "</pre>\n"
                        + "                            </div>\n"
                        + "                            <div class=\"bird-info-row customer-hidden\">\n"
                        + "                                <span class=\"info-title\">Số lứa sinh sản</span>\n"
                        + "                                <span id=\"birdReproductionHistory1\" class=\"info-content\">" + bird.getReproduction_history() + "</span>\n"
                        + "                            </div>\n"
                        + "                            <div class=\"bird-info-row customer-hidden\">\n"
                        + "                                <span class=\"info-title\">Giá</span>\n"
                        + "                                <span id=\"birdPrice1\" class=\"info-content\" pattern=\"#,###\">" + numberFormat.format(bird.getPrice()) + "</span>\n"
                        + "                            </div>");
                return;
            }
            if (birdCustomerId != null) {
                BirdCustomer bird = bcd.findBirdCustomer(birdCustomerId);
                String genderBird = bird.isGender() == true ? "1" : "0";
                out.println("                          <div class=\"bird-info-row\">\n"
                        + "                                <input type=\"hidden\" name=\"gender\" value=\"" + genderBird + "\">"
                        + "                                <!-- Placeholder for bird image -->\n"
                        + "                                <img id=\"birdImage1\" src=\"" + bird.getImg_url() + "\" alt=\"" + bird.getName() + "\">\n"
                        + "                            </div>\n");
                return;
            }
        } catch (Exception e) {
            log("Error at RenderBirdPairController: " + e.toString());
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
