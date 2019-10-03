package com.crowd.funding.order.domain;

import java.util.ArrayList;
import java.util.List;

import com.crowd.funding.myorder.domain.MyoptionDTO;
import com.crowd.funding.myorder.domain.MyorderDTO;

public interface OrderDAO {
	
	public void insert(OrderDTO orderDTO) throws Exception; 
	public void myOrderInsert(ArrayList<MyorderDTO> myorderDTO) throws Exception;
	public OrderDTO orderInfo(int mem_idx) throws Exception;
	public void myOptionInsert(List<MyoptionDTO> oplist) throws Exception;
}
