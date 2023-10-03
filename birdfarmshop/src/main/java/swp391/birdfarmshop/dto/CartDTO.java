/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dto;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import swp391.birdfarmshop.model.Accessory;
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.model.BirdNest;

/**
 *
 * @author tlminh
 */
public class CartDTO {

    private ArrayList<Bird> birdList;
    private ArrayList<BirdNest> birdNestList;
    private Map<Accessory, Integer> accessoryList;
    private int birdTotalPrice;
    private int birdNestTotalPrice;
    private int accessoryTotalPrice;
    private int cartTotalPrice;

    public CartDTO() {
        birdList = new ArrayList<>();
        birdNestList = new ArrayList<>();
        accessoryList = new HashMap<>();
    }

    public CartDTO(ArrayList<Bird> birdList, ArrayList<BirdNest> birdNestList, Map<Accessory, Integer> accessoryList, int birdTotalPrice, int birdNestTotalPrice, int accessoryTotalPrice, int cartTotalPrice) {
        this.birdList = birdList;
        this.birdNestList = birdNestList;
        this.accessoryList = accessoryList;
        this.birdTotalPrice = birdTotalPrice;
        this.birdNestTotalPrice = birdNestTotalPrice;
        this.accessoryTotalPrice = accessoryTotalPrice;
        this.cartTotalPrice = cartTotalPrice;
    }

    public ArrayList<Bird> getBirdList() {
        return birdList;
    }

    public void setBirdList(ArrayList<Bird> birdList) {
        this.birdList = birdList;
    }

    public ArrayList<BirdNest> getBirdNestList() {
        return birdNestList;
    }

    public void setBirdNestList(ArrayList<BirdNest> birdNestList) {
        this.birdNestList = birdNestList;
    }

    public Map<Accessory, Integer> getAccessoryList() {
        return accessoryList;
    }

    public void setAccessoryList(Map<Accessory, Integer> accessoryList) {
        this.accessoryList = accessoryList;
    }

    public int getBirdTotalPrice() {
        return birdTotalPrice;
    }

    public void setBirdTotalPrice(int birdTotalPrice) {
        this.birdTotalPrice = birdTotalPrice;
    }

    public int getBirdNestTotalPrice() {
        return birdNestTotalPrice;
    }

    public void setBirdNestTotalPrice(int birdNestTotalPrice) {
        this.birdNestTotalPrice = birdNestTotalPrice;
    }

    public int getAccessoryTotalPrice() {
        return accessoryTotalPrice;
    }

    public void setAccessoryTotalPrice(int accessoryTotalPrice) {
        this.accessoryTotalPrice = accessoryTotalPrice;
    }

    public int getCartTotalPrice() {
        return cartTotalPrice;
    }

    public void setCartTotalPrice(int cartTotalPrice) {
        this.cartTotalPrice = cartTotalPrice;
    }

    public boolean addBirdToCart(Bird bird) {
        boolean check = false;
        if (!this.birdList.contains(bird)) {
            this.birdList.add(bird);
            check = true;
        }
        return check;
    }

    public boolean addBirdNestToCart(BirdNest birdnest) {
        boolean check = false;
        if (!this.birdNestList.contains(birdnest)) {
            this.birdNestList.add(birdnest);
            check = true;
        }
        return check;
    }

    public boolean addAccessoryToCart(Accessory accessory, int quantity) {
        boolean check = false;
        if (this.accessoryList.containsKey(accessory)) {
            int currentQuant = this.accessoryList.get(accessory);
            this.accessoryList.replace(accessory, currentQuant + quantity);
            check = true;
        } else {
            this.accessoryList.put(accessory, quantity);
            check = true;
        }
        return check;
    }
}
