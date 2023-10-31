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
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import swp391.birdfarmshop.dao.OrderDAO;
import swp391.birdfarmshop.dto.CartDTO;
import swp391.birdfarmshop.model.User;

/**
 *
 * @author tlminh
 */
@WebServlet(name = "OnlinePaymentController", urlPatterns = {"/OnlinePaymentController"})
public class OnlinePaymentController extends HttpServlet {

    private static final String VNP_SECRET_KEY = "QDCVHACBEJZKLNFUWTWGCWIYJKGNLDBG";
    private static final String VNPAY_PAYMENT_URL = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    private static final String ERROR = "RenderCheckoutController";

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
        String url = ERROR;
        try {
            // Extract required input from the requestParameters
            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("LOGIN_USER");
            String name_receiver = request.getParameter("name");
            String phone_receiver = request.getParameter("mobile");
            String address_receiver = request.getParameter("address");
            CartDTO cart = (CartDTO) session.getAttribute("CART");

            // Generate a unique orderId
            String order_id = generateOrderId();

            // Calculate the createDateTime and expireDateTime in the format yymmddhhmmss
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
            String createDateTime = now.format(formatter);
            String expireDateTime = now.plusMinutes(15).format(formatter);

            // Retrieve the client's IP address from the request context
            String clientIp = request.getRemoteAddr();

            // Create a map containing the payment data as query parameters
            Map<String, String> vnpParams = new HashMap<>();
            vnpParams.put("vnp_Amount", String.valueOf(cart.getCartTotalPrice() * 100));
            vnpParams.put("vnp_Command", "pay");
            vnpParams.put("vnp_CreateDate", createDateTime);
            vnpParams.put("vnp_ExpireDate", expireDateTime);
            vnpParams.put("vnp_CurrCode", "VND");
            vnpParams.put("vnp_IpAddr", clientIp);
            vnpParams.put("vnp_Locale", "vn");
            vnpParams.put("vnp_OrderInfo", "Thanhtoán");
            vnpParams.put("vnp_OrderType", "other");
            vnpParams.put("vnp_ReturnUrl", "http://localhost:8080");
            vnpParams.put("vnp_TmnCode", "N6DA850E");
            vnpParams.put("vnp_TxnRef", order_id);
            vnpParams.put("vnp_Version", "2.1.0");

            // Sort the parameters alphabetically by parameter name
            List<String> fieldNames = new ArrayList<>(vnpParams.keySet());
            Collections.sort(fieldNames);

            StringBuilder hashData = new StringBuilder();
            StringBuilder query = new StringBuilder();
            Iterator<String> itr = fieldNames.iterator();
            while (itr.hasNext()) {
                String fieldName = itr.next();
                String fieldValue = vnpParams.get(fieldName);
                if (fieldValue != null && !fieldValue.isEmpty()) {
                    // Build hash data
                    hashData.append(fieldName);
                    hashData.append('=');
                    hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

                    // Build query
                    query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                    query.append('=');
                    query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

                    if (itr.hasNext()) {
                        query.append('&');
                        hashData.append('&');
                    }
                }
            }

            // Generate the secure hash
            String secureHash = generateSecureHash(hashData.toString(), VNP_SECRET_KEY);

            // Include the secure hash in the payment data
            query.append("&vnp_SecureHash=").append(secureHash);

            // Construct the final payment URL
            String finalPaymentUrl = VNPAY_PAYMENT_URL + "?" + query;

            OrderDAO odao = new OrderDAO();
            try {
                odao.createOrder(order_id, u.getUsername(), "Chờ xử lý", name_receiver, phone_receiver, address_receiver, "Chưa thanh toán", "Chuyển khoản", cart, 0);
            } catch (SQLException ex) {
                Logger.getLogger(OnlinePaymentController.class.getName()).log(Level.SEVERE, null, ex);
            }
            url = finalPaymentUrl;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            response.sendRedirect(url);
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

    private String generateOrderId() {
        // Generate a unique orderId
        String order_id_prefix = "VNP" + System.currentTimeMillis();
        return order_id_prefix;
    }

    private String generateSecureHash(String data, String secretKey) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-512");
            byte[] encodedHash = digest.digest((data + secretKey).getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder(2 * encodedHash.length);
            for (byte encodedHashByte : encodedHash) {
                hexString.append(String.format("%02X", encodedHashByte));
            }
            return hexString.toString().toLowerCase(); // Convert the hash to lowercase
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
