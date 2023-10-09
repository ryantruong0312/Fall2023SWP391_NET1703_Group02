/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import swp391.birdfarmshop.model.OrderItem;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author tlminh
 */
public class OrderItemDAO {

    public int createNewOrderItem(String order_id,String bird_id,String nest_id,
                                  String accessory_id, int unit_price, int order_quantity) {
        int result = 0;
        Connection con = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "INSERT INTO [OrderItem]([order_id],[bird_id],[nest_id],\n"
                        + "		  [accessory_id],[unit_price],[order_quantity])\n"
                        + "   VALUES(?,?,?,?,?,?)";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, order_id);
                pst.setString(2, bird_id);
                pst.setString(3, nest_id);
                pst.setString(4, accessory_id);
                pst.setInt(5, unit_price);
                pst.setInt(6, order_quantity);
                result = pst.executeUpdate();
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
    
    public ArrayList<OrderItem> getItemOfOrder(String order_id) throws SQLException{
        ArrayList<OrderItem> orderItemList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OrderItem orderItem = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement( "SELECT [order_item_id],[bird_id],[nest_id],\n" +
                                            "[accessory_id],[unit_price],[order_quantity]\n" +
                                            "FROM [BirdFarmShop].[dbo].[OrderItem]\n" +
                                            "WHERE [order_id] = ?");
                stm.setString(1, order_id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int order_item_id = rs.getInt("order_item_id");
                    String bird_id = rs.getString("bird_id");
                    String nest_id = rs.getString("nest_id");
                    String accessory_id = rs.getString("accessory_id");
                    int unit_price = rs.getInt("unit_price");
                    int order_quantity = rs.getInt("order_quantity");
                    orderItem = new OrderItem(order_item_id, order_id, bird_id, nest_id, accessory_id, unit_price, order_quantity);
                    orderItemList.add(orderItem);
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
        return orderItemList;
    }
    
    public ArrayList<OrderItem> getAllOrderItem() throws SQLException{
        ArrayList<OrderItem> orderItemList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OrderItem orderItem = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement( "SELECT [order_item_id],[order_id],[bird_id],[nest_id],\n" +
                                            "[accessory_id],[unit_price],[order_quantity]\n" +
                                            "FROM [BirdFarmShop].[dbo].[OrderItem]");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int order_item_id = rs.getInt("order_item_id");
                    String order_id = rs.getString("order_id");
                    String bird_id = rs.getString("bird_id");
                    String nest_id = rs.getString("nest_id");
                    String accessory_id = rs.getString("accessory_id");
                    int unit_price = rs.getInt("unit_price");
                    int order_quantity = rs.getInt("order_quantity");
                    orderItem = new OrderItem(order_item_id, order_id, bird_id, nest_id, accessory_id, unit_price, order_quantity);
                    orderItemList.add(orderItem);
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
        return orderItemList;
    }
}
