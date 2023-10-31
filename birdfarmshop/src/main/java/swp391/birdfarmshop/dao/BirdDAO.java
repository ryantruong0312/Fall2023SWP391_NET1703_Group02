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
import static java.sql.Types.NULL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
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

    private static final String GET_BIRD_LIST = "SELECT [bird_id],[bird_name],[color],DATEDIFF(MONTH, birthday, GETDATE()) AS age,[grown_age],[gender],[breed_id]"
            + ",[achievement],[reproduction_history],[price],[description]"
            + ",[discount],[status]FROM [BirdFarmShop].[dbo].[Bird]";
    private static final String GET_BIRD_NAME_BY_ID = "SELECT [bird_name] FROM [Bird] WHERE [bird_id] = ?";
    private static final String GET_BIRD_BY_ID = "SELECT DATEDIFF(MONTH, birthday, GETDATE()) AS age, * FROM [Bird] WHERE [bird_id] = ?";
    private static final String IS_BIRD_SOLD_OUT = "SELECT [status] FROM [Bird] WHERE [bird_id] = ? AND [status] = N'Đã bán'";
    private static final String GET_BIRD_BY_BREED_ID = "SELECT [bird_id],[bird_name],[color]\n"
            + "      ,DATEDIFF(MONTH, birthday, GETDATE()) AS age,[grown_age] ,[gender]\n"
            + "      ,[breed_id] ,[achievement]\n"
            + "      ,[reproduction_history]\n"
            + "      ,[price],[description]\n"
            + "      ,[discount],[status]\n"
            + "  FROM [BirdFarmShop].[dbo].[Bird]\n"
            + "  WHERE breed_id = ?";
    private static final String GET_BIRDS_BY_GENDER = "SELECT [bird_id],[bird_name]  FROM [Bird] WHERE [gender] = ?";

    public List<Bird> getBirds() throws SQLException {
        List<Bird> birdList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        // Get the current date
        LocalDate currentDate = LocalDate.now();
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
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    String image_url = imgDao.getThumbnailUrlByBirdId(bird_id);
                    Bird bird = new Bird(bird_id, bird_name, color, age, grown_age, gender, breed_id,
                            achievement, reproduction_history, price, description, discount, status, image_url);
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

    public List<Bird> getBirdsCustom(String search, String breed, String price_birds, String gender_bird,
            String age_bird, String page, int recordsPerPage) throws SQLException {
        List<Bird> birdList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT [bird_id],[bird_name],[color],DATEDIFF(MONTH, birthday, GETDATE()) AS age,[grown_age],[gender],[breed_id]"
                        + ",[achievement],[reproduction_history],[price],[description]"
                        + ",[discount],[status]\n"
                        + " FROM [BirdFarmShop].[dbo].[Bird]\n";
                if (search != null) {
                    sql += " WHERE bird_name LIKE N'%" + search + "%'";
                    if (breed != null) {
                        sql += " AND breed_id = " + "'" + breed + "'" + "";
                    }
                    if (price_birds != null) {
                        sql += " AND " + price_birds;
                    }
                    if (gender_bird != null) {
                        sql += " AND gender = " + gender_bird;
                    }
                    if (age_bird != null) {
                        sql += " AND " + age_bird;
                    }
                    sql += "\n";
                }
                if (search == null && breed != null) {
                    sql += " WHERE breed_id = " + "'" + breed + "'" + "";
                    if (price_birds != null) {
                        sql += " AND " + price_birds;
                    }
                    if (gender_bird != null) {
                        sql += " AND gender = " + gender_bird;
                    }
                    if (age_bird != null) {
                        sql += " AND " + age_bird;
                    }
                    sql += "\n";
                }

                if (search == null && breed == null
                        && price_birds != null) {
                    sql += " WHERE " + price_birds;
                    if (gender_bird != null) {
                        sql += " AND gender = " + gender_bird;
                    }
                    if (age_bird != null) {
                        sql += " AND " + age_bird;
                    }
                    sql += "\n";
                }

                if (search == null && breed == null
                        && price_birds == null && gender_bird != null) {
                    sql += " WHERE gender = " + gender_bird;
                    if (age_bird != null) {
                        sql += " AND " + age_bird;
                    }
                    sql += "\n";
                }
                if (search == null && breed == null
                        && price_birds == null && gender_bird == null
                        && age_bird != null) {
                    sql += " WHERE" + age_bird + "\n";
                }
                if (page != null) {
                    int pageNumber = Integer.parseInt(page);
                    int start = (pageNumber - 1) * recordsPerPage;
                    sql += "ORDER BY (SELECT NULL) OFFSET " + start + " ROWS FETCH NEXT " + recordsPerPage + " ROWS ONLY";
                }
                stm = con.prepareStatement(sql);
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
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    String image_url = imgDao.getThumbnailUrlByBirdId(bird_id);
                    Bird bird = new Bird(bird_id, bird_name, color, age, grown_age, gender, breed_id,
                            achievement, reproduction_history, price, description, discount, status, image_url);
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

    public int totalBirds(String search, String breed, String price_birds, String gender_bird,
            String age_bird) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int total = 0;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT COUNT(bird_id) AS [numberOfBird] \n"
                        + " FROM [BirdFarmShop].[dbo].[Bird]\n";
                if (search != null) {
                    sql += " WHERE bird_name LIKE N'%" + search + "%'";
                    if (breed != null) {
                        sql += " AND breed_id = " + "'" + breed + "'" + "";
                    }
                    if (price_birds != null) {
                        sql += " AND " + price_birds;
                    }
                    if (gender_bird != null) {
                        sql += " AND gender = " + gender_bird;
                    }
                    if (age_bird != null) {
                        sql += " AND " + age_bird;
                    }
                    sql += "\n";
                }
                if (search == null && breed != null) {
                    sql += " WHERE breed_id = " + "'" + breed + "'" + "";
                    if (price_birds != null) {
                        sql += " AND " + price_birds;
                    }
                    if (gender_bird != null) {
                        sql += " AND gender = " + gender_bird;
                    }
                    if (age_bird != null) {
                        sql += " AND " + age_bird;
                    }
                    sql += "\n";
                }

                if (search == null && breed == null
                        && price_birds != null) {
                    sql += " WHERE " + price_birds;
                    if (gender_bird != null) {
                        sql += " AND gender = " + gender_bird;
                    }
                    if (age_bird != null) {
                        sql += " AND " + age_bird;
                    }
                    sql += "\n";
                }

                if (search == null && breed == null
                        && price_birds == null && gender_bird != null) {
                    sql += " WHERE gender = " + gender_bird;
                    if (age_bird != null) {
                        sql += " AND " + age_bird;
                    }
                    sql += "\n";
                }
                if (search == null && breed == null
                        && price_birds == null && gender_bird == null
                        && age_bird != null) {
                    sql += " WHERE" + age_bird + "\n";
                }
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs != null && rs.next()) {
                    total = rs.getInt("numberOfBird");
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
        return total;
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
                    Date birdthday = rs.getDate("birthday");
                    int age = rs.getInt("age");
                    int grown_age = rs.getInt("grown_age");
                    boolean sex = rs.getBoolean("gender");
                    String gender = "";
                    if (sex) {
                        gender = "Đực";
                    } else {
                        gender = "Cái";
                    }
                    String breed_id = rs.getString("breed_id");
                    String breed_name = breedDao.getBreedNameById(breed_id);
                    String achievement = rs.getString("achievement");
                    int reproduction_history = rs.getInt("reproduction_history");
                    int price = rs.getInt("price");
                    String description = rs.getString("description");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    ArrayList<String> image_urls = imgDao.getImagesByBirdId(birdId);
                    bird = new BirdDTO(bird_id, bird_name, color, birdthday, age, grown_age, gender, breed_id, breed_name,
                            achievement, reproduction_history, price, description, discount, status, image_urls);
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

    public boolean isBirdSoldOut(String bird_id) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(IS_BIRD_SOLD_OUT);
                ptm.setString(1, bird_id);
                rs = ptm.executeQuery();
                if (rs != null && rs.next()) {
                    result = true;
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

    public List<Bird> getBirdsByBreedId(String breed_id) throws SQLException, ClassNotFoundException {
        List<Bird> birdList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                pst = con.prepareStatement(GET_BIRD_BY_BREED_ID);
                pst.setString(1, breed_id);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String bird_id = rs.getString("bird_id");
                    String bird_name = rs.getString("bird_name");
                    String color = rs.getString("color");
                    int age = rs.getInt("age");
                    int grown_age = rs.getInt("grown_age");
                    boolean gender = rs.getBoolean("gender");
                    String achievement = rs.getString("achievement");
                    int reproduction_history = rs.getInt("reproduction_history");
                    int price = rs.getInt("price");
                    String description = rs.getString("description");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    String image_url = imgDao.getThumbnailUrlByBirdId(bird_id);
                    Bird bird = new Bird(bird_id, bird_name, color, age, grown_age, gender, breed_id,
                            achievement, reproduction_history, price, description, discount, status, image_url);
                    birdList.add(bird);
                }
            }
        } finally {
            if (pst != null) {
                pst.close();
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

    public Bird getBirdById(String birdId) throws SQLException {
        Bird b = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_BIRD_BY_ID);
                stm.setString(1, birdId);
                rs = stm.executeQuery();
                if (rs != null && rs.next()) {
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
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    String image_url = imgDao.getThumbnailUrlByBirdId(bird_id);
                    b = new Bird(bird_id, bird_name, color, age, grown_age, gender, breed_id,
                            achievement, reproduction_history, price, description, discount, status, image_url);

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
        return b;
    }

    public boolean addNewBird(String bird_id, String bird_name, String color, String birthday, String grown_age,
            String gender, String breed_id, String achievement, String reproduction_history, String price, String description,
            String discount, String status) throws SQLException, NumberFormatException, ParseException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean sex;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = dateFormat.parse(birthday);
        Date sqlDate = new Date(utilDate.getTime());
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement("INSERT INTO [dbo].[Bird]\n"
                        + "             ([bird_id],[bird_name],[color],[birthday],[grown_age],[gender],[breed_id],[achievement],"
                        + "             [reproduction_history],[price],[description],[discount],[status])\n"
                        + "             VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?) ");
                stm.setString(1, bird_id);
                stm.setString(2, bird_name);
                if (color != null && !color.isEmpty()) {
                    stm.setString(3, color);
                } else {
                    stm.setString(3, null);
                }
                stm.setDate(4, sqlDate);
                stm.setInt(5, Integer.parseInt(grown_age));
                sex = gender.equals("Đực");
                stm.setBoolean(6, sex);
                stm.setString(7, breed_id);
                if(achievement != null && !achievement.isEmpty()) {
                    stm.setString(8, achievement);
                } else {
                    stm.setString(8, null);
                }
                stm.setInt(9, Integer.parseInt(reproduction_history));
                stm.setInt(10, Integer.parseInt(price));
                if(description != null && !description.isEmpty()) {
                    stm.setString(11, description);
                } else {
                    stm.setString(11, null);
                }
                if (discount != null && !discount.isEmpty()) {
                    stm.setInt(12, Integer.parseInt(discount));
                } else {
                    stm.setInt(12, 0);
                }
                stm.setString(13, status);
                int row = stm.executeUpdate();
                if (row > 0) {
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

    public List<BirdDTO> getAllBirds() throws SQLException {
        List<BirdDTO> birds = new ArrayList<>();
        BirdDTO bird;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {

                stm = con.prepareStatement("SELECT [bird_id],[bird_name],[color],[birthday],"
                        + "DATEDIFF(MONTH, birthday, GETDATE()) AS age,[grown_age],[gender],bird.[breed_id] AS breed_id,breed.[breed_name] AS breed_name,\n"
                        + "[achievement],[reproduction_history],[price],[description],[discount],[status]\n"
                        + "FROM [BirdFarmShop].[dbo].[Bird] AS bird\n"
                        + "LEFT JOIN BirdBreed AS breed\n"
                        + "ON bird.breed_id = breed.breed_id");

                rs = stm.executeQuery();
                while (rs.next()) {
                    String bird_id = rs.getString("bird_id");
                    String bird_name = rs.getString("bird_name");
                    String color = rs.getString("color");
                    Date birthday = rs.getDate("birthday");
                    int age = rs.getInt("age");
                    int grown_age = rs.getInt("grown_age");
                    boolean sex = rs.getBoolean("gender");
                    String gender;
                    if (sex) {
                        gender = "Đực";
                    } else {
                        gender = "Cái";
                    }
                    String breed_id = rs.getString("breed_id");
                    String breed_name = rs.getString("breed_name");
                    String achievement = rs.getString("achievement");
                    int reproduction_history = rs.getInt("reproduction_history");
                    int price = rs.getInt("price");
                    String description = rs.getString("description");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    ArrayList<String> image_urls = imgDao.getImagesByBirdId(bird_id);
                    bird = new BirdDTO(bird_id, bird_name, color, birthday, age, grown_age, gender, breed_id, breed_name,
                            achievement, reproduction_history, price, description, discount, status, image_urls);
                    birds.add(bird);
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
        return birds;
    }

    public ArrayList<BirdDTO> getBirdsByGender(boolean gender) throws SQLException, ClassNotFoundException {
        ArrayList<BirdDTO> arrlist_b = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_BIRDS_BY_GENDER);
                stm.setBoolean(1, gender);
                rs = stm.executeQuery();
                while (rs != null && rs.next()) {
                    String bird_id = rs.getString("bird_id");
                    String bird_name = rs.getString("bird_name");
                    BirdDTO b = new BirdDTO();
                    b.setBird_name(bird_name);
                    b.setBird_id(bird_id);
                    arrlist_b.add(b);
                }
            }
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
        return arrlist_b;
    }

    public boolean updateBird(String bird_id, String bird_name, String color, String birthday, String grown_age,
             String gender, String breed_id, String achievement, String reproduction_history, String price, String description,
             String discount, String status) throws SQLException, ParseException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean sex;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = dateFormat.parse(birthday);
        Date sqlDate = new Date(utilDate.getTime());
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String query =          "UPDATE [dbo].[Bird]\n"
                        + "             SET [bird_name] = ?,[color] = ?,[birthday] = ?,[grown_age] = ?,[gender] = ?,[breed_id] = ?,\n"
                        + "             [price] = ?,[status] = ?,[reproduction_history] = ?,[discount] = ?,[achievement] = ?, "
                        + "             [description] = ?\n"
                        + "             WHERE [bird_id] = ?";
                stm = con.prepareStatement(query);
                if(!bird_name.contains(bird_id)) {
                    bird_name = bird_name + " " + bird_id;
                }
                stm.setString(1, bird_name.trim());
                stm.setString(2, color);
                stm.setDate(3, sqlDate);
                stm.setInt(4, Integer.parseInt(grown_age));
                sex = gender.equals("Đực");
                stm.setBoolean(5, sex);
                stm.setString(6, breed_id);
                stm.setInt(7, Integer.parseInt(price));
                stm.setString(8, status);
                if (reproduction_history != null) {
                    stm.setInt(9, Integer.parseInt(reproduction_history));
                } else {
                    stm.setInt(9, 0);
                }
                if (discount != null) {
                    stm.setInt(10, Integer.parseInt(discount));
                } else {
                    stm.setInt(10, 0);
                }
                if(achievement != null) {
                    stm.setString(11, achievement);
                } else {
                    stm.setString(11, "");
                }
                if(description != null) {
                    stm.setString(12, description);
                } else {
                    stm.setString(12, "");
                }
                stm.setString(13, bird_id);
                int row = stm.executeUpdate();
                if (row > 0) {
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
    
    public boolean updateBirdStatus(String status, String bird_id) throws SQLException, ParseException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String query =          "UPDATE [dbo].[Bird]\n"
                        + "             SET [status] = ?\n"
                        + "             WHERE [bird_id] = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, status);
                stm.setString(2, bird_id);
                int row = stm.executeUpdate();
                if (row > 0) {
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
  public ArrayList<Integer> getBirdAmount() throws SQLException{
    
        ArrayList<Integer> bird = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT COUNT(bird_id) AS [totalBird],\n"
                        + "	   COUNT(CASE WHEN [status] = N'Còn hàng' THEN 1 END) AS [available],\n"
                        + "	   COUNT(CASE WHEN [status] = N'Đang sinh sản' THEN 1 END) AS [reproduction],\n"
                        + "	   COUNT(CASE WHEN [status] = N'Đã bán' THEN 1 END) AS [sold]\n"
                        + "FROM [BirdFarmShop].[dbo].[Bird]";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs != null && rs.next()) {
                    bird.add(rs.getInt("totalBird"));
                    bird.add(rs.getInt("available"));
                    bird.add(rs.getInt("reproduction"));
                    bird.add(rs.getInt("sold"));
                }
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }finally {
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
}
