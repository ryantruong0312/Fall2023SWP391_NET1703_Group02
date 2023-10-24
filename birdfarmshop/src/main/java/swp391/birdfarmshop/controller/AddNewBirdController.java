/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package swp391.birdfarmshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.sql.SQLException;
import java.text.ParseException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import swp391.birdfarmshop.dao.BirdBreedDAO;
import swp391.birdfarmshop.dao.BirdDAO;
import swp391.birdfarmshop.dao.ImageDAO;
import swp391.birdfarmshop.dto.BirdDTO;
import swp391.birdfarmshop.model.User;
import swp391.birdfarmshop.util.Constants;
import swp391.birdfarmshop.util.ImageUtils;
import swp391.birdfarmshop.util.S3Utils;

/**
 *
 * @author phong pc
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,//1mb
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)
public class AddNewBirdController extends HttpServlet {

    private static final String ERROR = "errorpages/error.jsp";
    private static final String HOME = "shop/home.jsp";
    private static final String SUCCESS = "management/add-bird.jsp";
    private static final String DETAIL = "MainController?action=NavToBirdDetails&";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        LocalTime currentTime;
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            if (user != null && !user.getRole().equals("customer")) {
                BirdDAO birdDao = new BirdDAO();
                List<BirdDTO> birds = birdDao.getAllBirds();
                HashMap<String, String> breed = new HashMap<>();
                for (BirdDTO bird : birds) {
                    if (!breed.containsKey(bird.getBreed_id())) {
                        breed.put(bird.getBreed_id(), bird.getBreed_name());
                    }
                }
                request.setAttribute("BREED", breed);
                String btAction = request.getParameter("btAction");
                String txtBirdId = request.getParameter("txtBirdId");
                if (btAction != null && btAction.equals("Add")) {
                    for (BirdDTO bird : birds) {
                        if (bird.getBird_id().equals(txtBirdId)) {
                            request.setAttribute("MESSAGE", "ID ĐÃ TỒN TẠI. NHẬP ID MỚI");
                            request.getRequestDispatcher(SUCCESS).forward(request, response);
                            break;
                        }
                    }
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
                    String txtBirdStatus = "Còn hàng";
                    if (txtBirdBreed.equals("other")) {
                        String txtOtherBreed_name = request.getParameter("txtOtherBreed_name");
                        if (txtOtherBreed_name != null) {
                            BirdBreedDAO breedDao = new BirdBreedDAO();
                            String otherBreed_id = breedDao.createNewBreed(txtOtherBreed_name);
                            txtBirdBreed = otherBreed_id;
                        }
                    }
                    Collection<Part> parts = request.getParts();
                    ArrayList<String> images = new ArrayList<>();
                    int imageCount = 0;
                    for (Part part : parts) {
                        if (imageCount >= 2) {
                            break;
                        }
                        if (part.getName().equals("filePicture")) {
                            imageCount++;
                            String file = ImageUtils.getFileName(part);
                            currentTime = LocalTime.now();
                            String nameImage = currentTime.getNano() + file;
                            //S3Utils.uploadFile(nameImage, part.getInputStream());
                            String img_url = Constants.C3_HOST + nameImage;
                            images.add(img_url);
                        }
                    }
                    boolean check = false;
                    if (images.size() == 1) {
                        check = birdDao.addNewBird(txtBirdId, txtBirdName + " " + txtBirdId, txtBirdColor,
                                txtBirdDate, txtBirdGrownAge, txtBirdGender, txtBirdBreed,
                                txtBirdAchievement, txtBirdReproduction_history, txtBirdPrice,
                                txtBirdDescription, txtBirdDiscount, txtBirdStatus, images.get(0));
                    }
                    ImageDAO imgDao = new ImageDAO();

                    if (images.size() == 2) {
                        imgDao.addNewImageBird(images.get(1), "0", txtBirdId);
                    }
                    if (images.size() == 3) {
                        imgDao.addNewImageBird(images.get(2), "0", txtBirdId);
                    }
                    if (check) {
                        session.setAttribute("SUCCESS", "Tạo mới thành công");
                    } else {
                        session.setAttribute("ERROR", "Tạo mới thất bại");
                    }
                }
                
                String noMore = request.getParameter("noMore");
                if (noMore != null) {
                    url = DETAIL + "bird_id=" + txtBirdId;
                } else {
                    url = SUCCESS;
                }
            } else {
                url = HOME;
            }
        } catch (SQLException e) {
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddNewBirdController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(AddNewBirdController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AddNewBirdController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(AddNewBirdController.class.getName()).log(Level.SEVERE, null, ex);
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
