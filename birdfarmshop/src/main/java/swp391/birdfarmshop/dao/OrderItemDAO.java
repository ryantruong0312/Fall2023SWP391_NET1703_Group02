/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    
}
