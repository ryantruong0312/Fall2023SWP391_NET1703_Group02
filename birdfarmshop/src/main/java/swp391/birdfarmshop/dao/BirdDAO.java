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
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

    private static final String GET_BIRD_BY_ID = "SELECT EXTRACT(MONTH FROM AGE(birthday)) AS age, * FROM Bird WHERE bird_id = ?";
    private static final String GET_BIRD_BY_BREED_ID = "SELECT bird_id, bird_name, color,\n" +
"       EXTRACT(MONTH FROM AGE(birthday)) AS age,\n" +
"       grown_age, gender,\n" +
"       breed_id, achievement,\n" +
"       reproduction_history,\n" +
"       price, description,\n" +
"       dad_bird_id, mom_bird_id,\n" +
"       discount, status\n" +
"FROM Bird\n" +
"WHERE breed_id = ?";

    public List<Bird> getBirdsCustom(String search, String breed, String price_birds, String gender_bird,
            String age_bird, String page, int recordsPerPage) throws SQLException {
        List<Bird> birdList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection(true);
            if (con != null) {
                String sql = "SELECT EXTRACT(MONTH FROM AGE(birthday)) AS age, *\n" +
                                "FROM Bird\n";
                if (search != null) {
                    sql += " WHERE bird_name LIKE '%" + search + "%' COLLATE \"default\"";
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
                    sql += "ORDER BY  CASE \n"
                            + "    WHEN status = 'Còn hàng' COLLATE \"default\" THEN 1\n"
                            + "    WHEN status = 'Đang sinh sản' COLLATE \"default\" THEN 2\n"
                            + "    ELSE 3\n"
                            + "  END,  age ASC OFFSET " + start + " ROWS FETCH NEXT " + recordsPerPage + " ROWS ONLY";
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
                    String dad_id = rs.getString("dad_bird_id");
                    String mom_id = rs.getString("mom_bird_id");
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    String image_url = imgDao.getThumbnailUrlByBirdId(bird_id);
                    Bird bird = new Bird(bird_id, bird_name, color, age, grown_age, gender, breed_id, achievement,
                            reproduction_history, price, description, discount, status, image_url, mom_id, dad_id);
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
            con = DBUtils.getConnection(true);
            if (con != null) {
                String sql = "SELECT COUNT(bird_id) AS numberOfBird \n"
                        + " FROM Bird\n";
                if (search != null) {
                    sql += " WHERE bird_name LIKE '%" + search + "%' COLLATE \"default\"";
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
        BirdDAO birdDao = new BirdDAO();
        BirdCustomerDAO cusDao = new BirdCustomerDAO();
        try {
            con = DBUtils.getConnection(true);
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
                    String gender = (sex) ? "Trống" : "Mái";
                    String breed_id = rs.getString("breed_id");
                    String breed_name = breedDao.getBreedNameById(breed_id);
                    String achievement = rs.getString("achievement");
                    int reproduction_history = rs.getInt("reproduction_history");
                    int price = rs.getInt("price");
                    String description = rs.getString("description");
                    String dad_id = null, dad_name = null, mom_name = null, mom_id = null;
                    dad_id = rs.getString("dad_bird_id");
                    if (dad_id != null) {
                        dad_name = birdDao.getBirdById(dad_id).getBird_name();
                    }
                    mom_id = rs.getString("mom_bird_id");
                    if (mom_id != null) {
                        mom_name = birdDao.getBirdById(mom_id).getBird_name();
                    }
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    ArrayList<String> image_urls = imgDao.getImagesByBirdId(birdId);
                    bird = new BirdDTO(bird_id, bird_name, color, birdthday, age, grown_age, gender,
                            breed_id, breed_name, achievement, reproduction_history, price,
                            description, dad_id, dad_name, mom_id, mom_name, discount, status, image_urls);
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

    public List<Bird> getBirdsByBreedId(String breed_id) throws SQLException, ClassNotFoundException {
        List<Bird> birdList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        try {
            con = DBUtils.getConnection(true);
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
                    String mom_id = rs.getString("mom_bird_id");
                    String dad_id = rs.getString("dad_bird_id");
                    Bird bird = new Bird(bird_id, bird_name, color, age, grown_age, gender, breed_id, achievement,
                            reproduction_history, price, description, discount, status, image_url, mom_id, dad_id);
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
            con = DBUtils.getConnection(true);
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
                    String mom_id = null, dad_id = null;
                    mom_id = rs.getString("mom_bird_id");
                    dad_id = rs.getString("dad_bird_id");
                    b = new Bird(bird_id, bird_name, color, age, grown_age, gender, breed_id, achievement,
                            reproduction_history, price, description, discount, status, image_url, mom_id, dad_id);
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
            String dad_bird_id, String mom_bird_id, String discount, String status) throws SQLException, NumberFormatException, ParseException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean sex;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = dateFormat.parse(birthday);
        Date sqlDate = new Date(utilDate.getTime());
        try {
            con = DBUtils.getConnection(true);
            if (con != null) {
                stm = con.prepareStatement("INSERT INTO Bird\n" +
"            (bird_id, bird_name, color, birthday, grown_age, gender, breed_id, achievement,\n" +
"             reproduction_history, price, description, dad_bird_id, mom_bird_id, discount, status)\n" +
"             VALUES (?, ?, ?, ?, ?, "+((gender.equalsIgnoreCase("Trống") ? "B'1'" : "B'0'"))+", ?, ?, ?, ?, ?, ?, ?, ?, ?) ");
                stm.setString(1, bird_id);
                if (!bird_name.isEmpty()) {
                    if (!bird_name.contains(bird_id)) {
                        bird_name = bird_name + " " + bird_id;
                    }
                    stm.setString(2, bird_name.trim());
                }
                stm.setString(3, color.isEmpty() ? null : color.trim());
                stm.setDate(4, sqlDate);
                stm.setInt(5, Integer.parseInt(grown_age));
                stm.setString(6, breed_id);
                stm.setString(7, (achievement != null && !achievement.isEmpty()) ? achievement.trim() : null);
                stm.setInt(8, Integer.parseInt(reproduction_history));
                stm.setInt(9, Integer.parseInt(price));
                stm.setString(10, (description != null && !description.isEmpty()) ? description.trim() : null);
                stm.setString(11, dad_bird_id != null && !dad_bird_id.isEmpty() ? dad_bird_id : null);
                stm.setString(12, mom_bird_id != null && !mom_bird_id.isEmpty() ? mom_bird_id : null);
                stm.setInt(13, Integer.parseInt(discount));
                stm.setString(14, status);
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

    public ArrayList<BirdDTO> getBirdsByGender(boolean gender) throws SQLException, ClassNotFoundException {
        ArrayList<BirdDTO> arrlist_b = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection(true);
            if (con != null) {
                stm = con.prepareStatement("SELECT bird_id,bird_name  FROM Bird WHERE gender = " + (gender ? "B'1'" : "B'0'"));
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

    public boolean updateBird(String bird_id, String bird_name, String color, String birthday, String grown_age, String gender,
            String breed_id, String achievement, String reproduction_history, String price, String description,
            String birdDad, String birdMom, String discount, String status)
            throws SQLException, ParseException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean sex;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = dateFormat.parse(birthday);
        Date sqlDate = new Date(utilDate.getTime());
        try {
            con = DBUtils.getConnection(true);
            if (con != null) {
                String query = "UPDATE Bird\n" +
"SET bird_name = ?, color = ?, birthday = ?, grown_age = ?, gender = " + ((gender.equalsIgnoreCase("Trống")) ? "B'1'" : "B'0'") + ", breed_id = ?, achievement = ?,\n" +
"    reproduction_history = ?, price = ?, description = ?, dad_bird_id = ?, mom_bird_id = ?,\n" +
"    discount = ?, status = ?\n" +
"WHERE bird_id = ?";
                stm = con.prepareStatement(query);
                bird_name = bird_name.contains(bird_id) ? bird_name : bird_name + " " + bird_id;
                stm.setString(1, bird_name.trim());
                stm.setString(2, !color.isEmpty() ? color.trim() : null);
                stm.setDate(3, sqlDate);
                stm.setInt(4, Integer.parseInt(grown_age));
                stm.setString(5, breed_id);
                stm.setString(6, achievement != null && !achievement.isEmpty() ? achievement.trim() : null);
                stm.setInt(7, Integer.parseInt(reproduction_history));
                stm.setInt(8, Integer.parseInt(price));
                stm.setString(9, description != null && !description.isEmpty() ? description.trim() : null);
                stm.setString(10, birdDad != null && !birdDad.isEmpty() ? birdDad : null);
                stm.setString(11, birdMom != null && !birdMom.isEmpty() ? birdMom : null);
                stm.setInt(12, Integer.parseInt(discount));
                stm.setString(13, status);
                stm.setString(14, bird_id);
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
            con = DBUtils.getConnection(true);
            if (con != null) {
                String query = "UPDATE Bird\n"
                        + "             SET status = ?\n"
                        + "             WHERE bird_id = ?";
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

    public ArrayList<Integer> getBirdAmount() throws SQLException {
        ArrayList<Integer> bird = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection(true);
            if (con != null) {
                String sql = "SELECT COUNT(bird_id) AS totalBird,\n"
                        + "	   COUNT(CASE WHEN status = 'Còn hàng' COLLATE \"default\" THEN 1 END) AS available,\n"
                        + "	   COUNT(CASE WHEN status = 'Đang sinh sản' COLLATE \"default\" THEN 1 END) AS reproduction,\n"
                        + "	   COUNT(CASE WHEN status = 'Hết hàng' COLLATE \"default\" THEN 1 END) AS sold\n"
                        + "FROM Bird";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs != null && rs.next()) {
                    bird.add(rs.getInt("totalBird"));
                    bird.add(rs.getInt("available"));
                    bird.add(rs.getInt("reproduction"));
                    bird.add(rs.getInt("sold"));
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

    public ArrayList<BirdDTO> getBirdMomDadByGender(boolean gen) throws SQLException, ClassNotFoundException {
        ArrayList<BirdDTO> listGender = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        ImageDAO imgDao = new ImageDAO();
        BirdDAO birdDao = new BirdDAO();
        BirdDTO bird;
        try(Connection con = DBUtils.getConnection(true)) {
                stm = con.prepareStatement("SELECT EXTRACT(MONTH FROM AGE(bird.birthday)) AS age, *" +
"FROM Bird AS bird\n" +
"LEFT JOIN BirdBreed AS breed ON bird.breed_id = breed.breed_id\n" +
"WHERE bird.gender = " + (gen ? "B'1'" : "B'0'") + " AND bird.reproduction_history > 0");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String bird_id = rs.getString("bird_id");
                    String bird_name = rs.getString("bird_name");
                    String color = rs.getString("color");
                    Date birthday = rs.getDate("birthday");
                    int age = rs.getInt("age");
                    int grown_age = rs.getInt("grown_age");
                    String gender = (gen ? "Trống" : "Mái");
                    String breed_id = rs.getString("breed_id");
                    String breed_name = rs.getString("breed_name");
                    String achievement = rs.getString("achievement");
                    int reproduction_history = rs.getInt("reproduction_history");
                    int price = rs.getInt("price");
                    String description = rs.getString("description");
                    String dad_id = null, dad_name = null, mom_name = null, mom_id = null;
                    dad_id = rs.getString("dad_bird_id");
                    if (dad_id != null) {
                        dad_name = birdDao.getBirdById(dad_id).getBird_name();
                    }
                    mom_id = rs.getString("mom_bird_id");
                    if (mom_id != null) {
                        mom_name = birdDao.getBirdById(mom_id).getBird_name();
                    }
                    int discount = rs.getInt("discount");
                    String status = rs.getString("status");
                    ArrayList<String> image_urls = imgDao.getImagesByBirdId(bird_id);
                    bird = new BirdDTO(bird_id, bird_name, color, birthday, age, grown_age, gender, breed_id, breed_name,
                            achievement, reproduction_history, price, description, dad_id, dad_name, mom_id, mom_name,
                            discount, status, image_urls);
                    listGender.add(bird);
                }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return listGender;
    }

    public boolean isBirdIdExisted(String bird_id) throws SQLException, ParseException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection(true);
            if (con != null) {
                String query = "SELECT bird_id FROM Bird WHERE bird_id = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, bird_id);
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
        }
        return false;
    }

    public ArrayList<String> getAllStatus() throws SQLException, ClassNotFoundException {
        ArrayList<String> statuses = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String status = null;
        try {
            con = DBUtils.getConnection(true);
            if (con != null) {
                stm = con.prepareStatement("SELECT DISTINCT status FROM Bird");
                rs = stm.executeQuery();
                while (rs != null && rs.next()) {
                    status = rs.getString("status");
                    statuses.add(status);
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
        return statuses;
    }

    public boolean updateReproductionHistory(String bird_id, int reproductionHistory) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection(true);
            if (con != null) {
                String query = "  UPDATE Bird\n"
                        + "  SET reproduction_history = ?\n"
                        + "  WHERE bird_id = ?";
                stm = con.prepareStatement(query);
                stm.setInt(1, reproductionHistory + 1);
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
    
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        BirdDAO dao = new BirdDAO();
    }
}
