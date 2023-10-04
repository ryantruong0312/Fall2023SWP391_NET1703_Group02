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
import swp391.birdfarmshop.model.BirdCustomer;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author Admin
 */
public class BirdCustomerDAO {
    
    public int createNewBirdCustomer (String bird_id, String name, String gender, String breed_id,
                                       String username, String image_url, String status){
        int result = 0;
        Connection cnn = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "INSERT INTO [dbo].[BirdCustomer] \n"
                           + "VALUES (?,?,?,?,?,?,?)";
                PreparedStatement pst = cnn.prepareStatement(sql);
                pst.setString(1, bird_id);
                pst.setString(2, name);
                pst.setString(3, gender);
                pst.setString(4, breed_id);
                pst.setString(5, username);
                pst.setString(6, image_url);
                pst.setString(7, status);
                result = pst.executeUpdate();
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
        return result;
    }
    
    public ArrayList<BirdCustomer> getBirdCustomer  (String search, String page , int recordsPerPage){
        ArrayList<BirdCustomer> birdCustomerList = new ArrayList<>();
        Connection cnn = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "SELECT [bird_id],[bird_name],[gender],[breed_id],\n"
                           + "	     [customer],[img_url],[status]\n"
                           + "FROM BirdCustomer\n";
                if(search != null){
                    sql += " WHERE bird_name LIKE N'%"+search+"%'\n";
                }
                if (page != null) {
                    if (page != null) {
                        int pageNumber = Integer.parseInt(page);
                        int start = (pageNumber - 1) * recordsPerPage;
                        sql += "ORDER BY (SELECT NULL) OFFSET " + start + " ROWS FETCH NEXT " + recordsPerPage + " ROWS ONLY";
                    }
                }
                Statement st = cnn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while(rs.next()){
                    String bird_id = rs.getString("bird_id");
                    String bird_name = rs.getString("bird_name");
                    boolean gender = rs.getBoolean("gender");
                    String breed_id = rs.getString("breed_id");
                    String customer = rs.getString("customer");
                    String img_url = rs.getString("img_url");
                    String status = rs.getString("status");
                    BirdCustomer b = new BirdCustomer(bird_id, bird_name, gender, breed_id, customer, img_url, status);
                    birdCustomerList.add(b);
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
        return birdCustomerList;
    }

    public ArrayList<BirdCustomer> getBirdCustomerByCustomer(String customer,String breedId, String page, int recordsPerPage) {
        ArrayList<BirdCustomer> birdCustomerList = new ArrayList<>();
        Connection cnn = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "SELECT [bird_id],[bird_name],[gender],[breed_id],\n"
                        + "	     [customer],[img_url],[status]\n"
                        + "FROM BirdCustomer\n";
                if(customer != null){
                    sql += " WHERE customer = '"+customer+"'\n";
                    if(breedId != null){
                        sql += " AND breed_id = '"+breedId+"'\n";
                    }
                }
                if(customer == null && breedId != null){
                    sql += " WHERE breed_id = '"+breedId+"'\n";
                }
                if (page != null) {
                    if (page != null) {
                        int pageNumber = Integer.parseInt(page);
                        int start = (pageNumber - 1) * recordsPerPage;
                        sql += "ORDER BY (SELECT NULL) OFFSET " + start + " ROWS FETCH NEXT " + recordsPerPage + " ROWS ONLY";
                    }
                }
                Statement st = cnn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    String bird_id = rs.getString("bird_id");
                    String bird_name = rs.getString("bird_name");
                    boolean gender = rs.getBoolean("gender");
                    String breed_id = rs.getString("breed_id");
                    String img_url = rs.getString("img_url");
                    String status = rs.getString("status");
                    BirdCustomer b = new BirdCustomer(bird_id, bird_name, gender, breed_id, customer, img_url, status);
                    birdCustomerList.add(b);
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
        return birdCustomerList;
    }

    public BirdCustomer findBirdCustomer(String birdId){
        Connection cnn = null;
        BirdCustomer b = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "SELECT [bird_id],[bird_name],[gender],[breed_id],\n"
                           + "	     [customer],[img_url],[status]\n"
                           + "FROM BirdCustomer\n"
                           + "WHERE bird_id = ?";
                PreparedStatement pst = cnn.prepareStatement(sql);
                pst.setString(1,birdId );
                ResultSet rs = pst.executeQuery();
                if(rs != null && rs.next()) {
                    String bird_id = rs.getString("bird_id");
                    String bird_name = rs.getString("bird_name");
                    boolean gender = rs.getBoolean("gender");
                    String breed_id = rs.getString("breed_id");
                    String username = rs.getString("customer");
                    String img_url = rs.getString("img_url");
                    String status = rs.getString("status");
                     b = new BirdCustomer(bird_id, bird_name, gender, breed_id, username, img_url, status);
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
        return b;
    }
    
}
