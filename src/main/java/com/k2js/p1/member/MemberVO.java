package com.k2js.p1.member;


import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class MemberVO {
	
	private String id;
	private String name;
	private String pw;
	private String email;
	private int gender;
	private String phone;
	private Date birth;
	private long cash;
	private int age;
	private int loginmt;
	private long capaListNum;
	
	public long getCapaListNum() {
		return capaListNum;
	}
	public void setCapaListNum(long capaListNum) {
		this.capaListNum = capaListNum;
	}
	public int getLoginmt() {
		return loginmt;
	}
	public void setLoginmt(int loginmt) {
		this.loginmt = loginmt;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public long getCash() {
		return cash;
	}
	public void setCash(long cash) {
		this.cash = cash;
	}
	
	
	

}
