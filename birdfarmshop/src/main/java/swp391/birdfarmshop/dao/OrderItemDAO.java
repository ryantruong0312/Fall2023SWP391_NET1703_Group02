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
import swp391.birdfarmshop.dto.OrderItemDTO;
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
        OrderItemDTO orderItem = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement( "SELECT Item.[order_item_id], Item.[order_id], Image.[image_url] " +
                                ",Item.[bird_id], Bird.[bird_name]\n" +
                                ",Item.[nest_id], BirdNest.[nest_name]\n" +
                                ",Item.[accessory_id], Accessory.[accessory_name]" +
                                ",Item.[unit_price], Item.[order_quantity]\n" +
                                "FROM [dbo].[OrderItem] AS Item\n" +
                                "LEFT JOIN [dbo].[Bird] AS Bird ON Item.[bird_id] = Bird.[bird_id]\n" +
                                "LEFT JOIN [dbo].[BirdNest] AS BirdNest ON Item.[nest_id] = BirdNest.[nest_id]\n" +
                                "LEFT JOIN [dbo].[Accessory] AS Accessory ON Item.[accessory_id] = Accessory.[accessory_id]\n" +
                                "LEFT JOIN [dbo].[Image] AS Image ON (Image.[bird_id] = Bird.[bird_id] OR Image.[accessory_id] = Accessory.[accessory_id] OR Image.[nest_id] = BirdNest.[nest_id])\n" +
                                "WHERE Item.[order_id] = ? AND Image.[is_thumbnail] = 1");
                stm.setString(1, order_id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int order_item_id = rs.getInt("order_item_id");
                    String url = rs.getString("image_url");
                    String bird_id = rs.getString("bird_id");
                    String bird_name = rs.getString("bird_name");
                    String nest_id = rs.getString("nest_id");
                    String nest_name = rs.getString("nest_name");
                    String accessory_id = rs.getString("accessory_id");
                    String accessory_name = rs.getString("accessory_name");
                    int unit_price = rs.getInt("unit_price");
                    int order_quantity = rs.getInt("order_quantity");
                    orderItem = new OrderItemDTO(order_item_id, order_id, url, bird_id, bird_name, nest_id, nest_name, accessory_id, accessory_name, unit_price, order_quantity);
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
