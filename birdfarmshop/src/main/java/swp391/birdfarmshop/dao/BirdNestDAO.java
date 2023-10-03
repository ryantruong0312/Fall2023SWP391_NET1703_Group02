/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import swp391.birdfarmshop.dto.BirdNestDTO;
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.model.BirdNest;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author ASUS
 */
public class BirdNestDAO {

    public List<BirdNest> getBirdsNest(String search, String breed, String price_nest, String page, int recordsPerPage) throws SQLException {
        List<BirdNest> birdNestList = new ArrayList<>();
        BirdNest birdNest = null;
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT [nest_id],[nest_name],[breed_id],[dad_bird_id],[mom_bird_id],\n"
                        + "       [baby_quantity],[status],[price],[discount],[description]\n"
                        + "FROM [BirdFarmShop].[dbo].[BirdNest]";
                if (search != null) {
                    sql += " WHERE nest_name LIKE N'%" + search + "%'";
                    if (breed != null) {
                        sql += " AND breed_id = " + "'" + breed + "'" + "";
                    }
                    if (price_nest != null) {
                        sql += " AND " + price_nest;
                    }
                    sql += "\n";
                }
                if (search == null && breed != null) {
                    sql += " WHERE breed_id = " + "'" + breed + "'" + "";
                    if (price_nest != null) {
                        sql += " AND " + price_nest;
                    }
                    sql += "\n";
                }
                if (search == null && breed == null
                        && price_nest != null) {
                    sql += " WHERE " + price_nest;
                    sql += "\n";
                }
                if (page != null) {
                    int pageNumber = Integer.parseInt(page);
                    int start = (pageNumber - 1) * recordsPerPage;
                    sql += "ORDER BY (SELECT NULL) OFFSET " + start + " ROWS FETCH NEXT " + recordsPerPage + " ROWS ONLY";
                }
                stm = con.createStatement();
                rs = stm.executeQuery(sql);
                while (rs.next()) {
                    String nest_id = rs.getString("nest_id");
                    String nest_name = rs.getString("nest_name");
                    String breed_id = rs.getString("breed_id");
                    int price = rs.getInt("price");
                    int quantityEgg = rs.getInt("baby_quantity");
                    String description = rs.getString("description");
                    String dad_bird_id = rs.getString("dad_bird_id");
                    String mom_bird_id = rs.getString("mom_bird_id");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    String image_url = imgDao.getThumbnailUrlByBirdNestId(nest_id);
                    birdNest = new BirdNest(nest_id, nest_name, breed_id, dad_bird_id, mom_bird_id, quantityEgg, status, price, discount, image_url, description);
                    birdNestList.add(birdNest);
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
        return birdNestList;
    }
    public int totalBirdsNest(String search, String breed, String price_nest, String page, int recordsPerPage) throws SQLException {
        int number = 0;
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT COUNT(nest_id) AS [Amount] [nest_id],[nest_name],[breed_id],[dad_bird_id],[mom_bird_id],\n"
                        + "       [baby_quantity],[status],[price],[discount],[description]\n"
                        + "FROM [BirdFarmShop].[dbo].[BirdNest]";
                if (search != null) {
                    sql += " WHERE nest_name LIKE N'%" + search + "%'";
                    if (breed != null) {
                        sql += " AND breed_id = " + "'" + breed + "'" + "";
                    }
                    if (price_nest != null) {
                        sql += " AND " + price_nest;
                    }
                    sql += "\n";
                }
                if (search == null && breed != null) {
                    sql += " WHERE breed_id = " + "'" + breed + "'" + "";
                    if (price_nest != null) {
                        sql += " AND " + price_nest;
                    }
                    sql += "\n";
                }
                if (search == null && breed == null
                        && price_nest != null) {
                    sql += " WHERE " + price_nest;
                    sql += "\n";
                }
                if (page != null) {
                    int pageNumber = Integer.parseInt(page);
                    int start = (pageNumber - 1) * recordsPerPage;
                    sql += "ORDER BY (SELECT NULL) OFFSET " + start + " ROWS FETCH NEXT " + recordsPerPage + " ROWS ONLY";
                }
                stm = con.createStatement();
                rs = stm.executeQuery(sql);
                if(rs != null && rs.next()){
                    number = rs.getInt("Amount");
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
        return number;
    }

}
