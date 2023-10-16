/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import swp391.birdfarmshop.dto.CartDTO;
import swp391.birdfarmshop.model.Accessory;
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.model.BirdCustomer;
import swp391.birdfarmshop.model.Order;
import swp391.birdfarmshop.model.OrderItem;
import swp391.birdfarmshop.model.OrderedAccessoryItem;
import swp391.birdfarmshop.model.OrderedBirdItem;
import swp391.birdfarmshop.model.OrderedBirdPairItem;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author tlminh
 */
public class OrderDAO {

    public String error = null;

    public int createNewOrder(String order_id, String username, String status, String name_receiver, String phone_receiver,
            String address_receiver, String payment_status, CartDTO cart, CartDTO cartCheckout, int point) {
        int result = 0;
        Connection con = null;
        OrderItemDAO oid = new OrderItemDAO();
        AccessoryDAO ad = new AccessoryDAO();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                con.setAutoCommit(false);
                String insertOrder = "INSERT INTO [ORDER]\n"
                        + "VALUES(?,?,?,?,?,?,?,?,?,?)";
                pst = con.prepareStatement(insertOrder);
                pst.setString(1, order_id);
                pst.setString(2, username);
                LocalDateTime customDateTime = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
                String sqlDate = customDateTime.format(formatter);
                pst.setString(3, sqlDate);
                pst.setString(4, status);
                pst.setString(5, name_receiver);
                pst.setString(6, phone_receiver);
                pst.setString(7, address_receiver);
                pst.setString(8, payment_status);
                pst.setInt(9, cart.getCartTotalPrice());
                pst.setInt(10, point);
                result = pst.executeUpdate();
                boolean checkBird = false;
                boolean checkAcessory = false;
                boolean checkBirdPair = false;
                if (result > 0) {
                    checkBird = true;
                    checkAcessory = true;
                    checkBirdPair = true;
                    HashMap<String, OrderedBirdItem> birdList = (HashMap<String, OrderedBirdItem>) cart.getBirdList();
                    for (OrderedBirdItem ob : birdList.values()) {
                        Bird b = ob.getBird();
                        int realPrice = b.getPrice();
                        if (b.getDiscount() > 0) {
                            realPrice = b.getPrice() - b.getPrice() * b.getDiscount() / 100;
                        }
                        String checkOrderBird = "SELECT [order_item_id]\n"
                                + "      ,[order_id]\n"
                                + "      ,[bird_id]\n"
                                + "      ,[nest_id]\n"
                                + "      ,[accessory_id]\n"
                                + "      ,[unit_price]\n"
                                + "      ,[order_quantity]\n"
                                + "  FROM [BirdFarmShop].[dbo].[OrderItem]\n"
                                + "  WHERE [bird_id] = ?";
                        pst = con.prepareStatement(checkOrderBird);
                        pst.setString(1, b.getBird_id());
                        rs = pst.executeQuery();
                        if (rs != null && rs.next()) {
                            checkBird = false;
                            error = "Sản phẩm này đã bán";
                            break;
                        } else {
                            String updateBird = "UPDATE [Bird]\n"
                                    + "SET [status] = 'Đã bán'\n"
                                    + "WHERE [bird_id] = ?";
                            pst = con.prepareStatement(updateBird);
                            pst.setString(1, b.getBird_id());
                            result = pst.executeUpdate();
                            if (result == 0) {
                                checkBird = false;
                                break;
                            } else {
                                String insertBird = "INSERT INTO [OrderItem]([order_id],[bird_id],\n"
                                        + "		  [unit_price],[order_quantity])\n"
                                        + "   VALUES(?,?,?,?)";
                                pst = con.prepareStatement(insertBird);
                                pst.setString(1, order_id);
                                pst.setString(2, b.getBird_id());
                                pst.setInt(3, realPrice);
                                pst.setInt(4, 1);
                                result = pst.executeUpdate();
                                if (result == 0) {
                                    checkBird = false;
                                    break;
                                }
                            }
                        }
                    }
                    HashMap<String, OrderedAccessoryItem> accessoryList = (HashMap<String, OrderedAccessoryItem>) cartCheckout.getAccessoryList();
                    for (OrderedAccessoryItem oa : accessoryList.values()) {
                        Accessory a = oa.getAccessory();
                        int realPrice = a.getUnit_price();
                        if (a.getDiscount() > 0) {
                            realPrice = a.getUnit_price() - a.getUnit_price() * a.getDiscount() / 100;
                        }
                        String getStockAccessory = "SELECT [stock_quantity]\n"
                                + "FROM [BirdFarmShop].[dbo].[Accessory]\n"
                                + "WHERE [accessory_id] = ?";
                        pst = con.prepareStatement(getStockAccessory);
                        pst.setString(1, a.getAccessory_id().substring(0, 5));
                        rs = pst.executeQuery();
                        if (rs != null && rs.next()) {
                            int numberAccessory = rs.getInt("stock_quantity");
                            if (numberAccessory == 0) {
                                error = "Sản phẩm này đã hết hàng";
                                checkAcessory = false;
                                break;
                            } else if (numberAccessory < oa.getOrder_quantity()) {
                                checkAcessory = false;
                                error = "Sản phẩm này không đủ số lượng trong kho";
                                break;
                            } else {
                                int newStock = numberAccessory - oa.getOrder_quantity();
                                String updateQuantity = "UPDATE [Accessory]\n"
                                        + "SET [stock_quantity] = ?\n"
                                        + "WHERE [accessory_id] = ?";
                                pst = con.prepareStatement(updateQuantity);
                                pst.setInt(1, newStock);
                                pst.setString(2, a.getAccessory_id().substring(0, 5));
                                result = pst.executeUpdate();
                                if (result == 0) {
                                    checkAcessory = false;
                                    break;
                                } else {
                                    String insertAccessory = "INSERT INTO [OrderItem]([order_id],\n"
                                            + "		  [accessory_id],[unit_price],[order_quantity])\n"
                                            + "               VALUES(?,?,?,?)";
                                    pst = con.prepareStatement(insertAccessory);
                                    pst.setString(1, order_id);
                                    pst.setString(2, a.getAccessory_id().substring(0, 5));
                                    pst.setInt(3, realPrice);
                                    pst.setInt(4, oa.getOrder_quantity());
                                    result = pst.executeUpdate();
                                    if (result == 0) {
                                        checkAcessory = false;
                                    }
                                }
                            }
                        } else {
                            error = "Không tìm thấy sản phẩm";
                            checkAcessory = false;
                            break;
                        }
                    }
                    HashMap<String, OrderedBirdPairItem> birdPairList = (HashMap<String, OrderedBirdPairItem>) cart.getBirdPairList();
                    if (birdPairList != null) {
                        for (OrderedBirdPairItem opi : birdPairList.values()) {
                            Bird male = opi.getBirdMale();
                            Bird female = opi.getBirdFemale();
                            BirdCustomer customer = opi.getBirdCustomer();
                            Bird birdShop = opi.getBirdShop();
                            if (customer != null && birdShop != null) {
                                String checkBirdShop = "SELECT *\n"
                                        + "FROM [BirdFarmShop].[dbo].[Bird]\n"
                                        + "WHERE [bird_id] = ? AND [status] = N'Còn hàng'";
                                pst = con.prepareStatement(checkBirdShop);
                                pst.setString(1, birdShop.getBird_id());
                                rs = pst.executeQuery();
                                if (rs != null && rs.next()) {
                                    String checkBirdCustomer = "SELECT *\n"
                                            + "FROM [BirdFarmShop].[dbo].[CustomerBird]\n"
                                            + "WHERE [bird_id] = ? AND [status] = N'Chưa ghép cặp'";
                                    pst = con.prepareStatement(checkBirdCustomer);
                                    pst.setInt(1, customer.getBird_id());
                                    rs = pst.executeQuery();
                                    if (rs != null && rs.next()) {
                                        if (customer.isGender()) {
                                            String insertBirdPair = "INSERT INTO [BirdPair]([order_id],[bird_customer],[female_bird_id])\n"
                                                    + "VALUES(?,?,?)";
                                            pst = con.prepareStatement(insertBirdPair);
                                            pst.setString(1, order_id);
                                            pst.setInt(2, customer.getBird_id());
                                            pst.setString(3, birdShop.getBird_id());
                                            result = pst.executeUpdate();
                                            if (result == 0) {
                                                checkBirdPair = false;
                                                error = "Sản phẩm này không thể ghép cặp";
                                            } else {
                                                String updateBirdCustomer = "UPDATE [CustomerBird]\n"
                                                        + "SET [status] = N'Đang ghép cặp'\n"
                                                        + "WHERE bird_id = ?";
                                                pst = con.prepareStatement(updateBirdCustomer);
                                                pst.setInt(1, customer.getBird_id());
                                                result = pst.executeUpdate();
                                                if (result == 0) {
                                                    checkBirdPair = false;
                                                }
                                                String updateBirdShop = "UPDATE [Bird]\n"
                                                        + "SET [status] = N'Đang sinh sản'\n"
                                                        + "WHERE bird_id = ?";
                                                pst = con.prepareStatement(updateBirdShop);
                                                pst.setString(1, birdShop.getBird_id());
                                                result = pst.executeUpdate();
                                                if (result == 0) {
                                                    checkBirdPair = false;
                                                }
                                            }
                                        } else {
                                            String insertBirdPair = "INSERT INTO [BirdPair]([order_id],[bird_customer],[male_bird_id])\n"
                                                    + "VALUES(?,?,?)";
                                            pst = con.prepareStatement(insertBirdPair);
                                            pst.setString(1, order_id);
                                            pst.setInt(2, customer.getBird_id());
                                            pst.setString(3, birdShop.getBird_id());
                                            result = pst.executeUpdate();
                                            if (result == 0) {
                                                checkBirdPair = false;
                                                error = "Sản phẩm này không thể ghép cặp";
                                            } else {
                                                String updateBirdCustomer = "UPDATE [CustomerBird]\n"
                                                        + "SET [status] = N'Đang ghép cặp'\n"
                                                        + "WHERE bird_id = ?";
                                                pst = con.prepareStatement(updateBirdCustomer);
                                                pst.setInt(1, customer.getBird_id());
                                                result = pst.executeUpdate();
                                                if (result == 0) {
                                                    checkBirdPair = false;
                                                }
                                                String updateBirdShop = "UPDATE [Bird]\n"
                                                        + "SET [status] = N'Đang sinh sản'\n"
                                                        + "WHERE bird_id = ?";
                                                pst = con.prepareStatement(updateBirdShop);
                                                pst.setString(1, birdShop.getBird_id());
                                                result = pst.executeUpdate();
                                                if (result == 0) {
                                                    checkBirdPair = false;
                                                }
                                                
                                                String selectBirdPair = "SELECT TOP 1 [pair_id]\n" +
                                                                        "FROM [BirdFarmShop].[dbo].[BirdPair]\n" +
                                                                        "WHERE [order_id] = ?";
                                                pst = con.prepareStatement(selectBirdPair);
                                                pst.setString(1, order_id);
                                                rs = pst.executeQuery();
                                                if(rs != null && rs.next()){
                                                    int pair_id = rs.getInt("pair_id");
                                                    String insertTracking = "INSERT INTO [PairTracking]([pair_id],[status],[content],[date_content])\n"
                                                            + "VALUES(?,?,?,?)";
                                                    pst = con.prepareStatement(insertTracking);
                                                    pst.setInt(1, pair_id);
                                                    pst.setString(2, "Chờ lấy chim");
                                                    pst.setString(3, "Chờ khách hàng giao chim để ghép cặp");
                                                    pst.setString(4, sqlDate);
                                                    result = pst.executeUpdate();
                                                    if (result == 0) {
                                                        checkBirdPair = false;
                                                        break;
                                                    }
                                                    String insertBirdPairOrderItem = "INSERT INTO [OrderItem]([order_id],[pair_id],\n"
                                                            + "		  [unit_price],[order_quantity])\n"
                                                            + "   VALUES(?,?,?,?)";
                                                    pst = con.prepareStatement(insertBirdPairOrderItem);
                                                    pst.setString(1, order_id);
                                                    pst.setInt(2, pair_id);
                                                    pst.setInt(3, 2000000);
                                                    pst.setInt(4, 1);
                                                    result = pst.executeUpdate();
                                                    if (result == 0) {
                                                        checkBirdPair = false;
                                                        break;
                                                    }
                                                }else{
                                                    checkBirdPair = false;                                                   
                                                    break;
                                                }
                                                
                                            }
                                        }
                                    } else {
                                        checkBirdPair = false;
                                        break;
                                    }
                                } else {
                                    checkBirdPair = false;
                                    break;
                                }
                            }
                            if (male != null && female != null) {
                                String checkBirdMale = "SELECT *\n"
                                        + "FROM [BirdFarmShop].[dbo].[Bird]\n"
                                        + "WHERE [bird_id] = ? AND [status] = N'Còn hàng'";
                                pst = con.prepareStatement(checkBirdMale);
                                pst.setString(1, male.getBird_id());
                                rs = pst.executeQuery();
                                if (rs != null && rs.next()) {
                                    String checkBirdFemale = "SELECT *\n"
                                            + "FROM [BirdFarmShop].[dbo].[Bird]\n"
                                            + "WHERE [bird_id] = ? AND [status] = N'Còn hàng'";
                                    pst = con.prepareStatement(checkBirdFemale);
                                    pst.setString(1, female.getBird_id());
                                    rs = pst.executeQuery();
                                    if (rs != null && rs.next()) {
                                        String insertBirdPair = "INSERT INTO [BirdPair]([order_id],[male_bird_id],[female_bird_id])\n"
                                                + "VALUES(?,?,?)";
                                        pst = con.prepareStatement(insertBirdPair);
                                        pst.setString(1, order_id);
                                        pst.setString(2, male.getBird_id());
                                        pst.setString(3, female.getBird_id());
                                        result = pst.executeUpdate();
                                        if (result == 0) {
                                            checkBirdPair = false;
                                            error = "Sản phẩm này không thể ghép cặp";
                                        } else {
                                            String updateBirdMale = "UPDATE [Bird]\n"
                                                    + "SET [status] = N'Đang sinh sản'\n"
                                                    + "WHERE bird_id = ?";
                                            pst = con.prepareStatement(updateBirdMale);
                                            pst.setString(1, male.getBird_id());
                                            result = pst.executeUpdate();
                                            if (result == 0) {
                                                checkBirdPair = false;
                                                error = "Sản phẩm này không thể ghép cặp";
                                            }
                                            String updateBirdFemale = "UPDATE [Bird]\n"
                                                    + "SET [status] = N'Đang sinh sản'\n"
                                                    + "WHERE bird_id = ?";
                                            pst = con.prepareStatement(updateBirdFemale);
                                            pst.setString(1, female.getBird_id());
                                            result = pst.executeUpdate();
                                            if (result == 0) {
                                                checkBirdPair = false;
                                                error = "Sản phẩm này không thể ghép cặp";
                                            }
                                            String selectBirdPair = "SELECT TOP 1 [pair_id]\n"
                                                    + "FROM [BirdFarmShop].[dbo].[BirdPair]\n"
                                                    + "WHERE [order_id] = ?";
                                            pst = con.prepareStatement(selectBirdPair);
                                            pst.setString(1, order_id);
                                            rs = pst.executeQuery();
                                            if (rs != null && rs.next()) {                                           
                                                int pair_id = rs.getInt("pair_id");
                                                String insertTracking = "INSERT INTO [PairTracking]([pair_id],[status],[content],[date_content])\n"
                                                        + "VALUES(?,?,?,?)";
                                                pst = con.prepareStatement(insertTracking);
                                                pst.setInt(1, pair_id);
                                                pst.setString (2, "Chờ lấy chim");
                                                pst.setString(3, "Đang chuẩn bị chim để ghép cặp");
                                                pst.setString(4, sqlDate);
                                                result = pst.executeUpdate();
                                                if (result == 0) {
                                                    checkBirdPair = false;
                                                    break;
                                                }
                                                String insertBirdPairOrderItem = "INSERT INTO [OrderItem]([order_id],[pair_id],\n"
                                                        + "		  [unit_price],[order_quantity])\n"
                                                        + "   VALUES(?,?,?,?)";
                                                pst = con.prepareStatement(insertBirdPairOrderItem);
                                                pst.setString(1, order_id);
                                                pst.setInt(2, pair_id);
                                                pst.setInt(3, 2000000);
                                                pst.setInt(4, 1);
                                                result = pst.executeUpdate();
                                                if (result == 0) {
                                                    checkBirdPair = false;
                                                    break;
                                                }
                                            } else {
                                                checkBirdPair = false;
                                                break;
                                            }
                                        }
                                    } else {
                                        checkBirdPair = false;
                                        error = "Sản phẩm này không thể ghép cặp";
                                        break;
                                    }
                                } else {

                                    checkBirdPair = false;
                                    error = "Sản phẩm này không thể ghép cặp";
                                    break;

                                }
                            }
                        }
                    }
                }
                if (checkBird && checkAcessory && checkBirdPair) {
                    result = 1;
                    con.commit();
                } else {
                    result = 0;
                    con.rollback();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                con.rollback();
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (pst != null) {
                try {
                    pst.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }

    public Order getOrderLatest() {
        Order o = null;
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT TOP 1 [order_id]\n"
                        + "      ,[customer]\n"
                        + "      ,[order_date]\n"
                        + "      ,[order_status]\n"
                        + "      ,[name_receiver]\n"
                        + "      ,[phone_receiver]\n"
                        + "      ,[address_receiver]\n"
                        + "      ,[payment_status]\n"
                        + "      ,[total_price]\n"
                        + "      ,[applied_point]\n"
                        + "  FROM [BirdFarmShop].[dbo].[Order]\n"
                        + "  ORDER BY order_date DESC";
                st = con.createStatement();
                rs = st.executeQuery(sql);
                if (rs != null && rs.next()) {
                    String order_id = rs.getString("order_id");
                    String customer = rs.getString("customer");
                    Date order_date = rs.getDate("order_date");
                    String order_status = rs.getString("order_status");
                    String name_receiver = rs.getString("name_receiver");
                    int phone_receiver = rs.getInt("phone_receiver");
                    String address_receiver = rs.getString("address_receiver");
                    String payment_status = rs.getString("payment_status");
                    int total_price = rs.getInt("total_price");
                    int point = rs.getInt("applied_point");
                    o = new Order(order_id, customer, order_date, order_status, name_receiver, phone_receiver, address_receiver, payment_status, total_price, point);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (st != null) {
                try {
                    st.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return o;
    }

    public OrderItem getOrderByBirdId(String bird_id) {
        OrderItem oi = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT [order_item_id]\n"
                        + "      ,[order_id]\n"
                        + "      ,[bird_id]\n"
                        + "      ,[nest_id]\n"
                        + "      ,[accessory_id]\n"
                        + "      ,[unit_price]\n"
                        + "      ,[order_quantity]\n"
                        + "  FROM [BirdFarmShop].[dbo].[OrderItem]\n"
                        + "  WHERE [bird_id] = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, bird_id);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int order_item_id = rs.getInt("order_item_id");
                    String order_id = rs.getString("order_id");
                    String nest_id = rs.getString("nest_id");
                    String accessory_id = rs.getString("accessory_id");
                    int unit_price = rs.getInt("unit_price");
                    int order_quantity = rs.getInt("order_quantity");
                    oi = new OrderItem(order_item_id, order_id, bird_id, nest_id, accessory_id, unit_price, order_quantity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (pst != null) {
                try {
                    pst.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return oi;
    }

    public ArrayList<Order> getAllOfOrder(String date, String startDay, String endDay,
            String status, String search, String page, int recordsPerPage) throws SQLException {
        ArrayList<Order> orderList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Order order;
        LocalDate today = LocalDate.now();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String query = "SELECT [order_id],[customer],[order_date],[order_status],[name_receiver],\n"
                        + "[phone_receiver],[address_receiver],[payment_status],[total_price],[applied_point]\n"
                        + "FROM [BirdFarmShop].[dbo].[Order] WHERE 1 = 1 ";
                if (date != null) {
                    switch (date) {
                        case "today":
                            query += "AND [order_date] = '" + today + "'";
                            break;
                        case "yesterday":
                            LocalDate yesterday = today.minus(1, ChronoUnit.DAYS);
                            query += "AND [order_date] = '" + yesterday + "'";
                            break;
                        case "thisWeek":
                            LocalDate firstDayOfWeek = today.minusDays(today.getDayOfWeek().getValue() - DayOfWeek.MONDAY.getValue());
                            LocalDate lastDayOfWeek = firstDayOfWeek.plusDays(6);
                            query += "AND ([order_date] >= '" + firstDayOfWeek + "' AND [order_date] <= '" + lastDayOfWeek + "')";
                            break;
                        case "thisMonth":
                            LocalDate firstDayOfMonth = LocalDate.of(today.getYear(), today.getMonth(), 1);
                            LocalDate lastDayOfMonth = YearMonth.from(today).atEndOfMonth();
                            query += "AND ([order_date] >= '" + firstDayOfMonth + "' AND [order_date] <= '" + lastDayOfMonth + "')";
                            break;
                        case "thisYear":
                            LocalDate firstDayOfYear = LocalDate.of(today.getYear(), 1, 1);
                            LocalDate lastDayOfYear = LocalDate.of(today.getYear(), 12, 31);
                            query += "AND ([order_date] >= '" + firstDayOfYear + "' AND [order_date] <= '" + lastDayOfYear + "')";
                            break;
                    }
                }
                if (startDay != null && endDay != null) {
                    if (!startDay.isEmpty() && !endDay.isEmpty()) {
                        query += "AND ([order_date] >= '" + startDay + "' AND [order_date] <= '" + endDay + "')";
                    } else {
                        if (!startDay.isEmpty()) {
                            query += "AND ([order_date] >= '" + startDay + "')";
                        }
                        if (!endDay.isEmpty()) {
                            query += "AND ([order_date] <= '" + endDay + "')";
                        }
                    }
                }
                if (status != null && !status.isEmpty()) {
                    switch (status) {
                        case "wait":
                            query += "AND [order_status] = N'Chờ xử lý'";
                            break;
                        case "inProgress":
                            query += "AND [order_status] = N'Đang xử lý'";
                            break;
                        case "delivering":
                            query += "AND [order_status] = N'Đang vận chuyển'";
                            break;
                        case "delivered":
                            query += "AND [order_status] = N'Đã giao hàng'";
                            break;
                        case "notRated":
                            query += "AND [order_status] = N'Chưa đánh giá'";
                            break;
                        case "rated":
                            query += "AND [order_status] = N'Đã đánh giá'";
                            break;
                        case "cancel":
                            query += "AND [order_status] = N'Đã hủy'";
                            break;
                    }
                }
                if (search != null && !search.isEmpty()) {
                    query += "AND ([order_id] LIKE '%" + search + "%' OR [customer] LIKE '%" + search + "%')";
                }
                if (page != null) {
                    int pageNumber = Integer.parseInt(page);
                    int start = (pageNumber - 1) * recordsPerPage;
                    query += "ORDER BY (SELECT NULL) OFFSET " + start + " ROWS FETCH NEXT " + recordsPerPage + " ROWS ONLY";
                }
                System.out.println(query);
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String order_id = rs.getString("order_id");
                    String customer = rs.getString("customer");
                    Date order_date = rs.getDate("order_date");
                    String order_status = rs.getString("order_status");
                    String name_receiver = rs.getString("name_receiver");
                    int phone_receiver = rs.getInt("phone_receiver");
                    String address_receiver = rs.getString("address_receiver");
                    String payment_status = rs.getString("payment_status");
                    int total_price = rs.getInt("total_price");
                    int point = rs.getInt("applied_point");
                    order = new Order(order_id, customer, order_date, order_status, name_receiver,
                            phone_receiver, address_receiver, payment_status, total_price, point);
                    orderList.add(order);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return orderList;
    }

    public ArrayList<Order> getCustomerOrderByStatus(String customer, String status) throws SQLException {
        ArrayList<Order> orderList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Order order;
        LocalDate today = LocalDate.now();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String query = "SELECT [order_id],[order_date],[name_receiver],"
                        + "[phone_receiver],[address_receiver],[payment_status],[total_price],[applied_point] "
                        + "FROM [BirdFarmShop].[dbo].[Order] WHERE [customer] = '" + customer + "'";

                switch (status) {
                    case "wait":
                        query += " AND [order_status] = N'Chờ xử lý'";
                        break;
                    case "inProgress":
                        query += " AND [order_status] = N'Đang xử lý'";
                        break;
                    case "delivering":
                        query += " AND [order_status] = N'Đang vận chuyển'";
                        break;
                    case "delivered":
                        query += " AND [order_status] = N'Đã giao hàng'";
                        break;
                    case "cancel":
                        query += " AND [order_status] = N'Đã hủy'";
                        break;
                    default:
                        query += " AND [order_status] = N'Chờ xử lý'";

                }
                query += "ORDER BY [order_date] DESC";
                stm = con.prepareStatement(query);

                rs = stm.executeQuery();
                while (rs.next()) {
                    String order_id = rs.getString("order_id");
                    Date order_date = rs.getDate("order_date");
                    String name_receiver = rs.getString("name_receiver");
                    int phone_receiver = rs.getInt("phone_receiver");
                    String address_receiver = rs.getString("address_receiver");
                    String payment_status = rs.getString("payment_status");
                    int total_price = rs.getInt("total_price");
                    int point = rs.getInt("applied_point");
                    order = new Order(order_id, customer, order_date, null, name_receiver,
                            phone_receiver, address_receiver, payment_status, total_price, point);
                    orderList.add(order);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return orderList;
    }

    public boolean isOrderExist(String customer, String order_id) throws SQLException {
        boolean isExist = false;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String query = "SELECT [order_id] "
                        + "FROM [BirdFarmShop].[dbo].[Order] WHERE [customer] = ? AND [order_id] = ? ";
                query += "ORDER BY [order_date] DESC";
                stm = con.prepareStatement(query);
                stm.setString(1, customer);
                stm.setString(2, order_id);

                rs = stm.executeQuery();
                if (rs.next()) {
                    isExist = true;

                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return isExist;
    }

}
