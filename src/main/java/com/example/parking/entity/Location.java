package com.example.parking.entity;

public class Location {
    private Integer locationId;
    private Integer hasCar;
    private Double longtitude;
    private Double latitude;
    private String carNum;

    public Location(Integer hasCar, Double longtitude, Double latitude) {
        this.hasCar = hasCar;
        this.longtitude = longtitude;
        this.latitude = latitude;
    }

    public Location() {
    }

    public Integer getLocationId() {
        return locationId;
    }

    public void setLocationId(Integer locationId) {
        this.locationId = locationId;
    }

    public Integer getHasCar() {
        return hasCar;
    }

    public void setHasCar(Integer hasCar) {
        this.hasCar = hasCar;
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
}
