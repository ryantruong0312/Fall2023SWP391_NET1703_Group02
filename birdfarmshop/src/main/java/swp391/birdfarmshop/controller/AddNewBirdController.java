/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package swp391.birdfarmshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collection;
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
public class AddNewBirdController extends HttpServlet {
   
    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "management/add-bird.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        PrintWriter out = response.getWriter();
        String female = request.getParameter("femaleBird");
        String male = request.getParameter("maleBird");
        String btAction = request.getParameter("btAction");
        BirdDAO birdDao = new BirdDAO();
        List<BirdDTO> birds = birdDao.getAllBirds();
        try {               
            if(btAction == null) {
                HashMap<String,String> breed = new HashMap<>();
                List<String> listStatus = new ArrayList<>();
                List<Bird> maleBirds = new ArrayList<>();
                List<Bird> femaleBirds = new ArrayList<>();
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
//                    if(bird.getGender().equals("Đực") && (bird.getAge() > bird.getGrown_age())) {
//                        maleBirds.add(bird);
//                    }
//                    if(bird.getGender().equals("Cái") && (bird.getAge() > bird.getGrown_age())) {
//                        femaleBirds.add(bird);
//                    }
                }
//                request.setAttribute("selectedRadioId", selectedRadioId);
                request.setAttribute("BREED", breed);
                request.setAttribute("STATUS", listStatus);
                request.setAttribute("MALEBIRDS", maleBirds);
                request.setAttribute("FEMALEBIRDS", femaleBirds);
                url = SUCCESS;
            }
            if(btAction.equals("Add")) {
                String txtBirdId = request.getParameter("txtBirdId");
                for (BirdDTO bird : birds) {
                    if(bird.getBird_id().equals(txtBirdId)) {
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
                String txtBirdDad = request.getParameter("txtBirdDad");
                String txtBirdMom = request.getParameter("txtBirdMom");
                String txtBirdDiscount = request.getParameter("txtBirdDiscount");
                String txtBirdStatus = request.getParameter("txtBirdStatus");
                String txtImage_1 = request.getParameter("txtImage_1");
                String txtImage_2 = request.getParameter("txtImage_2");
                String txtImage_3 = request.getParameter("txtImage_3");
                boolean check = birdDao.addNewBird(txtBirdId, txtBirdName + " " + txtBirdId,txtBirdColor, 
                        txtBirdDate, txtBirdGrownAge, txtBirdGender, txtBirdBreed, 
                        txtBirdAchievement, txtBirdReproduction_history, txtBirdPrice, 
                        txtBirdDescription, txtBirdDad, txtBirdMom, txtBirdDiscount, txtBirdStatus);
                ImageDAO imageDao = new ImageDAO();
                boolean check_image1 = imageDao.addNewImageBird(txtImage_1, "1", txtBirdId);
                boolean check_image2 = imageDao.addNewImageBird(txtImage_2, "0", txtBirdId);
                boolean check_image3 = imageDao.addNewImageBird(txtImage_3, "0", txtBirdId);
                if(check && check_image1) {
                    request.setAttribute("MESSAGE", "Đăng kí thành công");
                }
            }
            url = SUCCESS;
//            Collection<Part> parts = request.getParts();
//            int imageCount = 0; // Biến đếm số lượng tệp hình ảnh
//            for (Part part : parts) {
//                if (isImageFile(part)) {
//                    imageCount++; // Tăng biến đếm nếu phát hiện tệp hình ảnh
//
//                    if (imageCount > 3) {
//                        // Nếu đã nhận được 3 tệp hình ảnh, từ chối tệp hình ảnh thứ 4
//                        response.getWriter().write("Chỉ cho phép tải lên tối đa 3 tệp hình ảnh.");
//                        return;
//                    }
//
//                    String fileName = getFileName(part); // Lấy tên tệp
//                    // Xử lý tệp hình ảnh ở đây
//                    // Lưu vào cơ sở dữ liệu hoặc thư mục trên máy chủ
//                }
//            }
        }catch (ClassNotFoundException | SQLException | ParseException e) {
        }finally {
            if(female==null && male == null){
               request.getRequestDispatcher(url).forward(request, response);
            }
            if(btAction.equals("Add")) {
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
            Logger.getLogger(AddNewBirdController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AddNewBirdController.class.getName()).log(Level.SEVERE, null, ex);
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

    private boolean isImageFile(Part part) {
        // Kiểm tra xem phần này có phải là phần tệp hình ảnh (ví dụ: jpg, png, gif) hay không
        String contentType = part.getContentType();
        return contentType != null && contentType.startsWith("image");
    }

    private String getFileName(Part part) {
        // Hàm để lấy tên tệp từ Part
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            return token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
        }
        return "";
    }

}
