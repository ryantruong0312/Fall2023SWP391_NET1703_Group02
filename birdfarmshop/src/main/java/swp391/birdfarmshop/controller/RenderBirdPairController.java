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
import java.util.ArrayList;
import java.util.List;
import swp391.birdfarmshop.dao.BirdBreedDAO;
import swp391.birdfarmshop.dao.BirdDAO;
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
            String breedIdMale = request.getParameter("breedIdMale");
            String breedIdFemale = request.getParameter("breadIdFemale");
            String breedId = request.getParameter("breedId");
            String gender = request.getParameter("gender");
            String birdId = request.getParameter("birdId");
            List<BirdBreed> breedList = new ArrayList<>();
            BirdBreedDAO breedDao = new BirdBreedDAO();
            BirdDAO birdDao = new BirdDAO();
            breedList = breedDao.getBirdBreeds();
            request.setAttribute("BIRD_BREEDS", breedList);
            if (breedIdMale == null && breedIdFemale == null
                && birdId == null && breedId == null
                && gender == null) {
                request.getRequestDispatcher(SUCCESS).forward(request, response);
            }
            
            if (breedId != null && gender == null) {
                List<Bird> birdList = new ArrayList<>();
                birdList = birdDao.getBirdsByBreedId(breedId);
                out.println("<option value = \"\">Chọn vẹt</option>");
                for (Bird bird : birdList) {
                    if (bird.getAge() >= bird.getGrown_age()
                        && bird.getStatus().equals("Còn hàng")) {
                        out.println("<option value=\"" + bird.getBird_id() + "\">" + bird.getBird_name() + "</option>");
                    }
                }
                return;
            }
            
            if (breedId != null &&  "3".equals(gender) ) {
                List<Bird> birdList = new ArrayList<>();
                birdList = birdDao.getBirdsByBreedId(breedId);
                out.println("<option value = \"\">Chọn vẹt</option>");
                for (Bird bird : birdList) {
                        out.println("<option value=\"" + bird.getBird_id() + "\">" + bird.getBird_name() + "</option>");
                }
            }
            
            if (breedId != null && "1".equals(gender)) {
                List<Bird> birdList = new ArrayList<>();
                birdList = birdDao.getBirdsByBreedId(breedId);
                out.println("<option value = \"\">Chọn vẹt</option>");
                for (Bird bird : birdList) {
                      if (bird.isGender() == false && bird.getAge() >= bird.getGrown_age()
                                                 && bird.getStatus().equals("Còn hàng")){
                        out.println("<option value=\"" + bird.getBird_id() + "\">" + bird.getBird_name() + "</option>");
                      };
                }
            }
            if (breedId != null && "0".equals(gender) ) {
                List<Bird> birdList = new ArrayList<>();
                birdList = birdDao.getBirdsByBreedId(breedId);
                out.println("<option value = \"\">Chọn vẹt</option>");
                for (Bird bird : birdList) {
                      if (bird.isGender() == true && bird.getAge() >= bird.getGrown_age()
                                                 && bird.getStatus().equals("Còn hàng")){
                        out.println("<option value=\"" + bird.getBird_id() + "\">" + bird.getBird_name() + "</option>");
                      };
                }
            }
            
            if (breedIdMale != null) {
                List<Bird> birdList = new ArrayList<>();
                birdList = birdDao.getBirdsByBreedId(breedIdMale);
                out.println("<option value = \"\">Chọn vẹt</option>");
                for (Bird bird : birdList) {
                    if (bird.isGender() == true && bird.getAge() >= bird.getGrown_age()
                                                 && bird.getStatus().equals("Còn hàng")){
                        out.println("<option value=\"" + bird.getBird_id() + "\">" + bird.getBird_name() + "</option>");
                    }
                }
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
            }
            
            if(birdId != null){
                Bird bird = birdDao.getBirdById(birdId);
                out.println("                          <div class=\"bird-info-row\">\n"
                        + "                                <!-- Placeholder for bird image -->\n"
                        + "                                <img id=\"birdImage1\" src=\""+bird.getImage_url()+"\" alt=\""+bird.getBird_name()+"\">\n"
                        + "                            </div>\n"
                        + "                            <div class=\"bird-info-row info-name customer-hidden\">\n"
                        + "                                <span id=\"birdName1\">"+bird.getBird_name()+"</span>\n"
                        + "                            </div>\n"
                        + "                            <div class=\"bird-info-row customer-hidden\">\n"
                        + "                                <span class=\"info-title\">Tuổi</span>\n"
                        + "                                <span id=\"birdAge1\" class=\"info-content\">"+bird.getAge()+"</span>\n"
                        + "                            </div>\n"
                        + "                            <div class=\"bird-info-row customer-hidden\">\n"
                        + "                                <span class=\"info-title\">Thành tích</span>\n"
                        + "                                <pre id=\"birdAchievement1\" class=\"info-content\">"+bird.getAchievement()+"</pre>\n"
                        + "                            </div>\n"
                        + "                            <div class=\"bird-info-row customer-hidden\">\n"
                        + "                                <span class=\"info-title\">Số lứa sinh sản</span>\n"
                        + "                                <span id=\"birdReproductionHistory1\" class=\"info-content\">"+bird.getReproduction_history()+"</span>\n"
                        + "                            </div>\n"
                        + "                            <div class=\"bird-info-row customer-hidden\">\n"
                        + "                                <span class=\"info-title\">Giá</span>\n"
                        + "                                <span id=\"birdPrice1\" class=\"info-content\" pattern=\"#,###\">"+bird.getPrice()+"</span>\n"
                        + "                            </div>");
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
