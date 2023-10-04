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
import java.util.ArrayList;
import java.util.List;
import swp391.birdfarmshop.dao.BirdBreedDAO;
import swp391.birdfarmshop.dao.BirdDAO;
import swp391.birdfarmshop.model.BirdBreed;
import swp391.birdfarmshop.util.ImageUtils;

/**
 *
 * @author Admin
 */
@WebServlet(name="CreateBirdCustomer", urlPatterns={"/CreateBirdCustomer"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,//1mb
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)
public class CreateBirdCustomer extends HttpServlet {
     private static final String DEST_NAV_CREATE_BIRD_CUSTOMER = "shop/add-bird.jsp";
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = DEST_NAV_CREATE_BIRD_CUSTOMER;
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            List<BirdBreed> breedList = new ArrayList<>();
            BirdBreedDAO breedDao = new BirdBreedDAO();
            BirdDAO birdDao = new BirdDAO();
            breedList = breedDao.getBirdBreeds();
            String breedId = request.getParameter("txtBreedId");
            String birdId = request.getParameter("txtBirdId");
            String nameBird = request.getParameter("nameBird");
            Part part = (Part) request.getPart("filePicture");
            if(part != null){
                 String file = ImageUtils.getFileName(part); 
            }
                 
             
            request.setAttribute("BIRD_BREEDS", breedList);
            request.getRequestDispatcher(url).forward(request, response);
        }catch(Exception e){
            e.printStackTrace();
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
        processRequest(request, response);
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
        processRequest(request, response);
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
