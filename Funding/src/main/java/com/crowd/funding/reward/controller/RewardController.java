package com.crowd.funding.reward.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crowd.funding.member.model.MemberDTO;
import com.crowd.funding.order.service.OrderService;
import com.crowd.funding.project.service.ProjectService;
import com.crowd.funding.reward.common.FirstDATA;
import com.crowd.funding.reward.domain.RewardDTO;
import com.crowd.funding.reward.service.RewardService;

@Controller
@RequestMapping("/reward")
public class RewardController {

	@Inject
	RewardService rewardService;
	@Inject
	OrderService orderService;
	@Inject
	ProjectService projectService;

	private static final Logger logger = LoggerFactory.getLogger(RewardController.class);
	
	@RequestMapping("/step10/{pro_id}")
	public String firstRead(Model model, @PathVariable("pro_id") int pro_id, HttpSession session) throws Exception {
		model.addAttribute("rewards", rewardService.rewardShow(pro_id));
		model.addAttribute("options", projectService.selOption(pro_id));
		model.addAttribute("pro_id",pro_id);
		if(session.getAttribute("login") == null) {
			return "/user/login";
		}
		// 보류 여러개 insert 하는거 먼저하고 할까 ?
		//model.addAttribute("orderCount", orderService.orderCount(pro_id));
		return "/reward/first_reward";
	}
	
	@RequestMapping("/step20/{pro_id}")
	public String secondRead(Model model, @ModelAttribute("firstDATA") FirstDATA firstDATA, 
	    @PathVariable("pro_id") int pro_id, HttpSession session) throws Exception {
		if(session.getAttribute("login") == null) {
			return "/user/login";
		}
		System.out.println("FirstDATA: " + firstDATA.toString());
		MemberDTO memDTO = (MemberDTO) session.getAttribute("login");
		int memIdx = memDTO.getMem_idx();
		model.addAttribute("rewardSel",firstDATA);
		model.addAttribute("pinfo", rewardService.personinfo(memIdx));
		model.addAttribute("orderInfo", orderService.orderInfo(memIdx));
		model.addAttribute("pro_id",pro_id);
		model.addAttribute("pro_name",projectService.nameSelect(pro_id));
		System.out.println(projectService.nameSelect(pro_id));
		//model.addAttribute("rewardSel", rewardService.rewardSel(reward_id));		
		return "/reward/second_reward";
	}
}
