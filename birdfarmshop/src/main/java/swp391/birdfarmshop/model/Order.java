/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.model;

import java.sql.Date;

/**
 *
 * @author tlminh
 */
public class Order {
    private String order_id;
    private String customer;
    private Date order_date;
    private String order_status;
    private String name_receiver;
    private int phone_receiver;
    private String address_receiver;
    private String payment_status;
    private int total_price;
    private int point;

    public Order(String order_id, String customer, Date order_date, String order_status, String name_receiver, int phone_receiver, String address_receiver, String payment_status, int total_price, int point) {
        this.order_id = order_id;
        this.customer = customer;
        this.order_date = order_date;
        this.order_status = order_status;
        this.name_receiver = name_receiver;
        this.phone_receiver = phone_receiver;
        this.address_receiver = address_receiver;
        this.payment_status = payment_status;
        this.total_price = total_price;
        this.point = point;
    }

    public Order() {
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public String getOrder_status() {
        return order_status;
    }

    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }

    public String getName_receiver() {
        return name_receiver;
    }

    public void setName_receiver(String name_receiver) {
        this.name_receiver = name_receiver;
    }

    public int getPhone_receiver() {
        return phone_receiver;
    }

    public void setPhone_receiver(int phone_receiver) {
        this.phone_receiver = phone_receiver;
    }

    public String getAddress_receiver() {
        return address_receiver;
    }

    public void setAddress_receiver(String address_receiver) {
        this.address_receiver = address_receiver;
    }

    public String getPayment_status() {
        return payment_status;
    }

    public void setPayment_status(String payment_status) {
        this.payment_status = payment_status;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }
    
    
}
