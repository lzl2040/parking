package com.example.parking.dao;

import com.example.parking.entity.Location;

import java.util.List;

public interface MapDao {
    public List<Location> queryParkingSpace();
}
