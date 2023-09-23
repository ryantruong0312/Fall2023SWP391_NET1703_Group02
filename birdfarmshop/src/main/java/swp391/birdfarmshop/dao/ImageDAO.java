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
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author tlminh
 */
public class ImageDAO {

    private static final String GET_THUMBNAIL_BY_BIRD_ID = "SELECT [image_url] FROM [Image] WHERE [bird_id] = ? AND [is_thumbnail] = 1";
    private static final String GET_IMAGES_BY_BIRD_ID = "SELECT [image_url] FROM [Image] WHERE [bird_id] = ?";

    public String getThumbnailUrlByBirdId(String birdId) throws SQLException {
        String url = "";
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_THUMBNAIL_BY_BIRD_ID);
                stm.setString(1, birdId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    url = rs.getString("image_url");
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
        return url;
    }

    ArrayList<String> getImagesByBirdId(String birdId) throws SQLException {
        ArrayList<String> urls = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_IMAGES_BY_BIRD_ID);
                stm.setString(1, birdId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String url = rs.getString("image_url");
                    urls.add(url);
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
        return urls;
    }
}
