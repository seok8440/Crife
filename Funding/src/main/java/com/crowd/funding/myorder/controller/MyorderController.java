package com.crowd.funding.myorder.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crowd.funding.member.model.MemberDTO;
import com.crowd.funding.myorder.domain.paging.Criteria;
import com.crowd.funding.myorder.domain.paging.PageMaker;
import com.crowd.funding.myorder.service.MyorderService;

@Controller
@RequestMapping("/mypage")
public class MyorderController {

	@Inject
	MyorderService myorderService;
	
	@RequestMapping("/myorder/orderlist")
	// mem_idx 받아야함.
	public String myRewardList(Model model, HttpSession session, @ModelAttribute("criteria") Criteria criteria ) {
		// mem_idx에 해당하는 부분을 4에 넣어야한다.
		MemberDTO memDTO = (MemberDTO) session.getAttribute("login");
		int memIdx = memDTO.getMem_idx();
		PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(criteria);
        pageMaker.setTotalCount(myorderService.countOrder(memIdx));
        criteria.setMem_idx(memIdx);
		model.addAttribute("rewardList", myorderService.orderList(criteria));
		model.addAttribute("pageMaker", pageMaker);
		return "/myorder/orderlist";
	}
	@RequestMapping("/myorder/orderdetail/{order_id}")
	public String myOrderList(Model model, @PathVariable("order_id") int order_id) {
		model.addAttribute("orderinfo", myorderService.orderInfo(order_id));
		model.addAttribute("proinfo", myorderService.proInfo(order_id));
		model.addAttribute("meminfo", myorderService.memInfo(order_id));
		model.addAttribute("shipinfo", myorderService.shipInfo(order_id));
		model.addAttribute("rewardinfo", myorderService.rewardinfo(order_id));
		model.addAttribute("optioninfo", myorderService.optioninfo(order_id));
		return "/myorder/orderdetail";
	}
	
	/*
	 * @RequestMapping("/myreward/fundinglist") // mem_idx 받아야함. public String
	 * payment(Model model, @RequestParam("pro_id") int pro_id) {
	 * model.addAttribute("rewardList", myorderService.rewardList(pro_id)); return
	 * "/myorder/myreward"; }
	 */
	
	@RequestMapping("/myprofile/fundinglist")
	public void myFundingList() {
		
	}
}
