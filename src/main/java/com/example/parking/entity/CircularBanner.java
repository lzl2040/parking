package com.example.parking.entity;

/**
 * 微信小程序轮播图的实体
 * noting:这里的属性名称和数据库的要一致,不然会无法注入,因为dao里面的原理是根据setX来的
 */
public class CircularBanner {
    private String img_src;
    private String open_type;
    private Integer goods_id;
    private String navigator_url;

    public String getImg_src() {
        return img_src;
    }

    public void setImg_src(String img_src) {
        this.img_src = img_src;
    }

    public String getOpen_type() {
        return open_type;
    }

    public void setOpen_type(String open_type) {
        this.open_type = open_type;
    }

    public Integer getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Integer goods_id) {
        this.goods_id = goods_id;
    }

    public String getNavigator_url() {
        return navigator_url;
    }

    public void setNavigator_url(String navigator_url) {
        this.navigator_url = navigator_url;
    }
}
