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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
@WebServlet(name="AddBirdCompareController", urlPatterns={"/AddBirdCompareController"})
public class AddBirdCompareController extends HttpServlet {
   
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
        try {
            String birdId = request.getParameter("bird_id");
            HttpSession session = request.getSession();
            ArrayList<String> listCompare = (ArrayList<String>) session.getAttribute("BIRDCOMAPRE");
            if(listCompare != null){
                boolean check = true;
                for (int i = 0; i < listCompare.size(); i++) {
                    if(birdId.equals(listCompare.get(i))){
                        listCompare.remove(i);
                        response.getWriter().println(listCompare.size());
                        check = false;
                        break;
                    }
                }
                if(check) listCompare.add(birdId);
                session.setAttribute("BIRDCOMAPRE", listCompare);
            }else{
                  listCompare = new ArrayList<>();
                  listCompare.add(birdId);
                  session.setAttribute("BIRDCOMAPRE", listCompare);
            }
        }catch (Exception e){
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
