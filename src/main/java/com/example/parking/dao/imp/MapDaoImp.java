package com.example.parking.dao.imp;

import com.example.parking.dao.MapDao;
import com.example.parking.entity.Location;

import java.util.List;

public class MapDaoImp extends BaseDao implements MapDao {
    @Override
    public List<Location> queryParkingSpace() {
        String sql = "select has_car,longtitude,latitude from location";
        return queryForList(Location.class,sql);
    }
}
