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
import java.util.List;
import swp391.birdfarmshop.dto.AccessoryDTO;
import swp391.birdfarmshop.dto.BirdNestDTO;
import swp391.birdfarmshop.model.Accessory;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author ASUS
 */
public class BirdNestDAO {

    private static final String GET_NEXT_9_BIRDNEST_LIST = "SELECT * FROM [BirdFarmShop].[dbo].[BirdNest] "
            + "ORDER BY [price] ASC OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";

    public ArrayList<BirdNestDTO> getBirdNest() throws SQLException {
        ArrayList<BirdNestDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ImageDAO imgDAO = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM [BirdFarmShop].[dbo].[BirdNest]";
                st = con.prepareStatement(sql);
                rs = st.executeQuery();
                while (rs.next()) {
                    int nest_id = rs.getInt("nest_id");
                    int baby_quantity = rs.getInt("baby_quantity");
                    String nest_name = rs.getString("nest_name");
                    boolean is_thumbnail = rs.getBoolean("is_thumbnail");
                    String dad_bird_id = rs.getString("dad_bird_id");
                    String mom_bird_id = rs.getString("mom_bird_id");
                    int price = rs.getInt("price");
                    String description = rs.getString("description");
                    String status = rs.getString("status");
                    String image_url = imgDAO.getThumbnailUrlByBirdNestId(nest_id);
                    list.add(new BirdNestDTO(nest_id, nest_name, is_thumbnail, dad_bird_id, mom_bird_id, baby_quantity, status, price, description, image_url));
                
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

    public BirdNestDTO getBirdNestByID(int nest_id) throws SQLException {
        BirdNestDTO b = null;
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ImageDAO imgDAO = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM [BirdFarmShop].[dbo].[BirdNest] WHERE [nest_id] = ?";
                st = con.prepareStatement(sql);
                st.setInt(1, nest_id);
                rs = st.executeQuery();
                while (rs.next()) {
                    int baby_quantity = rs.getInt("baby_quantity");
                    String nest_name = rs.getString("nest_name");
                    boolean is_thumbnail = rs.getBoolean("is_thumbnail");
                    String dad_bird_id = rs.getString("dad_bird_id");
                    String mom_bird_id = rs.getString("mom_bird_id");
                    int price = rs.getInt("price");
                    String description = rs.getString("description");
                    String status = rs.getString("status");
                    ArrayList<String> image_url_arr = imgDAO.getImagesByBirdNestId(nest_id);
                    b = new BirdNestDTO(nest_id, nest_name, is_thumbnail, dad_bird_id, mom_bird_id, baby_quantity, status, price, description, image_url_arr);
                }
            }
        } catch (ClassNotFoundException e) {
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
        return b;
    }

    public List<BirdNestDTO> getNext9BirdNest(int amount) throws SQLException {
        List<BirdNestDTO> next9BirdNest = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_NEXT_9_BIRDNEST_LIST);
                stm.setInt(1, amount);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int nest_id = rs.getInt("nest_id");
                    int baby_quantity = rs.getInt("baby_quantity");
                    String nest_name = rs.getString("nest_name");
                    boolean is_thumbnail = rs.getBoolean("is_thumbnail");
                    String dad_bird_id = rs.getString("dad_bird_id");
                    String mom_bird_id = rs.getString("mom_bird_id");
                    int price = rs.getInt("price");
                    String description = rs.getString("description");
                    String status = rs.getString("status");
                    String image_url = imgDao.getThumbnailUrlByBirdNestId(nest_id);
                    next9BirdNest.add(new BirdNestDTO(nest_id, nest_name, is_thumbnail, dad_bird_id, mom_bird_id, baby_quantity, status, price, description, image_url));
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
        return next9BirdNest;
    }
}
