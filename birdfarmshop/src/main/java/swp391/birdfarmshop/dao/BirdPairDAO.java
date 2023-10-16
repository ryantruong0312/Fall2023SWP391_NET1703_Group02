/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import swp391.birdfarmshop.dto.BirdPairDTO;
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.model.BirdCustomer;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author tlminh
 */
public class BirdPairDAO {
    public ArrayList<BirdPairDTO> getBirdPairByUser(String username,String status) {
        ArrayList<BirdPairDTO> bpList = new ArrayList<>();
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        BirdCustomerDAO bsd = new BirdCustomerDAO();
        BirdDAO bd = new BirdDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT bp.pair_id, bp.order_id, bp.number_young_bird,\n"
                        + "	   bp.bird_customer, bp.male_bird_id, bp.female_bird_id,\n"
                        + "	   bp.number_egg, bp.number_young_bird, pt.[status]\n"
                        + "FROM [BirdPair] bp\n"
                        + "LEFT JOIN [Order] o\n"
                        + "ON bp.order_id = o.order_id\n"
                        + "LEFT JOIN [PairTracking] pt\n"
                        + "ON bp.pair_id = pt.pair_id\n";
                        if(username != null){
                            sql += "WHERE o.customer = '"+username+"'\n";
                            if(status != null){
                                sql += " AND pt.[status] = N'"+status+"'\n";
                            }
                        }
                        if(username == null && status != null){
                            sql += "WHERE pt.[status] = N'"+status+"'\n";
                        }
                        
                st = con.createStatement();
                rs = st.executeQuery(sql);
                while(rs.next()){ 
                    int pair_id = rs.getInt("pair_id");
                    String order_id = rs.getString("order_id");
                    int young_bird_price = rs.getInt("number_young_bird");
                    BirdCustomer birdCustomer = bsd.findBirdCustomer(rs.getInt("bird_customer")+"");
                    Bird male_bird = bd.getBirdById(rs.getString("male_bird_id"));
                    Bird female_bird = bd.getBirdById(rs.getString("female_bird_id"));
                    int number_egg = rs.getInt("number_egg");
                    int number_young_bird = rs.getInt("number_young_bird");
                    status = rs.getString("status");
                    BirdPairDTO bp = new BirdPairDTO(pair_id, order_id, young_bird_price, birdCustomer, male_bird, female_bird, number_egg, number_young_bird, status);
                    bpList.add(bp);
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
            if (st != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return bpList;
    }
}
