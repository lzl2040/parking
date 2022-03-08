package com.example.parking.dao;

import com.example.parking.entity.CircularBanner;
import com.example.parking.entity.CircularBanners;

import java.util.List;

public interface CircularBannerDao {
    public List<CircularBanner> queryForList();
}
