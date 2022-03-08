package com.example.parking.dao.imp;

import com.example.parking.dao.CircularBannerDao;
import com.example.parking.entity.CircularBanner;

import java.util.List;

public class CircularBannerDaoImp extends BaseDao implements CircularBannerDao{
    @Override
    public List<CircularBanner> queryForList() {
        String sql = "select * from circularbanner";
        return queryForList(CircularBanner.class,sql);
    }
}
