/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package swp391.birdfarmshop.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import swp391.birdfarmshop.dao.BirdDAO;
import swp391.birdfarmshop.dao.ImageDAO;
import swp391.birdfarmshop.dto.BirdDTO;
import swp391.birdfarmshop.model.Image;
import swp391.birdfarmshop.model.User;
import swp391.birdfarmshop.util.Constants;
import swp391.birdfarmshop.util.ImageUtils;
import swp391.birdfarmshop.util.S3Utils;

/**
 *
 * @author phong pc
 */
@WebServlet(name = "UpdateBirdController", urlPatterns = {"/UpdateBirdController"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,//1mb
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)
public class UpdateBirdController extends HttpServlet {

    private static final String ERROR = "errorpages/error.jsp";
    private static final String HOME = "MainController?action=NavToHome";
    private static final String SUCCESS = "management/edit-bird.jsp";
    private static final String DETAIL = "MainController?action=NavToBirdDetails&bird_id=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            if (user != null && !user.getRole().equals("customer")) {
                url = SUCCESS;
                String bird_id = request.getParameter("bird_id");
                BirdDAO birdDao = new BirdDAO();
                List<BirdDTO> birds = birdDao.getAllBirds();
                BirdDTO birdDetails = birdDao.getBirdDetailsById(bird_id);
                ImageDAO imageDao = new ImageDAO();
                ArrayList<Image> images = imageDao.getImagesFollowBirdId(bird_id);
                HashMap<String, String> breed = new HashMap<>();
                List<String> listStatus = new ArrayList<>();
                for (BirdDTO bird : birds) {
                    if (!breed.containsKey(bird.getBreed_id())) {
                        breed.put(bird.getBreed_id(), bird.getBreed_name());
                    }
                    if (!listStatus.contains(bird.getStatus())) {
                        listStatus.add(bird.getStatus());
                    }
                }
                request.setAttribute("BREED", breed);
                request.setAttribute("STATUS", listStatus);
                request.setAttribute("BIRD", birdDetails);
                request.setAttribute("BIRDIMAGES", images);
                String btAction = request.getParameter("btAction");
                if (btAction != null) {
                    if (btAction.equals("Update")) {
                        String txtBirdName = request.getParameter("txtBirdName");
                        String txtBirdColor = request.getParameter("txtBirdColor");
                        String birdDate = request.getParameter("txtBirdDate");
                        String txtBirdGrownAge = request.getParameter("txtBirdGrownAge");
                        String txtBirdGender = request.getParameter("txtBirdGender");
                        String txtBirdBreed = request.getParameter("txtBirdBreed");
                        String txtBirdAchievement = request.getParameter("txtBirdAchievement");
                        String txtBirdReproduction_history = request.getParameter("txtBirdReproduction_history");
                        String txtBirdPrice = request.getParameter("txtBirdPrice");
                        String txtBirdDescription = request.getParameter("txtBirdDescription");
                        String txtBirdDiscount = request.getParameter("txtBirdDiscount");
                        String txtBirdStatus = request.getParameter("txtBirdStatus");
                        Part image_1 = request.getPart("txtImage_1");
                        Part image_2 = request.getPart("txtImage_2");
                        Part image_3 = request.getPart("txtImage_3");
                        if (image_1.getSize() > 0 && images.size() >= 1) {
                            updateImage(image_1, bird_id, images.get(0).getImage_id());
                        }
                        if (image_2.getSize() > 0 && images.size() >= 2) {
                            updateImage(image_2, bird_id, images.get(1).getImage_id());
                        }
                        if (image_3.getSize() > 0 && images.size() == 3) {
                            updateImage(image_3, bird_id, images.get(2).getImage_id());
                        }
                        boolean check = birdDao.updateBird(bird_id, txtBirdName, txtBirdColor, birdDate, 
                                    txtBirdGrownAge, txtBirdGender, txtBirdBreed, txtBirdAchievement, 
                                    txtBirdReproduction_history, txtBirdPrice, txtBirdDescription, 
                                    txtBirdDiscount, txtBirdStatus);
                        if (check) {
                            session.setAttribute("SUCCESS", "Cập nhật thành công");
                            url = DETAIL + bird_id;
                        } else {
                            session.setAttribute("ERROR", "Cập nhật thất bại");
                        }
                    }
                }
            } else {
                url = HOME;
            }
        } catch (SQLException | ParseException e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    public void updateImage(Part part, String bird_id, int image_id) throws SQLException, IOException {
        ImageDAO imgDao = new ImageDAO();
        if (part.getSize() < 1048576) {
            String file = ImageUtils.getFileName(part);
            LocalTime currentTime = LocalTime.now();
            String nameImage = currentTime.getNano() + file;
            String img_url = Constants.C3_HOST + nameImage;
            S3Utils.uploadFile(nameImage, part.getInputStream());
            imgDao.updateImageBird(img_url, bird_id, image_id);
        }
    }
    
    public void addNewImage(Part part, String bird_id) throws SQLException, IOException {
        ImageDAO imgDao = new ImageDAO();
        if (part.getSize() < 1048576) {
            String file = ImageUtils.getFileName(part);
            LocalTime currentTime = LocalTime.now();
            String nameImage = currentTime.getNano() + file;
            String img_url = Constants.C3_HOST + nameImage;
            S3Utils.uploadFile(nameImage, part.getInputStream());
            imgDao.addNewImageBird(img_url, "0", bird_id);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateBirdController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateBirdController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
