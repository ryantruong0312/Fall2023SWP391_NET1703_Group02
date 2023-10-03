/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dto;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import swp391.birdfarmshop.dao.AccessoryDAO;
import swp391.birdfarmshop.model.Accessory;
import swp391.birdfarmshop.model.Bird;
import swp391.birdfarmshop.model.BirdNest;
import swp391.birdfarmshop.model.OrderedAccessoryItem;

/**
 *
 * @author tlminh
 */
public class CartDTO {

    private Map<String, Bird> birdList;
    private Map<String, BirdNest> birdNestList;
    private Map<String, OrderedAccessoryItem> accessoryList;
    private int birdTotalPrice;
    private int birdNestTotalPrice;
    private int accessoryTotalPrice;
    private int cartTotalPrice;
    private int totalItem;

    public CartDTO() {
        birdList = new HashMap<>();
        birdNestList = new HashMap<>();
        accessoryList = new HashMap<>();
        cartTotalPrice = 0;
        totalItem = 0;
    }

    public int getTotalItem() {
        return totalItem;
    }

    public void setTotalItem(int totalItem) {
        this.totalItem = totalItem;
    }

    public Map<String, Bird> getBirdList() {
        return birdList;
    }

    public void setBirdList(Map<String, Bird> birdList) {
        this.birdList = birdList;
    }

    public Map<String, BirdNest> getBirdNestList() {
        return birdNestList;
    }

    public void setBirdNestList(Map<String, BirdNest> birdNestList) {
        this.birdNestList = birdNestList;
    }

    public Map<String, OrderedAccessoryItem> getAccessoryList() {
        return accessoryList;
    }

    public void setAccessoryList(Map<String, OrderedAccessoryItem> accessoryList) {
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
        if (!this.birdList.containsKey(bird.getBird_id())) {
            this.birdList.put(bird.getBird_id(), bird);
            this.totalItem += 1;
            cartTotalPrice += (bird.getPrice() - (bird.getPrice() * bird.getDiscount() / 100));
            check = true;
        }
        return check;
    }

    public boolean addBirdNestToCart(BirdNest birdnest) {
        boolean check = false;
        if (!this.birdNestList.containsKey(birdnest.getNest_id())) {
            this.birdNestList.put(birdnest.getNest_id(), birdnest);
            this.totalItem += 1;
            cartTotalPrice += (birdnest.getPrice() - (birdnest.getPrice() * birdnest.getDiscount() / 100));
            check = true;
        }
        return check;
    }

    public boolean addAccessoryToCart(Accessory accessory, int quantity) throws SQLException {
        boolean check = false;
        if (this.accessoryList.containsKey(accessory.getAccessory_id())) {
            int currentQuant = this.accessoryList.get(accessory.getAccessory_id()).getOrder_quantity();
            this.accessoryList.get(accessory.getAccessory_id()).setOrder_quantity(currentQuant + quantity);
            this.totalItem += quantity;
            this.cartTotalPrice += ((accessory.getUnit_price() - (accessory.getUnit_price() * accessory.getDiscount() / 100)) * quantity);
            check = true;
        } else {
            this.accessoryList.put(accessory.getAccessory_id(), new OrderedAccessoryItem(accessory, quantity));
            this.totalItem += quantity;
            this.cartTotalPrice += ((accessory.getUnit_price() - (accessory.getUnit_price() * accessory.getDiscount() / 100)) * quantity);
            check = true;
        }
        return check;
    }

    public void removeBirdFromCart(Bird bird) {
        this.birdList.remove(bird.getBird_id());
        this.totalItem -= 1;
        this.cartTotalPrice -= (bird.getPrice() - (bird.getPrice() * bird.getDiscount() / 100));
    }

    public void removeAccessoryFromCart(Accessory accessory, int order_quantity) {
        this.accessoryList.remove(accessory.getAccessory_id());
        this.totalItem -= order_quantity;
        this.cartTotalPrice -= ((accessory.getUnit_price() - (accessory.getUnit_price() * accessory.getDiscount() / 100)) * order_quantity);
    }
}
