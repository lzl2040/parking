package com.example.parking.entity;

public class Location {
    private int locationId;
    private int hasCar;
    private Double longtitude;
    private Double latitude;
    private String carNum;

    public Location(int hasCar, Double longtitude, Double latitude) {
        this.hasCar = hasCar;
        this.longtitude = longtitude;
        this.latitude = latitude;
    }

    public Location() {
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

    public String getCarNum() {
        return carNum;
    }

    public void setCarNum(String carNum) {
        this.carNum = carNum;
    }

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public int getHasCar() {
        return hasCar;
    }

    public void setHasCar(int hasCar) {
        this.hasCar = hasCar;
    }
}
