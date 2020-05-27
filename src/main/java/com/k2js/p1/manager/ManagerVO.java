package com.k2js.p1.manager;

import java.util.List;

import com.k2js.p1.manager.file.ManagerFileVO;

public class ManagerVO {
	private long num;
	private String name;
	private int age;
	private int gender;
	private String phone;
	private String home;
	private ManagerFileVO managerFileVO;
	
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	
	public ManagerFileVO getManagerFileVO() {
		return managerFileVO;
	}
	public void setManagerFileVO(ManagerFileVO managerFileVO) {
		this.managerFileVO = managerFileVO;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	
}
