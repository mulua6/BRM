package com.mio.domain;

import java.util.concurrent.Delayed;
import java.util.concurrent.TimeUnit;

public class Account implements Delayed {
    private int id;
    private String email;
    private String username;
    private String realName;
    private String cardId;
    private String password;
    private String phone;
    private String email2;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail2() {
        return email2;
    }

    public void setEmail2(String email2) {
        this.email2 = email2;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", realName='" + realName + '\'' +
                ", cardId='" + cardId + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", email2='" + email2 + '\'' +
                '}';
    }

    public long getDelay(TimeUnit unit) {
        return unit.convert(60,TimeUnit.SECONDS);
    }

    public int compareTo(Delayed o) {
        return 1;
    }
}
