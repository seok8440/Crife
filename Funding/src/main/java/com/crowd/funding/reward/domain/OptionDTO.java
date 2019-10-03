package com.crowd.funding.reward.domain;

import java.util.List;

public class OptionDTO {
	int op_id;
	String op_name;
	int reward_id;
	int op_limit_qty;
	int op_count; // 옵션 주문 수량
	int sumAmount; // 옵션 총합
	List<OptionDTO> oplist;
	
	public int getSumAmount() {
		return sumAmount;
	}
	public void setSumAmount(int sumAmount) {
		this.sumAmount = sumAmount;
	}
	public int getOp_count() {
		return op_count;
	}
	public void setOp_count(int op_count) {
		this.op_count = op_count;
	}
	public List<OptionDTO> getOplist() {
		return oplist;
	}
	public void setOplist(List<OptionDTO> oplist) {
		this.oplist = oplist;
	}
	public int getOp_id() {
		return op_id;
	}
	public void setOp_id(int op_id) {
		this.op_id = op_id;
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
	public int getOp_limit_qty() {
		return op_limit_qty;
	}
	public void setOp_limit_qty(int op_limit_qty) {
		this.op_limit_qty = op_limit_qty;
	}
	
	@Override
	public String toString() {
		return "OptionDTO [op_id=" + op_id + ", op_name=" + op_name + ", reward_id=" + reward_id + ", op_limit_qty="
				+ op_limit_qty + ", oplist=" + oplist + "]";
	}
	
}
