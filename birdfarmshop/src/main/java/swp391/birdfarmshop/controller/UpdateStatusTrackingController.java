/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package swp391.birdfarmshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.time.LocalTime;
import swp391.birdfarmshop.dao.ImageDAO;
import swp391.birdfarmshop.dao.TrackingBirdPairDAO;
import swp391.birdfarmshop.model.User;
import swp391.birdfarmshop.util.Constants;
import swp391.birdfarmshop.util.ImageUtils;
import swp391.birdfarmshop.util.S3Utils;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateStatusTrackingController", urlPatterns = {"/UpdateStatusTrackingController"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,//1mb
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)
public class UpdateStatusTrackingController extends HttpServlet {
    private static final String DEST_NAV_HOME = "RenderHomeController";
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
        String url = DEST_NAV_HOME;
        try {
            HttpSession session = request.getSession();
            String pair_id = request.getParameter("pair_id");
            int pairId = 0;
            if(pair_id != null){
                pairId = Integer.parseInt(pair_id);
            }
            String content = request.getParameter("content");
            String status = request.getParameter("status");
            int quantiy_egg = Integer.parseInt(request.getParameter("quantity_egg"));
            int  quantity_young_bird =  Integer.parseInt(request.getParameter("quantity_young_bird"));
            String order_id = request.getParameter("order_id");
            Part part = request.getPart("file");
            url = "MainController?action=NavToBirdPairDetailShop&order_id="+order_id;
            User u = (User) session.getAttribute("LOGIN_USER");
            TrackingBirdPairDAO trackingDao = new TrackingBirdPairDAO();
            if (u != null) {
                if (!u.getRole().equals("customer")) {
                        if (part.getSize() < 1048576) {
                            String file = ImageUtils.getFileName(part);
                            LocalTime currentTime = LocalTime.now();
                            String nameImage = currentTime.getNano() + file;
                            String img_url = Constants.C3_HOST + nameImage;
                            S3Utils.uploadFile(nameImage, part.getInputStream());
                            int result = trackingDao.getTrackingBirdPair(img_url, pairId,content, u.getUsername(),status,quantity_young_bird,quantiy_egg);
                            if (result == 0){
                                session.setAttribute("ERROR", "Cập nhật trạng thái thất bại");
                                 request.getRequestDispatcher(url).forward(request, response);
                            } else {
                                session.setAttribute("SUCCESS", "Cập nhật trạng thái thành công");
                                response.sendRedirect(url);
                            }
                        } else {
                            session.setAttribute("ERROR", "Ảnh có dung lượng quá 1mb");
                             request.getRequestDispatcher(url).forward(request, response);
                        }
                } else {
                    session.setAttribute("ERROR", "Bạn không có quyền này");
                     request.getRequestDispatcher(url).forward(request, response);
                }

            } else {
                session.setAttribute("ERROR", "Bạn chưa đăng nhập");
                 request.getRequestDispatcher(url).forward(request, response);
            }          
        } catch (Exception e) {
            e.printStackTrace();
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
