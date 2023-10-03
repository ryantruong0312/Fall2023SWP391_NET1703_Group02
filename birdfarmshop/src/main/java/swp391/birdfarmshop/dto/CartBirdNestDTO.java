/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dto;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public class CartBirdNestDTO {
    private Map<Integer, BirdNestDTO> cartBirdNest;

    public CartBirdNestDTO() {
    }

    public CartBirdNestDTO(Map<Integer, BirdNestDTO> cartBirdNest) {
        this.cartBirdNest = cartBirdNest;
    }

    public Map<Integer, BirdNestDTO> getCart() {
        return cartBirdNest;
    }

    public void setCart(Map<Integer, BirdNestDTO> cartBirdNest) {
        this.cartBirdNest = cartBirdNest;
    }

    public float getTotalAmount() {
        float total = 0;
        for (BirdNestDTO dto : cartBirdNest.values()) {
            total = total + dto.getPrice();
        }
        return total;
    }

    public void add(BirdNestDTO dto){
        if (this.cartBirdNest == null) {
            cartBirdNest = new HashMap<>();
        }

        cartBirdNest.put(dto.getNest_id(), dto);

    }

    public void delete(int nest_id) {
        if (this.cartBirdNest != null) {
            if (this.cartBirdNest.containsKey(nest_id)) {
                this.cartBirdNest.remove(nest_id);
            }
        }
    }

    public int getSize() {
        return this.cartBirdNest.size();
    }
}
