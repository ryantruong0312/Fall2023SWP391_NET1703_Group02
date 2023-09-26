/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import swp391.birdfarmshop.dto.FeedbackDTO;
import swp391.birdfarmshop.dto.StarDTO;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author tlminh
 */
public class FeedbackDAO {

    public ArrayList<FeedbackDTO> getFeedbackByIdProduct(String id) {
        ArrayList<FeedbackDTO> list = new ArrayList<>();
        Connection cnn = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "SELECT [full_name]\n"
                        + "      ,[email]\n"
                        + "      ,[rating]\n"
                        + "      ,[comment]\n"
                        + "      ,[feedback_date]\n"
                        + "      ,[bird_id]\n"
                        + "      ,[bird_name]\n"
                        + "      ,[accessory_id]\n"
                        + "      ,[accessory_name]\n"
                        + "      ,[image_url]\n"
                        + "  FROM [BirdFarmShop].[dbo].[View_Feedback]\n"
                        + "WHERE [bird_id] = ? OR [accessory_id] = ?";
                PreparedStatement pst = cnn.prepareStatement(sql);
                pst.setString(1, id);
                pst.setString(2, id);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("full_name");
                    String email = rs.getString("email");
                    int rating = rs.getInt("rating");
                    String comment = rs.getString("comment");
                    Date date = rs.getDate("feedback_date");
                    String bird_id = rs.getString("bird_id");
                    String bird_name = rs.getString("bird_name");
                    String accessory_id = rs.getString("accessory_id");
                    String accessory_name = rs.getString("accessory_name");
                    String image_url = rs.getString("image_url");
                    FeedbackDTO f = new FeedbackDTO(email, name, bird_id, bird_name, accessory_id,
                            accessory_name, image_url, comment, rating, image_url, date);
                    list.add(f);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cnn != null) {
                try {
                    cnn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public StarDTO getRatingByIdProduct(String id) {
        StarDTO s = null;
        Connection cnn = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "WITH RankedStar AS (	\n"
                        + "SELECT COUNT(CASE WHEN f.rating = 1 THEN 1 END) AS [oneStar],  COUNT(CASE WHEN f.rating = 2 THEN 1 END) AS [twoStar],\n"
                        + "			COUNT(CASE WHEN f.rating = 3 THEN 1 END) AS [threeStar],COUNT(CASE WHEN f.rating = 4 THEN 1 END) AS [fourStar],\n"
                        + "			COUNT(CASE WHEN f.rating = 5 THEN 1 END) AS [fiveStar]\n"
                        + "FROM [Feedback] f\n"
                        + "RIGHT JOIN [OrderItem] o\n"
                        + "ON o.order_item_id = f.order_item_id\n"
                        + "LEFT JOIN [Bird] b\n"
                        + "ON o.bird_id = b.bird_id\n"
                        + "LEFT JOIN [Accessory] a\n"
                        + "ON o.accessory_id = a.accessory_id\n"
                        + "WHERE o.bird_id = ? OR a.accessory_id = ?\n"
                        + "GROUP BY f.rating \n"
                        + ")\n"
                        + "SELECT SUM(rs.oneStar) AS [totalOneStar],SUM(rs.twoStar) AS [totalTwoStar],\n"
                        + "		SUM(rs.threeStar) AS [totalThreeStar],SUM(rs.fourStar) AS [totalFourStar],\n"
                        + "		SUM(rs.fiveStar) AS [totalFiveStar]\n"
                        + "FROM RankedStar rs";
                PreparedStatement pst = cnn.prepareStatement(sql);
                pst.setString(1, id);
                pst.setString(2, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int oneStar = rs.getInt("totalOneStar");
                    int twoStar = rs.getInt("totalTwoStar");
                    int threeStar = rs.getInt("totalThreeStar");
                    int fourStar = rs.getInt("totalFourStar");
                    int fiveStar = rs.getInt("totalFiveStar");
                    s = new StarDTO(oneStar, twoStar, threeStar, fourStar, fiveStar);
                }
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cnn != null) {
                try {
                    cnn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return s;
    }
}

