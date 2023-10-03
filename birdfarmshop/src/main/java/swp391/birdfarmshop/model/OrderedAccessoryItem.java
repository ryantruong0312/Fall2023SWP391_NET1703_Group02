/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.model;

/**
 *
 * @author tlminh
 */
public class OrderedAccessoryItem {
    private Accessory accessory;
    private int order_quantity;

    public OrderedAccessoryItem() {
    }

    public OrderedAccessoryItem(Accessory accessory, int order_quantity) {
        this.accessory = accessory;
        this.order_quantity = order_quantity;
    }

    public Accessory getAccessory() {
        return accessory;
    }

    public void setAccessory(Accessory accessory) {
        this.accessory = accessory;
    }

    public int getOrder_quantity() {
        return order_quantity;
    }

    public void setOrder_quantity(int order_quantity) {
        this.order_quantity = order_quantity;
    }
    
    
}
