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
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import swp391.birdfarmshop.dao.AccessoryDAO;
import swp391.birdfarmshop.dao.BirdDAO;
import swp391.birdfarmshop.dto.CartDTO;
import swp391.birdfarmshop.model.Accessory;
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.model.OrderedBirdItem;

/**
 *
 * @author tlminh
 */
@WebServlet(name = "AddBirdToCartController", urlPatterns = {"/AddBirdToCartController"})
public class AddBirdToCartController extends HttpServlet {

    private static final String DEST_NAV_CART = "RenderCartController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String bird_id = request.getParameter("bird_id");
            String cage_id = request.getParameter("cage_id");
            BirdDAO birdDao = new BirdDAO();
            AccessoryDAO adao = new AccessoryDAO();
            HttpSession session = request.getSession();
            if(bird_id != null && cage_id != null){
                if (session != null) {
                    CartDTO cart = (CartDTO) session.getAttribute("CART");
                    if (cart == null) {
                        session.setAttribute("ERROR", "Không có sản phẩm nào trong giỏ hàng của bạn");
                    }else{
                        List<Accessory> cageList = adao.getCageList();
                        Accessory cheapestCage = cageList.get(0);
                        int cheapestCagePrice = cheapestCage.getUnit_price() - cheapestCage.getUnit_price() * cheapestCage.getDiscount() / 100;
                        for (Accessory cage : cageList) {
                            if ((cage.getUnit_price() - cage.getUnit_price() * cage.getDiscount() / 100) < cheapestCagePrice) {
                                cheapestCage = cage;
                            }
                        }
                        Accessory a = adao.getAccessoryByID(cage_id);
                        a.setDiscount(50);
                        if(cheapestCage.getAccessory_id().equals(cage_id)){
                                cheapestCage.setUnit_price(0);
                                cheapestCage.setDiscount(0);
                                a = cheapestCage;
                        }
                        HashMap<String , OrderedBirdItem> birdList = (HashMap<String , OrderedBirdItem>) cart.getBirdList();
                        for (OrderedBirdItem ob : birdList.values()) {
                            if(ob.getBird().getBird_id().equals(bird_id)){
                                Accessory old = ob.getCage();
                                cart.setCartTotalPrice(cart.getCartTotalPrice()-(old.getUnit_price()- (old.getUnit_price() * old.getDiscount() / 100)));
                            }
                            if(ob.getBird().getBird_id().equals(bird_id)){
                                ob.setCage(a);
                                break;
                            }
                        }
                        cart.setBirdList(birdList);
                        cart.setCartTotalPrice(cart.getCartTotalPrice()+ (a.getUnit_price()- (a.getUnit_price() * a.getDiscount() / 100)));
                        session.setAttribute("CART", cart);
                        session.setAttribute("SUCCESS", "Đổi lồng thành công");
                    }
                    response.sendRedirect(DEST_NAV_CART);
                }
            }
            if (bird_id != null && cage_id == null) {
                Bird bird = birdDao.getBirdById(bird_id);
                List<Accessory> cageList = adao.getCageList();
                Accessory cheapestCage = cageList.get(0);
                int cheapestCagePrice = cheapestCage.getUnit_price() - cheapestCage.getUnit_price() * cheapestCage.getDiscount() / 100;
                for (Accessory cage : cageList) {
                    if ((cage.getUnit_price() - cage.getUnit_price() * cage.getDiscount() / 100) < cheapestCagePrice) {
                        cheapestCage = cage;
                    }
                }
                cheapestCage.setUnit_price(0);
                cheapestCage.setDiscount(0);
                if (session != null) {
                    CartDTO cart = (CartDTO) session.getAttribute("CART");
                    if (cart == null) {
                        cart = new CartDTO();
                    }
                    boolean checkAdd = cart.addBirdToCart(bird, cheapestCage);
                    if (checkAdd) {
                        out.println(1);
                        session.setAttribute("CART", cart);
                    } else {
                        out.println(0);
                    }
                    return;
                }
            }else{
                CartDTO cart = (CartDTO) session.getAttribute("CART");
                if(cart != null){
                     int amountItems = cart.getTotalItem();
                     out.println(amountItems);
                     return;
                }
            }
            
        } catch (Exception e) {
            log("Error at AddBirdToCartController: " + e.toString());
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
