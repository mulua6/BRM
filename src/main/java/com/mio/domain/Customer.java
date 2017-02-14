package com.mio.domain;

import com.mio.utils.DataDictUtils;
import com.mio.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.datetime.DateFormatter;

import java.util.Date;

public class Customer {
    private Integer id;

    private String customerName;

    private Integer number;

    private String phone;

    private Integer sex;
    private String sexView;

    /**
     * 0:正常
     * 1:挂失
     * 2:逾期
     */
    private String status;
    private String statusView;

    private String address;

    private String other;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createTime;
    private String createTimeView;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updateTime;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date expireTime;
    private String expireTimeView;

    private Integer count;

    private Integer cardId;
    private String cardName;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date birthday;
    private String birthdayView;

    private Double deposit;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName == null ? null : customerName.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
        this.sexView = DataDictUtils.parseSex(sex);
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
        this.statusView = status == null ? null : DataDictUtils.parseCustomerStatus(Integer.parseInt(status));
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other == null ? null : other.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;

        this.createTimeView = DateUtils.formatDate(createTime);

    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(Date expireTime) {
        this.expireTime = expireTime;
        this.expireTimeView = DateUtils.formatDate(expireTime);
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getCardId() {
        return cardId;
    }

    public void setCardId(Integer cardId) {
        this.cardId = cardId;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
        this.birthdayView = DateUtils.formatDate(birthday);
    }

    public Double getDeposit() {
        return deposit;
    }

    public void setDeposit(Double deposit) {
        this.deposit = deposit;
    }

    public String getCreateTimeView() {
        return createTimeView;
    }

    public void setCreateTimeView(String createTimeView) {
        this.createTimeView = createTimeView;
    }

    public String getExpireTimeView() {
        return expireTimeView;
    }

    public void setExpireTimeView(String expireTimeView) {
        this.expireTimeView = expireTimeView;
    }

    public String getBirthdayView() {
        return birthdayView;
    }

    public void setBirthdayView(String birthdayView) {
        this.birthdayView = birthdayView;
    }

    public String getSexView() {
        return sexView;
    }

    public void setSexView(String sexView) {
        this.sexView = sexView;
    }

    public String getStatusView() {
        return statusView;
    }

    public void setStatusView(String statusView) {
        this.statusView = statusView;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }
}