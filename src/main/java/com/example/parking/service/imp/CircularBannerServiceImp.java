package com.example.parking.service.imp;

import com.example.parking.dao.CircularBannerDao;
import com.example.parking.dao.imp.CircularBannerDaoImp;
import com.example.parking.entity.CircularBanner;
import com.example.parking.service.CircularBannerService;

import java.util.List;

public class CircularBannerServiceImp implements CircularBannerService {
    CircularBannerDao cd = new CircularBannerDaoImp();

    @Override
    public List<CircularBanner> getCircularBanner() {
        return cd.queryForList();
    }
}
