package com.example.parking.entity;

/**
 * 返回给客户端的信息
 */
public class Message {
    private String msg;
    private int status;

    public Message(String msg, int status) {
        this.msg = msg;
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
