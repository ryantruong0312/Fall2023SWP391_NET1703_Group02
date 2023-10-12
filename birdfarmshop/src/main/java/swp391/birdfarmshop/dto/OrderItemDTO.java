/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.dto;

/**
 *
 * @author tlminh
 */
public class OrderItemDTO {
    private int order_item_id;
    private String order_id;
    private String image_url;
    private String bird_id;
    private String bird_name;
    private String nest_id;
    private String nest_name;
    private String accessory_id;
    private String accessory_name;
    private int unit_price;
    private int order_quantity;

    public OrderItemDTO(int order_item_id, String order_id, String image_url, String bird_id, String bird_name, String nest_id, String nest_name, String accessory_id, String accessory_name, int unit_price, int order_quantity) {
        this.order_item_id = order_item_id;
        this.order_id = order_id;
        this.image_url = image_url;
        this.bird_id = bird_id;
        this.bird_name = bird_name;
        this.nest_id = nest_id;
        this.nest_name = nest_name;
        this.accessory_id = accessory_id;
        this.accessory_name = accessory_name;
        this.unit_price = unit_price;
        this.order_quantity = order_quantity;
    }

    public int getOrder_item_id() {
        return order_item_id;
    }

    public void setOrder_item_id(int order_item_id) {
        this.order_item_id = order_item_id;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getBird_id() {
        return bird_id;
    }

    public void setBird_id(String bird_id) {
        this.bird_id = bird_id;
    }

    public String getBird_name() {
        return bird_name;
    }

    public void setBird_name(String bird_name) {
        this.bird_name = bird_name;
    }

    public String getNest_id() {
        return nest_id;
    }

    public void setNest_id(String nest_id) {
        this.nest_id = nest_id;
    }

    public String getNest_name() {
        return nest_name;
    }

    public void setNest_name(String nest_name) {
        this.nest_name = nest_name;
    }

    public String getAccessory_id() {
        return accessory_id;
    }

    public void setAccessory_id(String accessory_id) {
        this.accessory_id = accessory_id;
    }

    public String getAccessory_name() {
        return accessory_name;
    }

    public void setAccessory_name(String accessory_name) {
        this.accessory_name = accessory_name;
    }

    public int getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(int unit_price) {
        this.unit_price = unit_price;
    }

    public int getOrder_quantity() {
        return order_quantity;
    }

    public void setOrder_quantity(int order_quantity) {
        this.order_quantity = order_quantity;
    }
    
}
