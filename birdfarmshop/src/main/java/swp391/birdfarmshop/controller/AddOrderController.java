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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import swp391.birdfarmshop.dao.OrderDAO;
import swp391.birdfarmshop.dao.OrderItemDAO;
import swp391.birdfarmshop.dto.CartDTO;
import swp391.birdfarmshop.model.Accessory;
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.model.Order;
import swp391.birdfarmshop.model.OrderedAccessoryItem;
import swp391.birdfarmshop.model.OrderedBirdItem;
import swp391.birdfarmshop.model.User;
import swp391.birdfarmshop.services.EmailService;
import swp391.birdfarmshop.util.EmailUtils;

/**
 *
 * @author Admin
 */
@WebServlet(name="AddOrderController", urlPatterns={"/AddOrderController"})
public class AddOrderController extends HttpServlet {
    private static final String DEST_NAV_HOME = "RenderHomeController";
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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("LOGIN_USER");
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            if(u != null){
                if (cart != null) {
                    String name_receiver = request.getParameter("name");
                    String phone_receiver = request.getParameter("mobile");
                    String address_receiver = request.getParameter("address");
                    LocalDate currentDate = LocalDate.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
                    String formattedDate = currentDate.format(formatter);
                    OrderDAO od = new OrderDAO();
                    OrderItemDAO oid = new OrderItemDAO();
                    Order o = od.getOrderLatest();
                    if (o != null) {
                        String numberSTT = o.getOrder_id().substring(9);
                        int numberLast = Integer.parseInt(numberSTT);
                        numberLast += 1;
                        String number = String.format("%06d", numberLast);
                        String order_id = formattedDate + 'O' + number;
                        int result = od.createNewOrder(order_id, u.getUsername(), "Chờ xử lý", name_receiver,
                                phone_receiver, address_receiver, "Chưa thanh toán", cart.getCartTotalPrice(), (int) Math.ceil(cart.getCartTotalPrice()/100000.0));
                        if (result != 0){
                         Map<String, OrderedBirdItem> birdList =  cart.getBirdList();
                         if(birdList != null){
                             for (OrderedBirdItem ob : birdList.values()) {
                                 Bird b = ob.getBird();
                                 if(b != null){
                                     int realPriceBird = b.getPrice();
                                     if(b.getDiscount() > 0){
                                        realPriceBird = (b.getPrice()) - (b.getPrice() * b.getDiscount() / 100); 
                                     } 
                                     out.print("dsadsadsa15 "+b.getBird_id() );
                                     int resultBird = oid.createNewOrderItem(order_id, b.getBird_id(), null, null, realPriceBird, 1);
                                     if(resultBird == 0 ){
                                         session.setAttribute("ERROR", "Đặt hàng thất bại");
                                         return;
                                     }
                                  
                                 }
                                 Accessory a = ob.getCage();
                                 if(a != null){
                                     int realPriceAccessory = a.getUnit_price();
                                     if(a.getDiscount() > 0){
                                        realPriceAccessory = (a.getUnit_price() - a.getUnit_price() * a.getDiscount()/ 100); 
                                     }
                                     int resultAccessory = oid.createNewOrderItem(order_id, null,null, a.getAccessory_id(), realPriceAccessory, 1);
                                     if(resultAccessory == 0){
                                         session.setAttribute("ERROR", "Đặt hàng thất bại");
                                         return;
                                     }
                                 }  
                             }
                         }
                        }else{
                           session.setAttribute("ERROR", "Đặt hàng thất bại");
                        }
                        Map<String, OrderedAccessoryItem> accessoryList = cart.getAccessoryList();
                        for (OrderedAccessoryItem oa : accessoryList.values()) {
                            Accessory a = oa.getAccessory();
                            if (a != null) {
                                int realPriceAccessory = a.getUnit_price();
                                if (a.getDiscount() > 0) {  
                                    realPriceAccessory = (a.getUnit_price()) - (a.getUnit_price() * a.getDiscount() / 100);
                                }
                                int resultAccessory = oid.createNewOrderItem(order_id, null, null, a.getAccessory_id(), realPriceAccessory, 1);
                                if (resultAccessory == 0) {
                                    session.setAttribute("ERROR", "Đặt hàng thất bại");
                                    return;
                                }
                            }
                        }
                         EmailService.sendEmail(u.getEmail(), "Đơn đặt hàng của bạn", 
                         EmailUtils.sendOrderToCustomer(cart, order_id, name_receiver, phone_receiver, address_receiver));
                      }                
                    cart = null;
                    session.setAttribute("CART", cart);
                    session.setAttribute("SUCCESS", "Đặt hàng thành công");
//                    } else {
//                        String number = String.format("%06d", 1);
//                        String order_id = formattedDate + 'O' + number;
//                        int result = od.createNewOrder(order_id, u.getUsername(), "Chờ xử lý", name_receiver,
//                                phone_receiver, address_receiver, formattedDate, cart.getCartTotalPrice(), (int) Math.ceil(cart.getCartTotalPrice()/100000.0));
//                        if (result != 0){
//                            
//                        }else{
//                           session.setAttribute("ERROR", "Đặt hàng thất bại");
//                        }
//                    }
                }else{
                    session.setAttribute("ERROR", "Không có sản phẩm nào trong giỏ hàng của bạn");
                }
            }else{
                session.setAttribute("ERROR", "Bạn chưa đăng nhập");
            }
             request.getRequestDispatcher(DEST_NAV_HOME).forward(request, response);
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