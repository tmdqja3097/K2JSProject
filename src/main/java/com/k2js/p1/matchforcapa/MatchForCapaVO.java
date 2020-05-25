package com.k2js.p1.matchforcapa;

import org.springframework.stereotype.Component;

@Component
public class MatchForCapaVO {
	
	private long num;
	private long capaListNum;
	private int count;
	private long reqNum;
	
	public long getReqNum() {
		return reqNum;
	}
	public void setReqNum(long reqNum) {
		this.reqNum = reqNum;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public long getCapaListNum() {
		return capaListNum;
	}
	public void setCapaListNum(long capaListNum) {
		this.capaListNum = capaListNum;
	}
	
	

}
