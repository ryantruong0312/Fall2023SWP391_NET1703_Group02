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
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
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
    
    public ArrayList<Order> getAllOfOrder(  String date, String startDay, String endDay,
                                            String status, String search, String page, int recordsPerPage) throws SQLException{
        ArrayList<Order> orderList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Order order;
        LocalDate today = LocalDate.now();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String query =  "SELECT [order_id],[customer],[order_date],[order_status],[name_receiver],\n" +
                                "[phone_receiver],[address_receiver],[payment_status],[total_price],[applied_point]\n" +
                                "FROM [BirdFarmShop].[dbo].[Order] WHERE 1 = 1 ";
                if (date != null) {
                    switch(date) {
                        case "today":
                            query += "AND [order_date] = '" + today + "'";
                            break;
                        case "yesterday":
                            LocalDate yesterday = today.minus(1, ChronoUnit.DAYS);
                            query += "AND [order_date] = '" + yesterday + "'";
                            break;
                        case "thisWeek":
                            LocalDate firstDayOfWeek = today.minusDays(today.getDayOfWeek().getValue() - DayOfWeek.MONDAY.getValue());
                            LocalDate lastDayOfWeek = firstDayOfWeek.plusDays(6);
                            query += "AND ([order_date] >= '" + firstDayOfWeek + "' AND [order_date] <= '" + lastDayOfWeek + "')" ;
                            break;
                        case "thisMonth":
                            LocalDate firstDayOfMonth = LocalDate.of(today.getYear(), today.getMonth(), 1);
                            LocalDate lastDayOfMonth = YearMonth.from(today).atEndOfMonth();
                            query += "AND ([order_date] >= '" + firstDayOfMonth + "' AND [order_date] <= '" + lastDayOfMonth + "')" ;
                            break;
                        case "thisYear":
                            LocalDate firstDayOfYear = LocalDate.of(today.getYear(), 1, 1);
                            LocalDate lastDayOfYear = LocalDate.of(today.getYear(), 12, 31);
                            query += "AND ([order_date] >= '" + firstDayOfYear + "' AND [order_date] <= '" + lastDayOfYear + "')" ;
                            break;
                    }
                }
                if (startDay != null && endDay != null) {
                    if(!startDay.isEmpty() && !endDay.isEmpty()){
                        query += "AND ([order_date] >= '" + startDay + "' AND [order_date] <= '" + endDay + "')" ;
                    } else {
                        if (!startDay.isEmpty() && endDay.isBlank()) {
                            query += "AND ([order_date] >= '" + startDay + "')";
                        }
                        if (!endDay.isEmpty() && startDay.isBlank()) {
                            query += "AND ([order_date] <= '" + endDay + "')";
                        }
                    }
                }
                if(status != null && !status.isEmpty()) {
                    switch(status) {
                        case "wait":
                            query += "AND [order_status] = N'Chờ xử lý'";
                            break;
                        case "inProgress":
                            query += "AND [order_status] = N'Đang xử lý'";
                            break;
                        case "delivering":
                            query += "AND [order_status] = N'Đang vận chuyển'";
                            break;
                        case "delivered":
                            query += "AND [order_status] = N'Đã giao hàng'";
                            break;
                        case "notRated":
                            query += "AND [order_status] = N'Chưa đánh giá'";
                            break;    
                        case "rated":
                            query += "AND [order_status] = N'Đã đánh giá'";
                            break;    
                        case "cancel":
                            query += "AND [order_status] = N'Đã hủy'";
                            break;
                    }
                }
                if(search != null && !search.isEmpty()) {
                    query += "AND ([order_id] LIKE '%" + search + "%' OR [customer] LIKE '%" + search + "%')" ;
                }
                if (page != null) {
                    int pageNumber = Integer.parseInt(page);
                    int start = (pageNumber - 1) * recordsPerPage;
                    query += "ORDER BY (SELECT NULL) OFFSET " + start + " ROWS FETCH NEXT " + recordsPerPage + " ROWS ONLY";
                }
                stm = con.prepareStatement(query);
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
//        String date = null;
//        String startDay = "";
//        String endDay = "";
//        String status = "";
//        String search = "customer";
//        String page = "1";
//        int recordsPerPage = 20;
//        ArrayList<Order> list = dao.getAllOfOrder(date, startDay, endDay, status, search, page, recordsPerPage);
//        for (Order order : list) {
//            System.out.println(order.getOrder_id() + " " + order.getOrder_status());
//        }
//    }
}
