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
import swp391.birdfarmshop.dto.BirdDTO;
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.util.DBUtils;

/**
 *
 * @author tlminh
 */
public class BirdDAO {

    private static final String GET_BIRD_LIST = "SELECT [bird_id],[bird_name],[color],[age],[grown_age],[gender],[breed_id]"
            + ",[achievement],[reproduction_history],[price],[description],[dad_bird_id]"
            + ",[mom_bird_id],[discount],[status]FROM [BirdFarmShop].[dbo].[Bird]";
    private static final String GET_NEXT_9_BIRD_LIST = "SELECT [bird_id],[bird_name],[color],[age],[grown_age],[gender],[breed_id]"
            + ",[achievement],[reproduction_history],[price],[description],[dad_bird_id]"
            + ",[mom_bird_id],[discount],[status] FROM [BirdFarmShop].[dbo].[Bird] "
            + "ORDER BY [price] ASC OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
    private static final String GET_BIRD_NAME_BY_ID = "SELECT [bird_name] FROM [Bird] WHERE [bird_id] = ?";
    private static final String GET_BIRD_BY_ID = "SELECT * FROM [Bird] WHERE [bird_id] = ?";

    public List<Bird> getBirds() throws SQLException {
        List<Bird> birdList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_BIRD_LIST);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String bird_id = rs.getString("bird_id");
                    String bird_name = rs.getString("bird_name");
                    String color = rs.getString("color");
                    int age = rs.getInt("age");
                    int grown_age = rs.getInt("grown_age");
                    boolean gender = rs.getBoolean("gender");
                    String breed_id = rs.getString("breed_id");
                    String achievement = rs.getString("achievement");
                    int reproduction_history = rs.getInt("reproduction_history");
                    int price = rs.getInt("price");
                    String description = rs.getString("description");
                    String dad_bird_id = rs.getString("dad_bird_id");
                    String mom_bird_id = rs.getString("mom_bird_id");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    String image_url = imgDao.getThumbnailUrlByBirdId(bird_id);
                    Bird bird = new Bird(bird_id, bird_name, color, age, grown_age, gender, breed_id,
                            achievement, reproduction_history, price, description, dad_bird_id, mom_bird_id, discount, status, image_url);
                    birdList.add(bird);
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
        return birdList;
    }

    public List<Bird> getNext9Birds(int amount) throws SQLException {
        List<Bird> next9BirdList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_NEXT_9_BIRD_LIST);
                stm.setInt(1, amount);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String bird_id = rs.getString("bird_id");
                    String bird_name = rs.getString("bird_name");
                    String color = rs.getString("color");
                    int age = rs.getInt("age");
                    int grown_age = rs.getInt("grown_age");
                    boolean gender = rs.getBoolean("gender");
                    String breed_id = rs.getString("breed_id");
                    String achievement = rs.getString("achievement");
                    int reproduction_history = rs.getInt("reproduction_history");
                    int price = rs.getInt("price");
                    String description = rs.getString("description");
                    String dad_bird_id = rs.getString("dad_bird_id");
                    String mom_bird_id = rs.getString("mom_bird_id");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    String image_url = imgDao.getThumbnailUrlByBirdId(bird_id);
                    Bird bird = new Bird(bird_id, bird_name, color, age, grown_age, gender, breed_id,
                            achievement, reproduction_history, price, description, dad_bird_id, mom_bird_id, discount, status, image_url);
                    next9BirdList.add(bird);
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
        return next9BirdList;
    }

    public BirdDTO getBirdDetailsById(String birdId) throws SQLException {
        BirdDTO bird = new BirdDTO();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        BirdBreedDAO breedDao = new BirdBreedDAO();
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_BIRD_BY_ID);
                stm.setString(1, birdId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String bird_id = rs.getString("bird_id");
                    String bird_name = rs.getString("bird_name");
                    String color = rs.getString("color");
                    int age = rs.getInt("age");
                    int grown_age = rs.getInt("grown_age");
                    boolean sex = rs.getBoolean("gender");
                    String gender = "";
                    if (sex) {
                        gender = "Ð?c";
                    } else {
                        gender = "Cái";
                    }
                    String breed_id = rs.getString("breed_id");
                    String breed_name = breedDao.getBreedNameById(breed_id);
                    String achievement = rs.getString("achievement");
                    int reproduction_history = rs.getInt("reproduction_history");
                    int price = rs.getInt("price");
                    String description = rs.getString("description");
                    String dad_bird_id = rs.getString("dad_bird_id");
                    String dad_bird_name = getBirdNameById(dad_bird_id);
                    String mom_bird_id = rs.getString("mom_bird_id");
                    String mom_bird_name = getBirdNameById(mom_bird_id);
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    ArrayList<String> image_urls = imgDao.getImagesByBirdId(birdId);
                    bird = new BirdDTO(bird_id, bird_name, color, age, grown_age, gender, breed_id, breed_name,
                            achievement, reproduction_history, price, description, dad_bird_id, dad_bird_name, mom_bird_id, mom_bird_name, discount, status,image_urls);
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
        return bird;
    }

    public String getBirdNameById(String bird_id) throws SQLException {
        String result = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_BIRD_BY_ID);
                ptm.setString(1, bird_id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    result = rs.getString("bird_name");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
//    public static void main(String[] args) throws SQLException {
//        BirdDAO dao = new BirdDAO();
//        BirdDTO bird = dao.getBirdDetailsById("CL201");
//        System.out.println(bird.getImage_urls());
//        for (String url : bird.getImage_urls()) {
//            System.out.println(url);
//        }
//    }
}
