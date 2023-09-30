/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package swp391.birdfarmshop.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import swp391.birdfarmshop.dao.UserDAO;
import swp391.birdfarmshop.model.User;

/**
 *
 * @author phong pc
 */
public class UpdateInformationController extends HttpServlet {
    
    private static final String ERROR = "errorpages/error.jsp";
    private static final String SUCCESS = "profile/profile.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String changingStreet = request.getParameter("street");
            String changingWard = request.getParameter("ward");
            String changingDistrict = request.getParameter("district");
            String changingCity = request.getParameter("city");
            String[] addressDetail = address.split(",");
            String street = null, ward = null, district = null, city = null;
            if (addressDetail.length == 4) {
                street = addressDetail[0];
                ward = addressDetail[1];
                district = addressDetail[2];
                city = addressDetail[3];
            }
            if(user != null) {
                if(fullname.isEmpty()) 
                    fullname = user.getFullName();
                if(email.isEmpty()) 
                    email = user.getEmail();
                if(phone.isEmpty())
                    phone = user.getPhone();
                if(!changingStreet.isBlank())
                    street = changingStreet;
                if(!changingWard.isBlank())
                    ward = changingWard;
                if(!changingDistrict.isBlank())
                    district = changingDistrict;
                if(!changingCity.isBlank())
                    city = changingCity;
                address = street + "," + ward + "," + district + "," + city;
                UserDAO userDao = new UserDAO();
                boolean check = userDao.updateInfo(fullname, phone, email, address, user.getUsername());
                User u = userDao.findUser(user.getUsername(), user.getEmail());
                session.setAttribute("LOGIN_USER", u);
                if(check)
                    url = SUCCESS;
            }
        } catch(Exception e) {
            log("Error at UpdateInformationController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
