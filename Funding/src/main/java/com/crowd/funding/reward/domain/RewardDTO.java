package com.crowd.funding.reward.domain;

import java.util.List;

import com.crowd.funding.myorder.domain.MyorderDTO;

public class RewardDTO {
	int reward_id; // order_reward_T의 키 값
	int pro_id; // project_T의 키 값
	int mem_idx; // member_T의 키값
	String reward_title;
	int reward_price;
	int reward_sell_count; // 리워드 판매가능한 갯수 
	int sumAmount; // 각 리워드별 합산 
	MyorderDTO myorderDTO;
	int order_qty; // 사용자가 주문한 수량
	int qty; // 사용자가 선택한 리워드별 수량
	String reward_description; // 리워드 상세설명
	String reward_option_detail; // 리워드 옵션
	String shipment_start;
	int delivery_fee;
	int op_val;
	List<RewardDTO> list;
	List<OptionDTO> optionlist;

	
	public int getOp_val() {
		return op_val;
	}

	public void setOp_val(int op_val) {
		this.op_val = op_val;
	}

	public List<OptionDTO> getOptionlist() {
		return optionlist;
	}

	public void setOptionlist(List<OptionDTO> optionlist) {
		this.optionlist = optionlist;
	}

	public int getDelivery_fee() {
		return delivery_fee;
	}

	public void setDelivery_fee(int delivery_fee) {
		this.delivery_fee = delivery_fee;
	}

	public String getShipment_start() {
		return shipment_start;
	}

	public void setShipment_start(String shipment_start) {
		this.shipment_start = shipment_start;
	}

	public List<RewardDTO> getList() {
		return list;
	}

	public void setList(List<RewardDTO> list) {
		this.list = list;
	}

	public String getReward_description() {
		return reward_description;
	}

	public void setReward_description(String reward_description) {
		this.reward_description = reward_description;
	}

	public String getReward_option_detail() {
		return reward_option_detail;
	}

	public void setReward_option_detail(String reward_option_detail) {
		this.reward_option_detail = reward_option_detail;
	}

	public int getOrder_qty() {
		return order_qty;
	}

	public void setOrder_qty(int order_qty) {
		this.order_qty = order_qty;
	}

	public MyorderDTO getMyorderDTO() {
		return myorderDTO;
	}

	public void setMyorderDTO(MyorderDTO myorderDTO) {
		this.myorderDTO = myorderDTO;
	}

	public int getReward_id() {
		return reward_id;
	}

	public void setReward_id(int reward_id) {
		this.reward_id = reward_id;
	}

	public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	public int getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}

	public String getReward_title() {
		return reward_title;
	}

	public void setReward_title(String reward_title) {
		this.reward_title = reward_title;
	}

	public int getReward_price() {
		return reward_price;
	}

	public void setReward_price(int reward_price) {
		this.reward_price = reward_price;
	}

	public int getReward_sell_count() {
		return reward_sell_count;
	}

	public void setReward_sell_count(int reward_sell_count) {
		this.reward_sell_count = reward_sell_count;
	}

	public int getSumAmount() {
		return sumAmount;
	}

	public void setSumAmount(int sumAmount) {
		this.sumAmount = sumAmount;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "RewardDTO [reward_id=" + reward_id + ", pro_id=" + pro_id + ", mem_idx=" + mem_idx + ", reward_title="
				+ reward_title + ", reward_price=" + reward_price + ", reward_sell_count=" + reward_sell_count
				+ ", sumAmount=" + sumAmount + ", myorderDTO=" + myorderDTO + ", order_qty=" + order_qty + ", qty="
				+ qty + ", reward_description=" + reward_description + ", reward_option_detail=" + reward_option_detail
				+ ", shipment_start=" + shipment_start + ", delivery_fee=" + delivery_fee + ", list=" + list
				+ ", optionlist=" + optionlist + "]";
	}

}
