package com.example.parking.entity;

public class Location {
    private int location_id;
    private int has_car;
    private Double longtitude;
    private Double latitude;
    private String car_num;

    public Location() {
    }

    public Location(int has_car, Double longtitude, Double latitude) {
        this.has_car = has_car;
        this.longtitude = longtitude;
        this.latitude = latitude;
    }

    public Double getLongtitude() {
        return longtitude;
    }

    public void setLongtitude(Double longtitude) {
        this.longtitude = longtitude;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public int getLocation_id() {
        return location_id;
    }

    public void setLocation_id(int location_id) {
        this.location_id = location_id;
    }

    public int getHas_car() {
        return has_car;
    }

    public void setHas_car(int has_car) {
        this.has_car = has_car;
    }

    public String getCar_num() {
        return car_num;
    }

    public void setCar_num(String car_num) {
        this.car_num = car_num;
    }
}
