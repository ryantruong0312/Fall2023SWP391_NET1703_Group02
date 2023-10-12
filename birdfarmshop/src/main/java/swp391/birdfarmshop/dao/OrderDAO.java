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
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.model.Order;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author tlminh
 */
public class OrderDAO {
    
    public int createNewOrder(String order_id, String username, String status, String name_receiver, String phone_receiver,
                              String address_receiver, String payment_status, int total_price, int point) {
        int result = 0;
        Connection con = null;
             try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "INSERT INTO [ORDER]\n"
                        + "VALUES(?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, order_id);
                pst.setString(2, username);
                LocalDateTime customDateTime = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
                String sqlDate = customDateTime.format(formatter);
                pst.setString(3, sqlDate);
                pst.setString(4, status);
                pst.setString(5, name_receiver);
                pst.setString(6, phone_receiver);
                pst.setString(7, address_receiver);
                pst.setString(8, payment_status);
                pst.setInt(9, total_price);
                pst.setInt(10, point);
                result = pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
          if(con != null){
              try {
                  con.close();
              } catch (Exception e) {
                  e.printStackTrace();
              }
          }
        }
        return result;
    }
    
    public Order getOrderLatest(){
        Order o = null;
        Connection con = null;
        try{
            con = DBUtils.getConnection();
            if (con != null){
                String sql = "SELECT TOP 1 [order_id]\n"
                        + "      ,[customer]\n"
                        + "      ,[order_date]\n"
                        + "      ,[order_status]\n"
                        + "      ,[name_receiver]\n"
                        + "      ,[phone_receiver]\n"
                        + "      ,[address_receiver]\n"
                        + "      ,[payment_status]\n"
                        + "      ,[total_price]\n"
                        + "      ,[applied_point]\n"
                        + "  FROM [BirdFarmShop].[dbo].[Order]\n"
                        + "  ORDER BY order_date DESC";
                Statement st = con.createStatement()    ;
                ResultSet rs = st.executeQuery(sql);
                if(rs != null && rs.next()){
                    String order_id = rs.getString("order_id");
                    String customer = rs.getString("customer");
                    Date order_date = rs.getDate("order_date");
                    String order_status = rs.getString("order_status");
                    String name_receiver = rs.getString("name_receiver");
                    int phone_receiver = rs.getInt("phone_receiver");
                    String address_receiver = rs.getString("address_receiver");
                    String payment_status = rs.getString("payment_status");
                    int total_price = rs.getInt("total_price");
                    int point = rs.getInt("applied_point");
                    o = new Order(order_id, customer, order_date, order_status, name_receiver, 
                                  phone_receiver, address_receiver, payment_status, total_price, point);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
          if(con != null){
              try {
                  con.close();
              } catch (Exception e) {
                  e.printStackTrace();
              }
          }
        }
        return o;
    }
    
    public ArrayList<Order> getAllOfOrder() throws SQLException{
        ArrayList<Order> orderList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Order order = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT [order_id],[customer],[order_date],[order_status],[name_receiver],\n" +
                                "[phone_receiver],[address_receiver],[payment_status],[total_price],[applied_point]\n" +
                                "FROM [BirdFarmShop].[dbo].[Order]");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String order_id = rs.getString("order_id");
                    String customer = rs.getString("customer");
                    Date order_date = rs.getDate("order_date");
                    String order_status = rs.getString("order_status");
                    String name_receiver = rs.getString("name_receiver");
                    int phone_receiver = rs.getInt("phone_receiver");
                    String address_receiver = rs.getString("address_receiver");
                    String payment_status = rs.getString("payment_status");
                    int total_price = rs.getInt("total_price");
                    int point = rs.getInt("applied_point");
                    order = new Order(order_id, customer, order_date, order_status, name_receiver, 
                                  phone_receiver, address_receiver, payment_status, total_price, point);
                    orderList.add(order);
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
        return orderList;
    }
    
//    public static void main(String[] args) throws SQLException {
//        OrderDAO dao = new OrderDAO();
//        ArrayList<Order> list = dao.getAllOfOrder();
//        for (Order order : list) {
//            System.out.println(order.getOrder_id() + " " + order.getOrder_status());
//        }
//    }
}
