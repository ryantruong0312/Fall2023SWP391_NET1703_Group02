/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import swp391.birdfarmshop.model.User;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author tlminh
 */
public class UserDAO {

    public static User getUser(String username, String password) {
        User u = null;
        Connection cnn = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "SELECT [username],[password], [full_name],[phone],[email],[role],[address],[point],[register_date],[status] FROM [User] \n"
                        + "WHERE (username = ? OR email = ?)AND [password] = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cnn.prepareStatement(sql);
                pst.setString(1, username);
                pst.setString(2, username);
                pst.setString(3, password);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    String user = rs.getString("username");
                    String fullName = rs.getString("full_name");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String role = rs.getString("role");
                    String address = rs.getString("address");
                    int point = rs.getInt("point");
                    Date registerDate = rs.getDate("register_date");
                    String status = rs.getString("status");
                    u = new User(user, password, fullName, phone, email, role, address, point, registerDate, status);
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
        return u;
    }

    public static User findUser(String username, String email) {
        User u = null;
        Connection cnn = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "SELECT [username],[password], [full_name],[phone],[email],[role],[address],[point],[register_date],[status] FROM [User] \n"
                        + "WHERE username = ? OR email = ? ";
                PreparedStatement pst = cnn.prepareStatement(sql);
                pst.setString(1, username);
                pst.setString(2, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    String password = rs.getString("password");
                    String fullName = rs.getString("full_name");
                    String phone = rs.getString("phone");
                    String role = rs.getString("role");
                    String address = rs.getString("address");
                    int point = rs.getInt("point");
                    Date registerDate = rs.getDate("register_date");
                    String status = rs.getString("status");
                    u = new User(username, password, fullName, phone, email, role, address, point, registerDate, status);
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
        return u;
    }

    public static int createUser(String user, String email, String password, String name, String mobile) {
        int result = 0;
        Connection cnn = null;
        try {
            cnn = DBUtils.getConnection();
            String sql = "INSERT INTO [User](username,[password],full_name,phone,email,register_date,[role],[status])\n"
                    + "VALUES(?,?,?,?,?,?,'customer','not active')";
            PreparedStatement pst = cnn.prepareStatement(sql);
            pst.setString(1, user);
            pst.setString(2, password);
            pst.setString(3, name);
            pst.setString(4, mobile);
            pst.setString(5, email);
            LocalDate currentDate = LocalDate.now();
            pst.setString(6, "" + currentDate);
            result = pst.executeUpdate();
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
}
