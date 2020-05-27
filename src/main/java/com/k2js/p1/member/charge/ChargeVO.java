package com.k2js.p1.member.charge;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ChargeVO {
	
	private long chargeNum;
	private String userId;
	private long amount;
	private int chargeMethod;
	private Date chargeDate;
	
	public long getChargeNum() {
		return chargeNum;
	}
	public void setChargeNum(long chargeNum) {
		this.chargeNum = chargeNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	public int getChargeMethod() {
		return chargeMethod;
	}
	public void setChargeMethod(int chargeMethod) {
		this.chargeMethod = chargeMethod;
	}
	public Date getChargeDate() {
		return chargeDate;
	}
	public void setChargeDate(Date chargeDate) {
		this.chargeDate = chargeDate;
	}
	
	
	
}
