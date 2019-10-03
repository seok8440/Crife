package com.crowd.funding.myorder.service;

import java.util.List;

import com.crowd.funding.member.model.MemberDTO;
import com.crowd.funding.myorder.common.JoinDATA;
import com.crowd.funding.myorder.domain.MyoptionDTO;
import com.crowd.funding.myorder.domain.MyorderDTO;
import com.crowd.funding.myorder.domain.paging.Criteria;
import com.crowd.funding.order.domain.OrderDTO;
import com.crowd.funding.project.model.ProjectDTO;
import com.crowd.funding.reward.domain.RewardDTO;

public interface MyorderService {
	public List<JoinDATA> orderList(Criteria criteria);
	// public List<MyorderDTOJoin> orderDetail(MyorderDTOJoin myorderJoin);
	public MyorderDTO orderInfo(int order_id);
	public OrderDTO shipInfo(int order_id);
	public MemberDTO memInfo(int order_id);
	public ProjectDTO proInfo(int order_id);
	public List<RewardDTO> rewardinfo(int order_id);
	public List<MyoptionDTO> optioninfo(int order_id);
	public int countOrder(int mem_idx);
}
