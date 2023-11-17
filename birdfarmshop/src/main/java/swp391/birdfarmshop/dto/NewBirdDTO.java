/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dto;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author phong pc
 */
public class NewBirdDTO {
    private String bird_id;
    private String bird_name;
    private String color;
    private Date birthday;
    private int age;
    private int grown_age;
    private String gender;
    private String breed_id;
    private String breed_name;
    private String achievement;
    private int reproduction_history;
    private int price;
    private String description;
    private String dad_bird_id;
    private String mom_bird_id;
    private int discount;
    private String status;
    private ArrayList<String> image_urls;

    public NewBirdDTO(String bird_id, String bird_name, String color, Date birthday, int age, int grown_age, String gender, String breed_id, String breed_name, String achievement, int reproduction_history, int price, String description, String dad_bird_id, String mom_bird_id, int discount, String status, ArrayList<String> image_urls) {
        this.bird_id = bird_id;
        this.bird_name = bird_name;
        this.color = color;
        this.birthday = birthday;
        this.age = age;
        this.grown_age = grown_age;
        this.gender = gender;
        this.breed_id = breed_id;
        this.breed_name = breed_name;
        this.achievement = achievement;
        this.reproduction_history = reproduction_history;
        this.price = price;
        this.description = description;
        this.dad_bird_id = dad_bird_id;
        this.mom_bird_id = mom_bird_id;
        this.discount = discount;
        this.status = status;
        this.image_urls = image_urls;
    }

    public String getBird_id() {
        return bird_id;
    }

    public String getBird_name() {
        return bird_name;
    }

    public String getColor() {
        return color;
    }

    public Date getBirthday() {
        return birthday;
    }

    public int getAge() {
        return age;
    }

    public int getGrown_age() {
        return grown_age;
    }

    public String getGender() {
        return gender;
    }

    public String getBreed_id() {
        return breed_id;
    }

    public String getBreed_name() {
        return breed_name;
    }

    public String getAchievement() {
        return achievement;
    }

    public int getReproduction_history() {
        return reproduction_history;
    }

    public int getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public String getDad_bird_id() {
        return dad_bird_id;
    }

    public String getMom_bird_id() {
        return mom_bird_id;
    }

    public int getDiscount() {
        return discount;
    }

    public String getStatus() {
        return status;
    }

    public ArrayList<String> getImage_urls() {
        return image_urls;
    }
    
}
