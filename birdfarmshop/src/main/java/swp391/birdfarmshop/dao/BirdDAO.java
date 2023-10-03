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
import java.time.Period;
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

    private static final String GET_BIRD_LIST = "SELECT [bird_id],[bird_name],[color],[birthday],[grown_age],[gender],[breed_id]"
            + ",[achievement],[reproduction_history],[price],[description],[dad_bird_id]"
            + ",[mom_bird_id],[discount],[status]FROM [BirdFarmShop].[dbo].[Bird]";
    private static final String GET_TOTAL_BIRD = "SELECT COUNT(*) AS [TotalCount] FROM [BirdFarmShop].[dbo].[Bird]";
    private static final String GET_9_BIRD_LIST = "SELECT [bird_id],[bird_name],[color],[age],[grown_age],[gender],[breed_id]"
            + ",[achievement],[reproduction_history],[price],[description],[dad_bird_id]"
            + ",[mom_bird_id],[discount],[status] FROM [BirdFarmShop].[dbo].[Bird] "
            + "ORDER BY (SELECT NULL) OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
    private static final String GET_BIRD_NAME_BY_ID = "SELECT [bird_name] FROM [Bird] WHERE [bird_id] = ?";
    private static final String GET_BIRD_BY_ID = "SELECT * FROM [Bird] WHERE [bird_id] = ?";
    private static final String IS_BIRD_SOLD_OUT = "SELECT [status] FROM [Bird] WHERE [bird_id] = ? AND [status] = N'Đã bán'";
    private static final String SEARCH_BIRDS_BY_NAME = "SELECT [bird_id],[bird_name],[color],[age],[grown_age],[gender],[breed_id]"
            + ",[achievement],[reproduction_history],[price],[description],[dad_bird_id]"
            + ",[mom_bird_id],[discount],[status] FROM [BirdFarmShop].[dbo].[Bird]"
            + "WHERE [bird_name] LIKE ? "
            + "ORDER BY (SELECT NULL) OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
    private static final String NUMBER_OF_BIRD_LIST_SEARCH = "SELECT COUNT(*) AS [TotalCount]"
            + "FROM [BirdFarmShop].[dbo].[Bird]"
            + "WHERE [bird_name] LIKE ? ";
    private static final String GET_BIRD_BY_BREED_ID = "SELECT [bird_id],[bird_name],[color]\n"
            + "      ,[age],[grown_age] ,[gender]\n"
            + "      ,[breed_id] ,[achievement]\n"
            + "      ,[reproduction_history]\n"
            + "      ,[price],[description]\n"
            + "      ,[dad_bird_id],[mom_bird_id]\n"
            + "      ,[discount],[status]\n"
            + "  FROM [BirdFarmShop].[dbo].[Bird]\n"
            + "  WHERE breed_id = ?";
    private static final String GET_BIRD_BY_BREED_ID_PAGING = "SELECT [bird_id],[bird_name],[color],[age],[grown_age],[gender],[breed_id]"
            + ",[achievement],[reproduction_history],[price],[description],[dad_bird_id]"
            + ",[mom_bird_id],[discount],[status] FROM [BirdFarmShop].[dbo].[Bird]"
            + "WHERE [breed_id] LIKE ? "
            + "ORDER BY (SELECT NULL) OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

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
                    Date birthday = rs.getDate("birthday");
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
                    LocalDate birthDate = birthday.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                    // Calculate the period between the birthdate and the current date
                    Period period = Period.between(birthDate, currentDate);
                    // Calculate the age in months
                    int ageInMonths = period.getYears() * 12 + period.getMonths();
                    Bird bird = new Bird(bird_id, bird_name, color, ageInMonths, grown_age, gender, breed_id,
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
                String sql = "SELECT [bird_id],[bird_name],[color],[age],[grown_age],[gender],[breed_id]"
                        + ",[achievement],[reproduction_history],[price],[description],[dad_bird_id]"
                        + ",[mom_bird_id],[discount],[status]\n"
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
                    String dad_bird_id = rs.getString("dad_bird_id");
                    String dad_bird_name = getBirdNameById(dad_bird_id);
                    String mom_bird_id = rs.getString("mom_bird_id");
                    String mom_bird_name = getBirdNameById(mom_bird_id);
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    ArrayList<String> image_urls = imgDao.getImagesByBirdId(birdId);
                    bird = new BirdDTO(bird_id, bird_name, color, age, grown_age, gender, breed_id, breed_name,
                            achievement, reproduction_history, price, description, dad_bird_id, dad_bird_name, mom_bird_id, mom_bird_name, discount, status, image_urls);
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
                ptm = conn.prepareStatement(GET_BIRD_NAME_BY_ID);
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

    public List<Bird> searchBird(String name, int page, int recordsPerPage) throws SQLException {
        List<Bird> searchList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(SEARCH_BIRDS_BY_NAME);
                stm.setString(1, "%" + name + "%");
                int start = (page - 1) * recordsPerPage;
                stm.setInt(2, start);
                stm.setInt(3, recordsPerPage);
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
                    searchList.add(bird);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
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
        return searchList;
    }

    public int numberOfBirdsByBreedId(String name) throws SQLException {
        int searchTotal = 0;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(NUMBER_OF_BIRD_LIST_SEARCH);
                stm.setString(1, "%" + name + "%");
                rs = stm.executeQuery();
                if (rs.next()) {
                    searchTotal = rs.getInt("TotalCount");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
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
        return searchTotal;
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

    public List<Bird> getBirdsByBreedId(String breed_id, int page, int recordsPerPage) throws SQLException, ClassNotFoundException {
        List<Bird> birdList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_BIRD_BY_BREED_ID_PAGING);
                stm.setString(1, "%" + breed_id + "%");
                int start = (page - 1) * recordsPerPage;
                stm.setInt(2, start);
                stm.setInt(3, recordsPerPage);
                rs = stm.executeQuery();
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
                    String dad_bird_id = rs.getString("dad_bird_id");
                    String mom_bird_id = rs.getString("mom_bird_id");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    String image_url = imgDao.getThumbnailUrlByBirdId(bird_id);
                    b = new Bird(bird_id, bird_name, color, age, grown_age, gender, breed_id,
                            achievement, reproduction_history, price, description, dad_bird_id, mom_bird_id, discount, status, image_url);

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

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        BirdDAO dao = new BirdDAO();
        List<Bird> birds = dao.getBirdsCustom(null, null, null, null, null, "1", 9);
        for (Bird bird : birds) {
            System.out.println(bird);
        }
    }
}
