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
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import swp391.birdfarmshop.dto.CartDTO;
import swp391.birdfarmshop.model.User;

/**
 *
 * @author tlminh
 */
@WebServlet(name = "OnlinePaymentController", urlPatterns = {"/OnlinePaymentController"})
public class OnlinePaymentController extends HttpServlet {

    private static final String VNP_SECRET_KEY = "FZHSMOLLELQBQCZDCQWEANKTEEITDIIL";
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
            ArrayList<String> listInfo = new ArrayList<>();
            listInfo.add(name_receiver);
            listInfo.add(phone_receiver);
            listInfo.add(address_receiver);
            session.setAttribute("INFOORRDER", listInfo);
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            // Calculate the createDateTime and expireDateTime in the format yymmddhhmmss
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
            String createDateTime = now.format(formatter);
            String expireDateTime = now.plusMinutes(5).format(formatter);

            String vnp_IpAddr = getIpAddress(request);
            // Retrieve the client's IP address from the request context
            String order = generateOrderId();
            // Create a map containing the payment data as query parameters
            Map<String, String> vnpParams = new HashMap<>();
            vnpParams.put("vnp_Amount", String.valueOf(cart.getCartTotalPrice() * 100));
            vnpParams.put("vnp_Command", "pay");
            vnpParams.put("vnp_IpAddr", vnp_IpAddr);
            vnpParams.put("vnp_CreateDate", createDateTime);
            vnpParams.put("vnp_ExpireDate", expireDateTime);
            vnpParams.put("vnp_CurrCode", "VND");
            vnpParams.put("vnp_Locale", "vn");
            vnpParams.put("vnp_OrderInfo", "Thanhtoán");
            vnpParams.put("vnp_OrderType", "other");
            vnpParams.put("vnp_ReturnUrl", "http://localhost:8080/birdfarmshop/MainController?action=NavToAddOrder");
            vnpParams.put("vnp_TmnCode", "VSQ6NENZ");
            vnpParams.put("vnp_TxnRef", order);
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
            String queryUrl = query.toString();
            // Generate the secure hash
            String secureHash = hmacSHA512(VNP_SECRET_KEY, hashData.toString());
            // Include the secure hash in the payment data
            queryUrl += "&vnp_SecureHash=" + secureHash;
            String paymentUrl = VNPAY_PAYMENT_URL + "?" + queryUrl;
            // Construct the final payment URL
            url = paymentUrl;
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

    public static String hmacSHA512(final String key, final String data) {
        try {

            if (key == null || data == null) {
                throw new NullPointerException();
            }
            final Mac hmac512 = Mac.getInstance("HmacSHA512");
            byte[] hmacKeyBytes = key.getBytes();
            final SecretKeySpec secretKey = new SecretKeySpec(hmacKeyBytes, "HmacSHA512");
            hmac512.init(secretKey);
            byte[] dataBytes = data.getBytes(StandardCharsets.UTF_8);
            byte[] result = hmac512.doFinal(dataBytes);
            StringBuilder sb = new StringBuilder(2 * result.length);
            for (byte b : result) {
                sb.append(String.format("%02x", b & 0xff));
            }
            return sb.toString();

        } catch (Exception ex) {
            return "";
        }
    }
    private String generateOrderId() {
        // Generate a unique orderId
        String order_id_prefix = "VNP" + System.currentTimeMillis();
        return order_id_prefix;
    }
      public static String getIpAddress(HttpServletRequest request) {
        String ipAdress;
        try {
            ipAdress = request.getHeader("X-FORWARDED-FOR");
            if (ipAdress == null) {
                ipAdress = request.getRemoteAddr();
            }
        } catch (Exception e) {
            ipAdress = "Invalid IP:" + e.getMessage();
        }
        return ipAdress;
    }
}
