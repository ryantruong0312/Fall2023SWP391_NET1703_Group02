/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Savepoint;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import swp391.birdfarmshop.dto.CartDTO;
import swp391.birdfarmshop.model.Accessory;
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.model.Order;
import swp391.birdfarmshop.model.OrderItem;
import swp391.birdfarmshop.model.OrderedAccessoryItem;
import swp391.birdfarmshop.model.OrderedBirdItem;
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
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                con.setAutoCommit(false);
                Savepoint save = con.setSavepoint("createOrder");
                String sql = "INSERT INTO [ORDER]\n"
                        + "VALUES(?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement pst = con.prepareStatement(sql);
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
                if (result > 0) {
                    checkBird = true;
                    checkAcessory = true;
                    HashMap<String, OrderedBirdItem> birdList = (HashMap<String, OrderedBirdItem>) cart.getBirdList();
                    for (OrderedBirdItem ob : birdList.values()) {
                        Bird b = ob.getBird();
                        int realPrice = b.getPrice();
                        if (b.getDiscount() > 0) {
                            realPrice = b.getPrice() - b.getPrice() * b.getDiscount() / 100;
                        }
                        OrderItem oldOrder = getOrderByBirdId(b.getBird_id());
                        if (oldOrder != null) {
                            checkBird = false;
                            error = "Sản phẩm này đã bán";
                            break;
                        } else {
                            sql = "UPDATE [Bird]\n"
                                    + "SET [status] = 'Đã bán'\n"
                                    + "WHERE [bird_id] = ?";
                            pst = con.prepareStatement(sql);
                            pst.setString(1, b.getBird_id());
                            result = pst.executeUpdate();
                            if (result == 0) {
                                checkBird = false;
                                break;
                            } else {
                                sql = "INSERT INTO [OrderItem]([order_id],[bird_id],[nest_id],\n"
                                        + "		  [accessory_id],[unit_price],[order_quantity])\n"
                                        + "   VALUES(?,?,?,?,?,?)";
                                pst = con.prepareStatement(sql);
                                pst.setString(1, order_id);
                                pst.setString(2, b.getBird_id());
                                pst.setString(3, null);
                                pst.setString(4, null);
                                pst.setInt(5, realPrice);
                                pst.setInt(6, 1);
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
                        int numberAccessory = ad.getAccessoryByID(a.getAccessory_id()).getStock_quantity();
                        if (numberAccessory == 0) {
                            error ="Sản phẩm này đã hết hàng";
                            checkAcessory = false;
                            break;
                        } else if (numberAccessory < oa.getOrder_quantity()) {
                            checkAcessory = false;
                            error ="Sản phẩm này không đủ số lượng trong kho";
                            break;
                        } else {
                            int newStock = numberAccessory - oa.getOrder_quantity();
                            sql = "UPDATE [Accessory]\n"
                                    + "SET [stock_quantity] = ?\n"
                                    + "WHERE [accessory_id] = ?";
                            pst = con.prepareStatement(sql);
                            pst.setInt(1, newStock);
                            pst.setString(2, a.getAccessory_id());
                            result = pst.executeUpdate();
                            if (result == 0) {
                                checkAcessory = false;
                                break;
                            } else {
                                sql = "INSERT INTO [OrderItem]([order_id],[bird_id],[nest_id],\n"
                                        + "		  [accessory_id],[unit_price],[order_quantity])\n"
                                        + "   VALUES(?,?,?,?,?,?)";
                                pst = con.prepareStatement(sql);
                                pst.setString(1, order_id);
                                pst.setString(2, null);
                                pst.setString(3, null);
                                pst.setString(4, a.getAccessory_id());
                                pst.setInt(5, realPrice);
                                pst.setInt(6, oa.getOrder_quantity());
                                result = pst.executeUpdate();
                                if (result == 0) {
                                    checkAcessory = false;
                                }
                            }
                        }
                    }
                } else {
                    checkBird = true;
                    checkAcessory = true;
                }
                if (checkBird && checkAcessory) {
                    con.commit();
                    result = 1;
                } else {
                    result = 0;
                    con.rollback(save);
                    pst.close();
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
        }
        return result;
    }

    public Order getOrderLatest() {
        Order o = null;
        Connection con = null;
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
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
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
                    o = new Order(order_id, customer, order_date, order_status, name_receiver,
                            phone_receiver, address_receiver, payment_status, total_price, point);
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
        }
        return o;
    }

    public OrderItem getOrderByBirdId(String bird_id) {
        OrderItem oi = null;
        Connection con = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT TOP (1000) [order_item_id]\n"
                        + "      ,[order_id]\n"
                        + "      ,[bird_id]\n"
                        + "      ,[nest_id]\n"
                        + "      ,[accessory_id]\n"
                        + "      ,[unit_price]\n"
                        + "      ,[order_quantity]\n"
                        + "  FROM [BirdFarmShop].[dbo].[OrderItem]\n"
                        + "  WHERE [bird_id] = ?";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, bird_id);
                ResultSet rs = pst.executeQuery();
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
        }
        return oi;
    }
}
