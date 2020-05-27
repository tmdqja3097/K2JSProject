package com.k2js.p1.stadium;

import java.util.List;

import com.k2js.p1.board.file.BoardFileVO;

public class StadiumVO {
	private String name;
	private String address;
	private double location_k;
	private double location_w;
	private String stadiumSize;
	private int shower;
	private int parking;
	private int shoes;
	private int cloth;
	private String info;

	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getLocation_k() {
		return location_k;
	}
	public void setLocation_k(double location_k) {
		this.location_k = location_k;
	}
	public double getLocation_w() {
		return location_w;
	}
	public void setLocation_w(double location_w) {
		this.location_w = location_w;
	}
	public String getStadiumSize() {
		return stadiumSize;
	}
	public void setStadiumSize(String stadiumSize) {
		this.stadiumSize = stadiumSize;
	}
	public int getShower() {
		return shower;
	}
	public void setShower(int shower) {
		this.shower = shower;
	}
	public int getParking() {
		return parking;
	}
	public void setParking(int parking) {
		this.parking = parking;
	}
	public int getShoes() {
		return shoes;
	}
	public void setShoes(int shoes) {
		this.shoes = shoes;
	}
	public int getCloth() {
		return cloth;
	}
	public void setCloth(int cloth) {
		this.cloth = cloth;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
}
