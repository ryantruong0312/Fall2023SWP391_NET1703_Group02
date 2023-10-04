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

/**
 *
 * @author tlminh
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "/WEB-INF/errorpages/error.jsp";
    private static final String ACT_NAV_HOME = "NavToHome";
    private static final String DEST_NAV_HOME = "RenderHomeController";
    private static final String ACT_NAV_LOGIN = "NavToLogin";
    private static final String DEST_NAV_LOGIN = "/authentication/login.jsp";
    private static final String ACT_NAV_REGISTER = "NavToRegister";
    private static final String DEST_NAV_REGISTER = "/authentication/register.jsp";
    private static final String ACT_NAV_BIRD_COMPARE = "NavToCompare";
    private static final String DEST_NAV_BIRD_COMPARE = "RenderBirdCompareController";
    private static final String ACT_NAV_RESET = "NavToReset";
    private static final String DEST_NAV_RESET = "/authentication/reset.jsp";
    private static final String ACT_LOGIN = "login";
    private static final String DEST_LOGIN = "LoginController";
    private static final String ACT_REGISTER = "register";
    private static final String DEST_REGISTER = "RegisterController";
    private static final String ACT_LOGOUT = "Logout";
    private static final String DEST_LOGOUT = "LogoutController";
    private static final String ACT_NAV_ACCESSORY = "NavToAccessory";
    private static final String DEST_NAV_ACCESSORY = "RenderAccessoryController";
    private static final String ACT_NAV_ACCESSORY_DETAILS = "NavToAccessoryDetails";
    private static final String DEST_NAV_ACCESSORY_DETAILS = "RenderAccessoryDetailsController";
    private static final String ACT_NAV_BIRD_DETAILS = "NavToBirdDetails";
    private static final String DEST_NAV_BIRD_DETAILS = "RenderBirdDetailsController";
    private static final String ACT_NAV_BIRD = "NavToBird";
    private static final String DEST_NAV_BIRD = "RenderBirdController";
    private static final String ACT_REST_PASSWORD = "reset";
    private static final String DEST_REST_PASSWORD = "ResetPasswordController";
    private static final String ACT_ACTIVE = "active";
    private static final String DEST_ACTIVE = "ActiveController";
    private static final String ACT_NAV_CART = "NavToCart";
    private static final String DEST_NAV_CART = "RenderCartController";
    private static final String ACT_NAV_PROFILE = "NavToProfile";
    private static final String DEST_NAV_PROFILE = "RenderProfileController";
    private static final String ACT_NAV_EDIT_PROFILE = "NavToEditProfile";
    private static final String DEST_NAV_EDIT_PROFILE = "RenderProfileEditController";
    private static final String ACT_NAV_SHOP_ORDERS = "NavToShopOrders";
    private static final String DEST_NAV_SHOP_ORDERS = "RenderShopOrdersController";
    private static final String ACT_NAV_ACCOUNTS = "NavToAccounts";
    private static final String DEST_NAV_ACCOUNTS = "RenderAccountsController";
    private static final String ACT_NAV_REPORTS = "NavToReports";
    private static final String DEST_NAV_REPORTS = "RenderReportsController";
    private static final String ACT_NAV_BIRD_PAIR = "NavToPairBirds";
    private static final String DEST_NAV_BIRD_PAIR = "RenderBirdPairController";
    private static final String ACT_NAV_BIRD_NESTS = "NavToBirdNests";
    private static final String DEST_NAV_BIRD_NESTS = "RenderBirdNestController";
    private static final String ACT_NAV_BIRD_NESTS_DETAIL = "NavToBirdNestDetail";
    private static final String DEST_NAV_BIRD_NESTS_DETAIL = "RenderBirdNestDetalController";
    private static final String ACT_ADD_BIRD_TO_CART = "AddBirdToCart";
    private static final String DEST_ADD_BIRD_TO_CART = "AddBirdToCartController";
    private static final String ACT_ADD_ACCESSORY_TO_CART = "AddAccessoryToCart";
    private static final String DEST_ADD_ACCESSORY_TO_CART = "AddAccessoryToCartController";
    private static final String ACT_REMOVE_BIRD_FROM_CART = "RemoveBirdFromCart";
    private static final String DEST_REMOVE_BIRD_FROM_CART = "RemoveBirdFromCartController";
    private static final String ACT_REMOVE_ACCESSORY_FROM_CART = "RemoveAccessoryFromCart";
    private static final String DEST_REMOVE_ACCESSORY_FROM_CART = "RemoveAccessoryFromCartController";
    private static final String ACT_SEARCH_ACCESSORY = "RenderSearchAccessories";
    private static final String DEST_SEARCH_ACCESSORY = "RenderSearchAccessoriesController";
    private static final String ACT_CHECK_OUT = "CheckOut";
    private static final String DEST_CHECK_OUT = "RenderCheckOutController";
    private static final String ACT_SEARCH_BIRD = "SearchBird";
    private static final String DEST_SEARCH_BIRD = "SearchBirdController";
    private static final String ACT_RENDER_BIRD_BREED_ID = "RenderBirdByBreed_id";
    private static final String DEST_RENDER_BIRD_BREED_ID = "RenderBirdByBreed_idController";
    private static final String ACT_UPDATE_INFO = "UpdateInformation";
    private static final String DEST_UPDATE_INFO = "UpdateInformationController";
    private static final String ACT_CREATE_ACCOUNT = "CreateAccount";
    private static final String DEST_CREATE_ACCOUNT = "CreateAccountController";
    private static final String ACT_NAV_ADD_BIRD = "NavToAddBird";
    private static final String DEST_NAV_ADD_BIRD = "/management/bird/add-bird.jsp";
    private static final String ACT_ADD_BIRD = "AddNewBird";
    private static final String DEST_ADD_BIRD = "AddNewBirdController";
    private static final String TEST = "/shop/checkout.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            switch (action) {
                case ACT_NAV_HOME:
                    url = DEST_NAV_HOME;
                    break;
                case ACT_NAV_LOGIN:
                    url = DEST_NAV_LOGIN;
                    break;
                case ACT_NAV_REGISTER:
                    url = DEST_NAV_REGISTER;
                    break;
                case ACT_LOGIN:
                    url = DEST_LOGIN;
                    break;
                case ACT_REGISTER:
                    url = DEST_REGISTER;
                    break;
                case ACT_NAV_BIRD_COMPARE:
                    url = DEST_NAV_BIRD_COMPARE;
                    break;
                case ACT_LOGOUT:
                    url = DEST_LOGOUT;
                    break;
                case ACT_NAV_ACCESSORY:
                    url = DEST_NAV_ACCESSORY;
                    break;
                case ACT_NAV_BIRD:
                    url = DEST_NAV_BIRD;
                    break;
                case ACT_NAV_ACCESSORY_DETAILS:
                    url = DEST_NAV_ACCESSORY_DETAILS;
                    break;
                case ACT_NAV_RESET:
                    url = DEST_NAV_RESET;
                    break;
                case ACT_REST_PASSWORD:
                    url = DEST_REST_PASSWORD;
                    break;
                case ACT_ACTIVE:
                    url = DEST_ACTIVE;
                    break;
                case ACT_NAV_BIRD_DETAILS:
                    url = DEST_NAV_BIRD_DETAILS;
                    break;
                case ACT_NAV_CART:
                    url = DEST_NAV_CART;
                    break;
                case ACT_NAV_PROFILE:
                    url = DEST_NAV_PROFILE;
                    break;
                case ACT_NAV_SHOP_ORDERS:
                    url = DEST_NAV_SHOP_ORDERS;
                    break;
                case ACT_NAV_ACCOUNTS:
                    url = DEST_NAV_ACCOUNTS;
                    break;
                case ACT_NAV_REPORTS:
                    url = DEST_NAV_REPORTS;
                    break;
                case ACT_NAV_BIRD_PAIR:
                    url = DEST_NAV_BIRD_PAIR;
                    break;
                case ACT_NAV_BIRD_NESTS:
                    url = DEST_NAV_BIRD_NESTS;
                    break;
                case ACT_NAV_EDIT_PROFILE:
                    url = DEST_NAV_EDIT_PROFILE;
                    break;
                case ACT_ADD_BIRD_TO_CART:
                    url = DEST_ADD_BIRD_TO_CART;
                    break;
                case ACT_ADD_ACCESSORY_TO_CART:
                    url = DEST_ADD_ACCESSORY_TO_CART;
                    break;
                case ACT_CHECK_OUT:
                    url = DEST_CHECK_OUT;
                    break;
                case ACT_NAV_BIRD_NESTS_DETAIL:
                    url = DEST_NAV_BIRD_NESTS_DETAIL;
                    break;
                case ACT_SEARCH_ACCESSORY:
                    url = DEST_SEARCH_ACCESSORY;
                    break;
                case ACT_SEARCH_BIRD:
                    url = DEST_SEARCH_BIRD;
                    break;
                case ACT_RENDER_BIRD_BREED_ID:
                    url = DEST_RENDER_BIRD_BREED_ID;
                    break;
                case ACT_UPDATE_INFO:
                    url = DEST_UPDATE_INFO;
                    break;
                case ACT_CREATE_ACCOUNT:
                    url = DEST_CREATE_ACCOUNT;
                    break;
                case ACT_REMOVE_ACCESSORY_FROM_CART:
                    url = DEST_REMOVE_ACCESSORY_FROM_CART;
                    break;
                case ACT_REMOVE_BIRD_FROM_CART:
                    url = DEST_REMOVE_BIRD_FROM_CART;
                    break;
                case ACT_NAV_ADD_BIRD:
                    url = DEST_NAV_ADD_BIRD;
                    break;
                case ACT_ADD_BIRD:
                    url = DEST_ADD_BIRD;
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            log("Error at MainController: " + ex.toString());
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
