package com.mio.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Borrow {
    private Integer id;

    private Integer bookId;

    private Integer customerId;

    private Integer days;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date borrowTime;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date expireTime;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date backTime;

    private Boolean status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getDays() {
        return days;
    }

    public void setDays(Integer days) {
        this.days = days;
    }

    public Date getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(Date borrowTime) {
        this.borrowTime = borrowTime;
    }

    public Date getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(Date expireTime) {
        this.expireTime = expireTime;
    }

    public Date getBackTime() {
        return backTime;
    }

    public void setBackTime(Date backTime) {
        this.backTime = backTime;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
}