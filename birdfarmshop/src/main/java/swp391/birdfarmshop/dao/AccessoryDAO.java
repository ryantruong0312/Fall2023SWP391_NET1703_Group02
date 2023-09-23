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
import swp391.birdfarmshop.model.Accessory;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author tlminh
 */
public class AccessoryDAO {

    public ArrayList<Accessory> getAccessories() throws SQLException {
        ArrayList<Accessory> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM [BirdFarmShop].[dbo].[Accessory]";
                st = con.prepareStatement(sql);
                rs = st.executeQuery();
                while (rs.next()) {
                    String accessory_id = rs.getString("accessory_id");
                    String accessory_name = rs.getString("accessory_name");
                    int unit_price = rs.getInt("unit_price");
                    int stock_quantity = rs.getInt("stock_quantity");
                    String description = rs.getString("description");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    list.add(new Accessory(accessory_id, accessory_name, unit_price, stock_quantity, description, discount, status));
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public Accessory getAccessory(String accessory_id) throws SQLException {
        Accessory a = null;
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM [BirdFarmShop].[dbo].[Accessory] WHERE [accessory_id] = ?";
                st = con.prepareStatement(sql);
                st.setString(1, accessory_id);
                rs = st.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("accessory_id");
                    String accessory_name = rs.getString("accessory_name");
                    int unit_price = rs.getInt("unit_price");
                    int stock_quantity = rs.getInt("stock_quantity");
                    String description = rs.getString("description");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    a = new Accessory(id, accessory_name, unit_price, stock_quantity, description, discount, status);
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return a;
    }
}
