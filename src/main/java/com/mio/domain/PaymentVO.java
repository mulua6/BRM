package com.mio.domain;

/**
 * Created by liuhe on 2016/10/27.
 * update
 */
public class PaymentVO {



    private Double moneySum;
    private Double depositSum;
    private Double totalSum;

    public Double getMoneySum() {
        return moneySum;
    }

    public void setMoneySum(Double moneySum) {
        this.moneySum = moneySum;
    }

    public Double getDepositSum() {
        return depositSum;
    }

    public void setDepositSum(Double depositSum) {
        this.depositSum = depositSum;
    }

    public Double getTotalSum() {
        return totalSum;
    }

    public void setTotalSum(Double totalSum) {
        this.totalSum = totalSum;
    }
}
