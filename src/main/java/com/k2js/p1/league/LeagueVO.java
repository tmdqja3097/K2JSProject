package com.k2js.p1.league;


public class LeagueVO {

	private String teamName;
	private long win;
	private long draw;
	private long lose;
	private int gender;
	private long point;
	private long rank;
	private double winRate;
	
	public double getWinRate() {
		return winRate;
	}
	public void setWinRate(double winRate) {
		this.winRate = winRate;
	}
	public long getRank() {
		return rank;
	}
	public void setRank(long rank) {
		this.rank = rank;
	}
	public long getPoint() {
		return point;
	}
	public long setPoint(long point) {
		point = win*3 + draw;		 
		return this.point = point;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public long getWin() {
		return win;
	}
	public void setWin(long win) {
		this.win = win;
	}
	public long getDraw() {
		return draw;
	}
	public void setDraw(long draw) {
		this.draw = draw;
	}
	public long getLose() {
		return lose;
	}
	public void setLose(long lose) {
		this.lose = lose;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	
}
