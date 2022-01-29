package com.example.parking.service.imp;

import com.example.parking.entity.Location;
import com.example.parking.service.MapService;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class MapServiceImpTest {
    MapService mapService = new MapServiceImp();
    @Test
    void getMap() {
        List<Location> locations = mapService.getMap();
        System.out.println(locations.get(0).getCarNum());
    }
}