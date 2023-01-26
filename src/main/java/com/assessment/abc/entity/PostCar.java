package com.assessment.abc.entity;

import org.springframework.web.multipart.MultipartFile;

public class PostCar {

    private String make;
    private String model;
    private String year;
    private Long price;
    private MultipartFile image;

    public PostCar(){}

    public PostCar(String make, String model, String year, Long price, MultipartFile image) {
        this.make = make;
        this.model = model;
        this.year = year;
        this.price = price;
        this.image = image;
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }

    
    
}
