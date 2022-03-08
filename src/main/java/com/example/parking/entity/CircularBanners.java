package com.example.parking.entity;

import java.util.List;

public class CircularBanners {
    private List<CircularBanner> data;
    private Message msg;

    public List<CircularBanner> getData() {
        return data;
    }

    public void setData(List<CircularBanner> data) {
        this.data = data;
    }

    public Message getMsg() {
        return msg;
    }

    public void setMsg(Message msg) {
        this.msg = msg;
    }
}
