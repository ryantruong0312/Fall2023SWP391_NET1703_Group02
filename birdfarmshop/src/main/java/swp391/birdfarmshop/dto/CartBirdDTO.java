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
public class CartBirdDTO {

    private Map<String, BirdDTO> cartBird;

    public CartBirdDTO() {
    }

    public CartBirdDTO(Map<String, BirdDTO> cartBird) {
        this.cartBird = cartBird;
    }

    public Map<String, BirdDTO> getCart() {
        return cartBird;
    }

    public void setCart(Map<String, BirdDTO> cartBird) {
        this.cartBird = cartBird;
    }

    public float getTotalAmount() {
        float total = 0;
        for (BirdDTO dto : cartBird.values()) {
            total = total + dto.getPrice();
        }
        return total;
    }

    public void add(BirdDTO dto){
        if (this.cartBird == null) {
            cartBird = new HashMap<>();
        }

        cartBird.put(dto.getBird_id(), dto);

    }

    public void delete(String bird_id) {
        if (this.cartBird != null) {
            if (this.cartBird.containsKey(bird_id)) {
                this.cartBird.remove(bird_id);
            }
        }
    }

    public int getSize() {
        return this.cartBird.size();
    }
}
