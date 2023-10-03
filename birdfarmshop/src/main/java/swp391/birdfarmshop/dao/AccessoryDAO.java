/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import swp391.birdfarmshop.dto.AccessoryDTO;
import swp391.birdfarmshop.model.Accessory;
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author tlminh
 */
public class AccessoryDAO {

    private static final String GET_NEXT_9_ACCESSORY_LIST = "SELECT * FROM [BirdFarmShop].[dbo].[Accessory] "
            + "ORDER BY [unit_price] ASC OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
    private static final String GET_SEARCH_ACCESSORIES = " SELECT *\n"
            + " FROM [BirdFarmShop].[dbo].[Accessory]\n"
            + " WHERE [accessory_name] LIKE ?'";
    private static final String GET_ACCESSORY_BY_ID = "SELECT * FROM Accessory WHERE accessory_id = ?";
    
    public ArrayList<Accessory> getAccessories() throws SQLException {
        ArrayList<Accessory> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ImageDAO ID = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM [BirdFarmShop].[dbo].[Accessory]";
                st = con.prepareStatement(sql);
                rs = st.executeQuery();
                while (rs.next()) {
                    String accessory_id = rs.getString("accessory_id");
                    String accessory_name = rs.getString("accessory_name");
                    String category_id = rs.getString("category_id");
                    int unit_price = rs.getInt("unit_price");
                    int stock_quantity = rs.getInt("stock_quantity");
                    String description = rs.getString("description");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    String image_url = ID.getThumbnailUrlByAccessoryId(accessory_id);
                    list.add(new Accessory(accessory_id, accessory_name, category_id, unit_price, stock_quantity, description, discount, status, image_url));
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public ArrayList<Accessory> getAccessoriesCustom(String search, String category, String price, String page, int recordsPerPage) throws SQLException {
        ArrayList<Accessory> list = new ArrayList<>();
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        ImageDAO ID = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM [BirdFarmShop].[dbo].[Accessory]\n";
                if (search != null) {
                    sql += " WHERE accessory_name LIKE N'%" + search + "%'\n";
                    if (category != null) {
                        sql += " AND category_id = " + "'" + category + "'" + "\n";
                    }
                    if (price != null) {
                        sql += " AND " + price + "\n";
                    }
                }
                if (search == null && category != null) {
                    sql += " WHERE category_id = " + "'" + category + "'" + "\n";
                    if (price != null) {
                        sql += " AND " + price + "\n";
                    }
                }
                if (search == null && category == null
                        && price != null) {
                    sql += " WHERE " + price + "\n";
                }
                if (page != null) {
                    int pageNumber = Integer.parseInt(page);
                    int start = (pageNumber - 1) * recordsPerPage;
                    sql += "ORDER BY (SELECT NULL) OFFSET " + start + " ROWS FETCH NEXT " + recordsPerPage + " ROWS ONLY";
                }
                st = con.createStatement();
                rs = st.executeQuery(sql);
                while (rs.next()) {
                    String accessory_id = rs.getString("accessory_id");
                    String accessory_name = rs.getString("accessory_name");
                    String category_id = rs.getString("category_id");
                    int unit_price = rs.getInt("unit_price");
                    int stock_quantity = rs.getInt("stock_quantity");
                    String description = rs.getString("description");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    String image_url = ID.getThumbnailUrlByAccessoryId(accessory_id);
                    list.add(new Accessory(accessory_id, accessory_name, category_id, unit_price, stock_quantity, description, discount, status, image_url));
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public int totalAccessories(String search, String category, String price) throws SQLException {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        int number = 0;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT COUNT(accessory_id)AS Amount FROM [BirdFarmShop].[dbo].[Accessory]\n";
                if (search != null) {
                    sql += " WHERE accessory_name LIKE N'%" + search + "%'\n";
                    if (category != null) {
                        sql += " AND category_id = " + "'" + category + "'" + "\n";
                    }
                    if (price != null) {
                        sql += " AND " + price + "\n";
                    }
                }
                if (search == null && category != null) {
                    sql += " WHERE category_id = " + "'" + category + "'" + "\n";
                    if (price != null) {
                        sql += " AND " + price + "\n";
                    }
                }
                if (search == null && category == null
                        && price != null) {
                    sql += " WHERE " + price + "\n";
                }
                st = con.createStatement();
                rs = st.executeQuery(sql);
                if (rs != null && rs.next()) {
                    number = rs.getInt("Amount");
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return number;
    }

    public AccessoryDTO getAccessoryDetailsByID(String accessory_id) throws SQLException {
        AccessoryDTO a = null;
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ImageDAO ID = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM [BirdFarmShop].[dbo].[Accessory] WHERE [accessory_id] = ?";
                st = con.prepareStatement(sql);
                st.setString(1, accessory_id);
                rs = st.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("accessory_id");
                    String accessory_name = rs.getString("accessory_name");
                    int unit_price = rs.getInt("unit_price");
                    int stock_quantity = rs.getInt("stock_quantity");
                    String description = rs.getString("description");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    ArrayList<String> image_url = ID.getImagesByAccessoryId(accessory_id);
                    a = new AccessoryDTO(id, accessory_name, unit_price, stock_quantity, description, discount, status, image_url);
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return a;
    }

    public Accessory getAccessoryByID(String accessoryId) throws SQLException {
        Accessory accessory = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_ACCESSORY_BY_ID);
                stm.setString(1, accessoryId);
                rs = stm.executeQuery();
                if (rs != null && rs.next()) {
                    String accessory_id = rs.getString("accessory_id");
                    String accessory_name = rs.getString("accessory_name");
                    String category_id = rs.getString("category_id");
                    int unit_price = rs.getInt("unit_price");
                    int stock_quantity = rs.getInt("stock_quantity");
                    String description = rs.getString("description");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    String image_url = imgDao.getThumbnailUrlByAccessoryId(accessory_id);
                    accessory = new Accessory(accessory_id, accessory_name, category_id, unit_price, stock_quantity, description, discount, status, image_url);
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
        return accessory;
    }
    
    public List<Accessory> getNext9Accessory(int amount) throws SQLException {
        List<Accessory> next9AccessoryList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_NEXT_9_ACCESSORY_LIST);
                stm.setInt(1, amount);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String accessory_id = rs.getString("accessory_id");
                    String accessory_name = rs.getString("accessory_name");
                    String category_id = rs.getString("category_id");
                    int unit_price = rs.getInt("unit_price");
                    int stock_quantity = rs.getInt("stock_quantity");
                    String description = rs.getString("description");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    String image_url = imgDao.getThumbnailUrlByAccessoryId(accessory_id);
                    next9AccessoryList.add(new Accessory(accessory_id, accessory_name, category_id, unit_price, stock_quantity, description, discount, status, image_url));
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
        return next9AccessoryList;
    }

    public List<Accessory> getSearchAccessory(String name) throws SQLException {
        List<Accessory> next9AccessoryList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT *\n"
                        + "FROM [BirdFarmShop].[dbo].[Accessory]\n"
                        + "WHERE [accessory_name] LIKE ?");
                stm.setString(1, "%" + name + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String accessory_id = rs.getString("accessory_id");
                    String accessory_name = rs.getString("accessory_name");
                    String category_id = rs.getString("category_id");
                    int unit_price = rs.getInt("unit_price");
                    int stock_quantity = rs.getInt("stock_quantity");
                    String description = rs.getString("description");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    String image_url = imgDao.getThumbnailUrlByAccessoryId(accessory_id);
                    next9AccessoryList.add(new Accessory(accessory_id, accessory_name, category_id, unit_price, stock_quantity, description, discount, status, image_url));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions here, e.g., log or throw
        } finally {
            // Close resources in the finally block
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return next9AccessoryList;
    }
}
