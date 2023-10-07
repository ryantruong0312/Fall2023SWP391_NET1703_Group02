/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.model;

/**
 *
 * @author Admin
 */
public class OrderedBirdPairItem {
    private Bird birdMale;
    private Bird birdFemale;
    private BirdCustomer birdCustomer;
    private int servicePrice;

    public OrderedBirdPairItem(Bird birdMale, Bird birdFemale, BirdCustomer birdCustomer, int servicePrice) {
        this.birdMale = birdMale;
        this.birdFemale = birdFemale;
        this.birdCustomer = birdCustomer;
        this.servicePrice = servicePrice;
    }

    public Bird getBirdMale() {
        return birdMale;
    }

    public void setBirdMale(Bird birdMale) {
        this.birdMale = birdMale;
    }

    public Bird getFemalBird() {
        return birdFemale;
    }

    public void setFemalBird(Bird femalBird) {
        this.birdFemale = femalBird;
    }

    public BirdCustomer getBirdCustomer() {
        return birdCustomer;
    }

    public void setBirdCustomer(BirdCustomer birdCustomer) {
        this.birdCustomer = birdCustomer;
    }

    public int getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(int servicePrice) {
        this.servicePrice = servicePrice;
    }
    public int totalPricePair(){
        int priceMale = 0;
        int priceFemale = 0;
        int priceCustomer = 0;
        if(this.birdMale != null){
            priceMale = (int) Math.ceil((this.birdMale.getPrice()* (this.servicePrice/100.0)));
        }
        if(this.birdFemale != null){
            priceFemale = (int) Math.ceil((this.birdFemale.getPrice()* (this.servicePrice/100.0)));
        }
        return priceMale + priceFemale + priceCustomer;
    }
}
