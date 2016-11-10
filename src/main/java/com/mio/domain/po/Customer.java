package com.mio.domain;

import java.util.Date;

/**
 * Created by liuhe on 2016/10/9.
 * update
 * //读者类
 */
public class Customer {

    private int id;
    private String number;//读书卡号码
    private String name;//姓名
    private String phone;//电话
    private int sex;//性别 1:男 0:女
    private String status;//状态 挂失 正常 到期
    private String address;//联系地址
    private String other;//备注
    private Date createDate;//加入日期
    private Date dueToDate;//到期日期
    private Date birthday;//生日


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getDueToDate() {
        return dueToDate;
    }

    public void setDueToDate(Date dueToDate) {
        this.dueToDate = dueToDate;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", number='" + number + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", sex=" + sex +
                ", status='" + status + '\'' +
                ", address='" + address + '\'' +
                ", other='" + other + '\'' +
                ", createDate=" + createDate +
                ", dueToDate=" + dueToDate +
                ", birthday=" + birthday +
                '}';
    }
}
