package com.crowd.funding.myorder.common;

import com.crowd.funding.myorder.domain.MyorderDTO;

public class JoinDATA extends MyorderDTO {
	private String pro_name;
	private String pro_category;
	private String mem_name;
	private String pro_imageURL;
	private String order_date;
	
	public String getPro_imageURL() {
		return pro_imageURL;
	}
	public void setPro_imageURL(String pro_imageURL) {
		this.pro_imageURL = pro_imageURL;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getPro_category() {
		return pro_category;
	}
	public void setPro_category(String pro_category) {
		this.pro_category = pro_category;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
}
