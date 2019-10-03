package com.crowd.funding.myorder.domain;

import java.util.List;

public class MyoptionDTO {
    private int op_id;
	private int op_count;
	private String op_name;
	private int myinfo;
	private int reward_id;
	private int sumAmount;
	private List<MyoptionDTO> orderOptList;
	
	public int getSumAmount() {
		return sumAmount;
	}
	public void setSumAmount(int sumAmount) {
		this.sumAmount = sumAmount;
	}
	public String getOp_name() {
		return op_name;
	}
	public void setOp_name(String op_name) {
		this.op_name = op_name;
	}
	public int getReward_id() {
		return reward_id;
	}
	public void setReward_id(int reward_id) {
		this.reward_id = reward_id;
	}
	public int getMyinfo() {
		return myinfo;
	}
	public void setMyinfo(int myinfo) {
		this.myinfo = myinfo;
	}
	public int getOp_id() {
		return op_id;
	}
	public void setOp_id(int op_id) {
		this.op_id = op_id;
	}
	public int getOp_count() {
		return op_count;
	}
	public void setOp_count(int op_count) {
		this.op_count = op_count;
	}
	public List<MyoptionDTO> getOrderOptList() {
		return orderOptList;
	}
	public void setOrderOptList(List<MyoptionDTO> orderOptList) {
		this.orderOptList = orderOptList;
	}
}
