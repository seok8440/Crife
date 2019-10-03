package com.crowd.funding.myorder.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.crowd.funding.member.model.MemberDTO;
import com.crowd.funding.myorder.common.JoinDATA;
import com.crowd.funding.myorder.domain.MyoptionDTO;
import com.crowd.funding.myorder.domain.MyorderDAO;
import com.crowd.funding.myorder.domain.MyorderDTO;
import com.crowd.funding.myorder.domain.paging.Criteria;
import com.crowd.funding.order.domain.OrderDTO;
import com.crowd.funding.project.model.ProjectDTO;
import com.crowd.funding.reward.domain.RewardDTO;

@Service
public class MyorderServiceImpl implements MyorderService {

	@Inject
	MyorderDAO myorderDAO;

	@Override
	public List<JoinDATA> orderList(Criteria criteria) {
		return myorderDAO.orderList(criteria);
	}

	@Override
	public MyorderDTO orderInfo(int order_id) {
		return myorderDAO.orderInfo(order_id);
	}

	@Override
	public OrderDTO shipInfo(int order_id) {
		return myorderDAO.shipInfo(order_id);
	}

	@Override
	public MemberDTO memInfo(int order_id) {
		return myorderDAO.memInfo(order_id);
	}

	@Override
	public ProjectDTO proInfo(int order_id) {
		return myorderDAO.proInfo(order_id);
	}

	@Override
	public List<RewardDTO> rewardinfo(int order_id) {
		return myorderDAO.rewardinfo(order_id);
	}

	@Override
	public List<MyoptionDTO> optioninfo(int order_id) {
		return myorderDAO.optioninfo(order_id);
	}

	@Override
	public int countOrder(int mem_idx) {
		// TODO Auto-generated method stub
		return myorderDAO.countOrder(mem_idx);
	}
}
