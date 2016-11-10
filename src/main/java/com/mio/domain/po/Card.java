package com.mio.domain;

/**
 * Created by liuhe on 2016/10/9.
 * update
 */
public class Card {

    private int id;
    private String name;
    private double price;//收费金额
    private int days;//持书天数
    private int number;//可借数量
    private double deposit;//押金
    private double lostFee;//丢失罚金 倍率
    private double brokenFee;//损坏罚金 倍率


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public double getLostFee() {
        return lostFee;
    }

    public void setLostFee(double lostFee) {
        this.lostFee = lostFee;
    }

    public double getBrokenFee() {
        return brokenFee;
    }

    public void setBrokenFee(double brokenFee) {
        this.brokenFee = brokenFee;
    }

    @Override
    public String toString() {
        return "Card{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", days=" + days +
                ", number=" + number +
                ", deposit=" + deposit +
                ", lostFee=" + lostFee +
                ", brokenFee=" + brokenFee +
                '}';
    }
}
