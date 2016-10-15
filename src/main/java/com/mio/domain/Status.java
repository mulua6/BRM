package com.mio.domain;

/**
 * Created by liuhe on 2016/10/14.
 * update
 */
public class Status {

    private Integer number;
    private String name;

    public Status(Integer number, String name) {
        this.number = number;
        this.name = name;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
