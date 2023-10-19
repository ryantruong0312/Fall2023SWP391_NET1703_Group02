/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package swp391.birdfarmshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import swp391.birdfarmshop.dao.BirdDAO;
import swp391.birdfarmshop.dao.ImageDAO;
import swp391.birdfarmshop.dto.BirdDTO;
import swp391.birdfarmshop.model.Bird;

/**
 *
 * @author phong pc
 */

@WebServlet(name = "UpdateBirdController", urlPatterns = {"/UpdateBirdController"})
public class UpdateBirdController extends HttpServlet {
   
    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "management/edit-bird.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        PrintWriter out = response.getWriter();
        String female = request.getParameter("femaleBird");
        String male = request.getParameter("maleBird");
        String btAction = request.getParameter("btAction");
        String bird_id = request.getParameter("bird_id");
        BirdDAO birdDao = new BirdDAO();
        List<BirdDTO> birds = birdDao.getAllBirds();
        BirdDTO birdDetails = birdDao.getBirdDetailsById(bird_id);
        System.out.println(birdDetails.getBird_name());
        try {
            if(btAction != null) {
                if(btAction.equals("Update")) {
                    String txtBirdId = request.getParameter("txtBirdId");
                    String txtBirdName = request.getParameter("txtBirdName");
                    String txtBirdColor = request.getParameter("txtBirdColor");
                    String txtBirdDate = request.getParameter("txtBirdDate");
                    String txtBirdGrownAge = request.getParameter("txtBirdGrownAge");
                    String txtBirdGender = request.getParameter("txtBirdGender");
                    String txtBirdBreed = request.getParameter("txtBirdBreed");
                    String txtBirdAchievement = request.getParameter("txtBirdAchievement");
                    String txtBirdReproduction_history = request.getParameter("txtBirdReproduction_history");
                    String txtBirdPrice = request.getParameter("txtBirdPrice");
                    String txtBirdDescription = request.getParameter("txtBirdDescription");
                    String txtBirdDiscount = request.getParameter("txtBirdDiscount");
                    String txtBirdStatus = request.getParameter("txtBirdStatus");
                    String txtImage_1 = request.getParameter("txtImage_1");
                    String txtImage_2 = request.getParameter("txtImage_2");
                    String txtImage_3 = request.getParameter("txtImage_3");
                    boolean check = birdDao.updateBird(txtBirdId, txtBirdName,txtBirdColor, 
                            txtBirdDate, txtBirdGrownAge, txtBirdGender, txtBirdBreed, 
                            txtBirdAchievement, txtBirdReproduction_history, txtBirdPrice, 
                            txtBirdDescription, txtBirdDiscount, 
                            txtBirdStatus);
                    ImageDAO imageDao = new ImageDAO();
                    boolean check_image1 = imageDao.updateImageBird(txtImage_1, txtBirdId);
                    boolean check_image2 = imageDao.updateImageBird(txtImage_2, txtBirdId);
                    boolean check_image3 = imageDao.updateImageBird(txtImage_3, txtBirdId);
                    if(check && check_image1) {
                        request.setAttribute("MESSAGE", "Cập nhật thành công");
                    }
                    url = SUCCESS;
                }
            } else {
                HashMap<String,String> breed = new HashMap<>();
                List<String> listStatus = new ArrayList<>();
                List<Bird> maleBirds = new ArrayList<>();
                List<Bird> femaleBirds = new ArrayList<>();
                ArrayList<String> image_urls = new ArrayList<>();
                if(female != null){
                    femaleBirds = birdDao.getBirdsByBreedId(female);
                    for (Bird bird :femaleBirds) {
                        if(!bird.isGender()){
                            out.println(" <option value=\""+bird.getBird_id()+"\">"+bird.getBird_name()+"</option>");
                        }
                    }
                }
                if(male != null){
                    maleBirds = birdDao.getBirdsByBreedId(male);
                    for (Bird bird :maleBirds) {
                        if(bird.isGender()){
                            out.println(" <option value=\""+bird.getBird_id()+"\">"+bird.getBird_name()+"</option>");
                        }
                    }
                }
                for (BirdDTO bird : birds) {
                    if(!breed.containsKey(bird.getBreed_id())){
                        breed.put(bird.getBreed_id(), bird.getBreed_name());
                    }
                    if(!listStatus.contains(bird.getStatus())) {
                        listStatus.add(bird.getStatus());
                    }
                    image_urls = bird.getImage_urls();
                }
                request.setAttribute("BREED", breed);
                request.setAttribute("STATUS", listStatus);
                request.setAttribute("BIRD", birdDetails);
                request.setAttribute("BIRDIMAGES", image_urls);
                url = SUCCESS;
            }
        }catch (ClassNotFoundException | SQLException | ParseException e) {
        }finally {
            if(female==null && male == null){
               request.getRequestDispatcher(url).forward(request, response);
            }
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
            Logger.getLogger(UpdateBirdController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UpdateBirdController.class.getName()).log(Level.SEVERE, null, ex);
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
