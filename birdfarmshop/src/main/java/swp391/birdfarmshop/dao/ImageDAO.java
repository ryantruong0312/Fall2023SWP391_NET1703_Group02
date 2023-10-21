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
//import java.util.List;
//import swp391.birdfarmshop.model.Bird;
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

    public boolean addNewImageBirdNest(String url, String is_thumbnail, String nest_id) throws SQLException {
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
                stm.setString(3, null);
                stm.setString(4, nest_id);
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

    public boolean updateImageAccessory(String txtAccessoryID, boolean type, String urlImage, String ImageID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int rs = 0;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(" UPDATE [BirdFarmShop].[dbo].[Image]\n"
                        + "  SET [image_url] = ? \n"
                        + "  WHERE [accessory_id] = ? AND is_thumbnail = ? AND [image_id] = ?");
                stm.setString(1, urlImage);
                stm.setString(2, txtAccessoryID);
                stm.setBoolean(3, type);
                stm.setInt(4, Integer.parseInt(ImageID));
                rs = stm.executeUpdate();
                if (rs > 0) {
                    return true;
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions here, e.g., log or throw
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

    public boolean updateThumbnailImageAccessory(String txtAccessoryID, boolean type, String urlImage) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int rs = 0;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(" UPDATE [BirdFarmShop].[dbo].[Image]\n"
                        + "  SET [image_url] = ? \n"
                        + "  WHERE [accessory_id] = ? AND is_thumbnail = ?");
                stm.setString(1, urlImage);
                stm.setString(2, txtAccessoryID);
                stm.setBoolean(3, type);
                rs = stm.executeUpdate();
                if (rs > 0) {
                    return true;
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions here, e.g., log or throw
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

    public ArrayList<Image> getImageByAccessoryId(String accessoryId) throws SQLException {
        ArrayList<Image> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement("  SELECT [image_id] ,[image_url] ,[is_thumbnail], [bird_id], [nest_id], [accessory_id]\n"
                        + "  FROM [BirdFarmShop].[dbo].[Image]\n"
                        + "  WHERE [accessory_id] = ? AND [is_thumbnail] = 0");
                stm.setString(1, accessoryId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int image_id = rs.getInt("image_id");
                    String image_url = rs.getString("image_url");
                    boolean is_thumbnail = rs.getBoolean("is_thumbnail");
                    String bird_id = rs.getString("bird_id");
                    String nest_id = rs.getString("nest_id");
                    String accessory_id = rs.getString("accessory_id");
                    Image image = new Image(image_id, image_url, is_thumbnail, bird_id, nest_id, accessory_id);
                    list.add(image);
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
        return list;
    }

    public boolean updateImageBird(String url, String bird_id) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement("UPDATE [dbo].[Image]\n"
                        + "                 SET [image_url] = ?\n"
                        + "                 WHERE [bird_id] = ?");
                stm.setString(1, url);
                stm.setString(2, bird_id);

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
    
     public boolean updateImageBirdNest(String url, String nest_id) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement("UPDATE [dbo].[Image]\n"
                        + "                 SET [image_url] = ?\n"
                        + "                 WHERE [nest_id] = ?");
                stm.setString(1, url);
                stm.setString(2, nest_id);

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
