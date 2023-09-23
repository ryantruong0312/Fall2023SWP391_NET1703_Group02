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
import swp391.birdfarmshop.model.Image;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author tlminh
 */
public class ImageDAO {
    private static final String GET_IMAGE_BIRD_LIST =   "SELECT IMAGE.image_id, IMAGE.image_url, IMAGE.is_thumbnail, IMAGE.bird_id, IMAGE.nest_id, IMAGE.accessory_id\n" +
                                                        "FROM [BirdFarmShop].[dbo].[Image] AS IMAGE\n" +
                                                        "INNER JOIN [BirdFarmShop].[dbo].[Bird] AS BIRD\n" +
                                                        "ON IMAGE.bird_id = BIRD.bird_id";
    public List<Image> getBirdImages() throws SQLException {
        List<Image> imageBirdList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_IMAGE_BIRD_LIST);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String image_id = rs.getString("image_id");
                    String image_url = rs.getString("image_url");
                    boolean is_thumbnail = rs.getBoolean("is_thumbnail");
                    String nest_id = rs.getString("nest_id");
                    String accessory_id = rs.getString("accessory_id");
                    Image image = new Image(image_id, image_url, is_thumbnail, nest_id, nest_id, accessory_id);
                    imageBirdList.add(image);
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
        return imageBirdList;
    }
//    public static void main(String[] args) throws SQLException {
//        ImageDAO dao = new ImageDAO();
//        for (Image image : dao.getBirdImages()) {
//            System.out.println(image.getImage_url());
//        }
//    }
}
