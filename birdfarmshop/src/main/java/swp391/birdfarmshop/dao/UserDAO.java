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
                String sql = "SELECT [username],[password], [full_name],[phone],[email],[role],[address],[point],[register_date],[login_by],[status] FROM [User] \n"
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
                    String loginBy = rs.getString("login_by");
                    String status = rs.getString("status");
                    u = new User(user, password, fullName, phone, email, role, address, point, registerDate, loginBy, status);
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

    public static User findUser(String username, String emailFind) {
        User u = null;
        Connection cnn = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "SELECT [username],[password], [full_name],[phone],[email],[role],[address],[point],[register_date],[login_by],[status] FROM [User] \n"
                        + "WHERE username = ? OR email = ? ";
                PreparedStatement pst = cnn.prepareStatement(sql);
                pst.setString(1, username);
                pst.setString(2, emailFind);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    username = rs.getString("username");
                    String password = rs.getString("password");
                    String fullName = rs.getString("full_name");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String role = rs.getString("role");
                    String address = rs.getString("address");
                    int point = rs.getInt("point");
                    Date registerDate = rs.getDate("register_date");
                    String loginBy = rs.getString("login_by");
                    String status = rs.getString("status");
                    u = new User(username, password, fullName, phone, email, role, address, point, registerDate, loginBy, status);
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

    public static int createUser(String user, String email, String password, String name, String mobile, String loginBy, String status) {
        int result = 0;
        Connection cnn = null;
        try {
            cnn = DBUtils.getConnection();
            String sql = "INSERT INTO [User](username,[password],full_name,phone,email,register_date,[role],[login_by],[status])\n"
                    + "VALUES(?,?,?,?,?,?,'customer',?,?)";
            PreparedStatement pst = cnn.prepareStatement(sql);
            pst.setString(1, user);
            pst.setString(2, password);
            pst.setString(3, name);
            pst.setString(4, mobile);
            pst.setString(5, email);
            LocalDate currentDate = LocalDate.now();
            pst.setString(6, "" + currentDate);
            pst.setString(7, loginBy);
            pst.setString(8, status);
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

    public static int updatePassword(String user,String password) {
        int result = 0;
        Connection cnn = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "UPDATE [User]\n"
                        + "SET [password] = ?\n"
                        + "WHERE [username] = ?";
                PreparedStatement pst = cnn.prepareStatement(sql);
                pst.setString(1, password);
                pst.setString(2, user);
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

    public static int updateActive(String username, String active) {
        int result = 0;
        Connection cnn = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "UPDATE [User]\n"
                        + "SET [status] = ?\n"
                        + "WHERE [username] = ?";
                PreparedStatement pst = cnn.prepareStatement(sql);
                pst.setString(1, active);
                pst.setString(2, username);
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
}
