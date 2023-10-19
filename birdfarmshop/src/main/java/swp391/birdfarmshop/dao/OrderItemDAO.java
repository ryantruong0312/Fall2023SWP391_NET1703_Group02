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
import swp391.birdfarmshop.dto.AccessoryDTO;
import swp391.birdfarmshop.dto.BirdPairDTO;
import swp391.birdfarmshop.dto.OrderItemDTO;
import swp391.birdfarmshop.model.Accessory;
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.model.BirdNest;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author tlminh
 */
public class OrderItemDAO {

    public ArrayList<OrderItemDTO> getItemOrder(String order_id) throws SQLException{
        ArrayList<OrderItemDTO> orderItemList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OrderItemDTO orderItem;
        BirdDAO birdDao = new BirdDAO();
        BirdNestDAO bnDao = new BirdNestDAO();
        AccessoryDAO accessoryDao = new AccessoryDAO();
        BirdPairDAO bpDao = new BirdPairDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement( "SELECT Item.[order_item_id],Item.[order_id],Item.[bird_id],\n" +
                                    "Item.[nest_id],Item.[accessory_id],Item.[pair_id],Item.[unit_price],Item.[order_quantity]\n" +
                                    "FROM [dbo].[OrderItem] AS Item\n" +
                                    "WHERE Item.[order_id] = ?");
                stm.setString(1, order_id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int order_item_id = rs.getInt("order_item_id");
                    String bird_id = rs.getString("bird_id");
                    String nest_id = rs.getString("nest_id");
                    String accessory_id = rs.getString("accessory_id");
                    String pair_id = rs.getString("pair_id");
                    int unit_price = rs.getInt("unit_price");
                    int order_quantity = rs.getInt("order_quantity");
                    Bird bird = birdDao.getBirdById(bird_id);
                    System.out.println("cc");
                    BirdNest birdNest = bnDao.getBirdNestById(nest_id);
                    Accessory accessory = accessoryDao.getAccessoryByID(accessory_id);
                    BirdPairDTO birdPair = bpDao.getBirdPairById(pair_id);
                    orderItem = new OrderItemDTO(order_item_id, order_id, null, bird, accessory, birdNest, birdPair, unit_price, order_quantity);
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
    
    public ArrayList<OrderItemDTO> getItemByOrderId(String order_id) throws SQLException {
        ArrayList<OrderItemDTO> orderItemList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OrderItemDTO orderItem;
        BirdDAO birdDao = new BirdDAO();
        BirdNestDAO bnDao = new BirdNestDAO();
        AccessoryDAO accessoryDao = new AccessoryDAO();
        BirdPairDAO bpDao = new BirdPairDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement( "SELECT Item.[order_item_id],Item.[order_id],[Order].[order_status]\n" +
"                            ,Item.[bird_id],Item.[nest_id],Item.[accessory_id],Item.[pair_id],Item.[unit_price],Item.[order_quantity]\n" +
"                            FROM [dbo].[OrderItem] AS Item\n" +
"                            LEFT JOIN [dbo].[Order] ON Item.[order_id] = [Order].[order_id]\n" +
"                            WHERE Item.[order_id] = ?");
                stm.setString(1, order_id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int order_item_id = rs.getInt("order_item_id");
                    String order_status = rs.getString("order_status");
                    String bird_id = rs.getString("bird_id");
                    String nest_id = rs.getString("nest_id");
                    String accessory_id = rs.getString("accessory_id");
                    String pair_id = rs.getString("pair_id");
                    int unit_price = rs.getInt("unit_price");
                    int order_quantity = rs.getInt("order_quantity");
                    Bird bird = birdDao.getBirdById(bird_id);
                    BirdNest birdNest = bnDao.getBirdNestById(nest_id);
                    Accessory accessory = accessoryDao.getAccessoryByID(accessory_id);
                    //BirdPairDTO birdPair = bpDao.getBirdPairById(pair_id);
                    orderItem = new OrderItemDTO(order_item_id, order_id, order_status, bird, accessory, birdNest, null, unit_price, order_quantity);
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
