/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import swp391.birdfarmshop.dto.AccountDTO;
import swp391.birdfarmshop.model.User;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author tlminh
 */
public class UserDAO {

    private static final String GET_ACCOUNT_LIST = "SELECT [username], [full_name], [role], [status] FROM [User]\n";
    private static final String GET_USER_BY_USERNAME = "SELECT [username], [full_name], [role], [email], [phone],"
            + " [register_date], [point], [address],[login_by], [status] FROM [User] WHERE username = ?";

    public User getUser(String username, String password) {
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

    public User findUser(String username, String emailFind) {
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

    public int createUser(String user, String email, String password, String name, String mobile, String role, String loginBy, String status) {
        int result = 0;
        Connection cnn = null;
        try {
            cnn = DBUtils.getConnection();
            String sql = "INSERT INTO [User](username,[password],full_name,phone,email,register_date,[role],[login_by],[status])\n"
                    + "VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = cnn.prepareStatement(sql);
            pst.setString(1, user);
            pst.setString(2, password);
            pst.setString(3, name);
            pst.setString(4, mobile);
            pst.setString(5, email);
            LocalDate currentDate = LocalDate.now();
            pst.setString(6, "" + currentDate);
            pst.setString(7, role);
            pst.setString(8, loginBy);
            pst.setString(9, status);
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

    public int updatePassword(String user, String password) {
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

    public int updateActive(String username, String active) {
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

    public ArrayList<AccountDTO> getAccountList(String search, String page, int recordsPerPage) throws SQLException {
        ArrayList<AccountDTO> accountList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = GET_ACCOUNT_LIST;
                if(search != null){
                    sql += " WHERE username LIKE N'%"+search+"%' "
                            + "OR full_name LIKE N'%"+search+"%' "
                            + "OR role LIKE N'%" + search + "%' "
                            + "OR status LIKE N'%" + search + "%' ";
                }
                if (page != null) {
                    int pageNumber = Integer.parseInt(page);
                    int start = (pageNumber - 1) * recordsPerPage;
                    sql += "ORDER BY (SELECT NULL) OFFSET " + start + " ROWS FETCH NEXT " + recordsPerPage + " ROWS ONLY";
                }
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String username = rs.getString("username");
                    String fullName = rs.getString("full_name");
                    String role = rs.getString("role");
                    String status = rs.getString("status");
                    accountList.add(new AccountDTO(username, fullName, role, status));
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
        return accountList;
    }
        public int totalAccount(String search) throws SQLException {
        int result = 0;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT COUNT(username) AS [Amount] \n"
                        +    "FROM [User]";
                if(search != null){
                    sql += " WHERE username LIKE N'%"+search+"%' "
                            + "OR full_name LIKE N'%"+search+"%' "
                            + "OR role LIKE N'%" + search + "%' "
                            + "OR status LIKE N'%" + search + "%' ";
                }
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs != null && rs.next()) {
                   result = rs.getInt("Amount");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
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
        return result;
    }
    public boolean updateProfile(String fullName, String phone, String address, String username) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement("UPDATE [dbo].[User]\n"
                        + "SET [full_name] = ?,[phone] = ?,[address] = ?\n"
                        + "WHERE [username] = ?");
                stm.setString(1, fullName);
                stm.setString(2, phone);
                stm.setString(3, address);
                stm.setString(4, username);
                int rowsAffected = stm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public User getUserByUsername(String username) throws SQLException {
        User user = null;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_USER_BY_USERNAME);
                ptm.setString(1, username);
                rs = ptm.executeQuery();
                if (rs != null && rs.next()) {
                    username = rs.getString("username");
                    String fullName = rs.getString("full_name");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String role = rs.getString("role");
                    String address = rs.getString("address");
                    int point = rs.getInt("point");
                    Date registerDate = rs.getDate("register_date");
                    String loginBy = rs.getString("login_by");
                    String status = rs.getString("status");
                    user = new User(username, "*****", fullName, phone, email, role, address, point, registerDate, loginBy, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return user;
    }
}
