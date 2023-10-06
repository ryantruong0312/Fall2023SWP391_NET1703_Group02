/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.model.Image;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author tlminh
 */
public class ImageDAO {

    private static final String GET_THUMBNAIL_BY_BIRD_ID = "SELECT [image_url] FROM [BirdFarmShop].[dbo].[Image] WHERE [bird_id] = ? AND [is_thumbnail] = 1";
    private static final String GET_IMAGES_BY_BIRD_ID = "SELECT [image_url] FROM [BirdFarmShop].[dbo].[Image] WHERE [bird_id] = ?";
    private static final String GET_THUMBNAIL_BY_ACCESSORY_ID = "SELECT [image_url] FROM [BirdFarmShop].[dbo].[Image] WHERE [accessory_id] = ? AND [is_thumbnail] = 1";
    private static final String GET_IMAGES_BY_ACCESSORY_ID = "SELECT [image_url] FROM [BirdFarmShop].[dbo].[Image] WHERE [accessory_id] = ?";
    private static final String GET_THUMBNAIL_BY_BIRDNEST_ID = "SELECT [image_url] FROM [BirdFarmShop].[dbo].[Image] WHERE [nest_id] = ? AND [is_thumbnail] = 1";
    private static final String GET_IMAGES_BY_BIRDNEST_ID = "SELECT [image_url] FROM [BirdFarmShop].[dbo].[Image] WHERE [nest_id] = ?";

    public String getThumbnailUrlByBirdId(String birdId) throws SQLException {
        String url = "";
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_THUMBNAIL_BY_BIRD_ID);
                stm.setString(1, birdId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    url = rs.getString("image_url");
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
        return url;
    }

    public ArrayList<String> getImagesByBirdId(String birdId) throws SQLException {
        ArrayList<String> urls = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_IMAGES_BY_BIRD_ID);
                stm.setString(1, birdId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String url = rs.getString("image_url");
                    urls.add(url);
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
        return urls;
    }
//    public static void main(String[] args) throws SQLException {
//        ImageDAO dao = new ImageDAO();
//        ArrayList<String> url = dao.getImagesByBirdId("CP101");
//        System.out.println(url);
//    }

    public ArrayList<String> getImagesByAccessoryId(String accessoryId) throws SQLException {
        ArrayList<String> urls = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_IMAGES_BY_ACCESSORY_ID);
                stm.setString(1, accessoryId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String url = rs.getString("image_url");
                    urls.add(url);
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
        return urls;
    }

    public ArrayList<String> getImagesByBirdNestId(int birdnestId) throws SQLException {
        ArrayList<String> urls = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_IMAGES_BY_BIRDNEST_ID);
                stm.setInt(1, birdnestId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String url = rs.getString("image_url");
                    urls.add(url);
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
        return urls;
    }

    public String getThumbnailUrlByAccessoryId(String accessoryId) throws SQLException {
        String url = "";
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_THUMBNAIL_BY_ACCESSORY_ID);
                stm.setString(1, accessoryId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    url = rs.getString("image_url");
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
        return url;
    }

    public ArrayList<String> getUrlByAccessoryId(String accessoryId) throws SQLException {
        ArrayList<String> url = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String urls = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(" select [image_url]\n"
                        + "  FROM [BirdFarmShop].[dbo].[Image]\n"
                        + "  where [accessory_id] = ? and [is_thumbnail] = 0");
                stm.setString(1, accessoryId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    urls = rs.getString("image_url");
                    url.add(urls);
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
        return url;
    }

    public static void main(String[] args) throws SQLException {
        ImageDAO im = new ImageDAO();
        ArrayList<String> list = im.getUrlByAccessoryId("LN001");
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(0));
        }
    }

    public String getThumbnailUrlByBirdNestId(String birdNestID) throws SQLException {
        String url = "";
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_THUMBNAIL_BY_BIRDNEST_ID);
                stm.setString(1, birdNestID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    url = rs.getString("image_url");
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
        return url;
    }

    public boolean addNewImageBird(String url, String is_thumbnail, String bird_id) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean is_thumbnaill;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement("INSERT INTO [dbo].[Image]\n"
                        + "           ([image_url],[is_thumbnail],[bird_id],[nest_id],[accessory_id])\n"
                        + "           VALUES (?,?,?,?,?)");
                stm.setString(1, url);
                if (is_thumbnail.equals("1")) {
                    is_thumbnaill = true;
                } else {
                    is_thumbnaill = false;
                }
                stm.setBoolean(2, is_thumbnaill);
                stm.setString(3, bird_id);
                stm.setString(4, null);
                stm.setString(5, null);

                rs = stm.executeQuery();
                if (rs.next()) {
                    return true;
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
        return false;
    }

    public boolean addNewAccessoryImage(String url, boolean type, String accessoryID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement("INSERT INTO [BirdFarmShop].[dbo].[Image] ([image_url], [is_thumbnail], [bird_id], [nest_id], [accessory_id])\n"
                        + "VALUES(?, ?, ?, ?, ?)");
                stm.setString(1, url);
                stm.setBoolean(2, type);
                stm.setString(3, null);
                stm.setString(4, null);
                stm.setString(5, accessoryID);

                int rs = stm.executeUpdate();
                if (rs > 0) {
                    return true;
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
        }
        return false;
    }
}
