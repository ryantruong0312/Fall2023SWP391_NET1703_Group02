/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import swp391.birdfarmshop.dto.TrackingDTO;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author Admin
 */
public class TrackingBirdPairDAO {

    public ArrayList<TrackingDTO> getTrackingBirdPair(int pair_id) {
        ArrayList<TrackingDTO> trackingList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT [content]\n"
                        + "      ,[date_content]\n"
                        + "FROM [BirdFarmShop].[dbo].[PairTracking]\n"
                        + "WHERE [pair_id] = ?";
                pst = con.prepareStatement(sql);
                pst.setInt(1, pair_id);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String content = rs.getString("content");
                    Timestamp dateTime = rs.getTimestamp("date_content");
                    TrackingDTO t = new TrackingDTO(content, dateTime);
                    trackingList.add(t);
                }
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
            if (pst != null) {
                try {
                    pst.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return trackingList;
    }
}
