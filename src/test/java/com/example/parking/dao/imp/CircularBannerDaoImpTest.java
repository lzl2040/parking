package com.example.parking.dao.imp;

import com.example.parking.dao.CircularBannerDao;
import com.example.parking.entity.CircularBanner;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class CircularBannerDaoImpTest {

    @Test
    public void test(){
        CircularBannerDao cd = new CircularBannerDaoImp();
        List<CircularBanner> cb = cd.queryForList();
        System.out.println(cb.get(0).getGoods_id());
    }

}