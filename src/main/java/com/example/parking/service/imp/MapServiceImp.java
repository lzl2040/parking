package com.example.parking.service.imp;

import com.example.parking.dao.MapDao;
import com.example.parking.dao.imp.MapDaoImp;
import com.example.parking.entity.Location;
import com.example.parking.service.MapService;

import java.util.List;

public class MapServiceImp implements MapService {
    MapDao mapDao = new MapDaoImp();
    @Override
    public List<Location> getMap() {
        return mapDao.queryParkingSpace();
    }
}
