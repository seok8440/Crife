package com.crowd.funding.community.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.crowd.funding.community.model.CommentDTO;
import com.crowd.funding.community.service.CommentService;
import com.crowd.funding.community.service.Pager;

@RestController
@RequestMapping("/comment/*")
public class CommentController {

	@Inject
	CommentService commentService;
	
	@RequestMapping("cmt_insert/{mem_email}")
	public ModelAndView insert(@PathVariable String mem_email, @ModelAttribute CommentDTO dto, ModelAndView mav) throws Exception {
		mav.setViewName("project/pro_detail");
		mav.addObject("mem_email", mem_email);
		System.out.println("######################"+dto.getMem_email());
		System.out.println("######################"+dto.getNews_idx());
		commentService.insert_comment(dto);
		return mav;
	}

	/*
	 * @RequestMapping("list.do") public ModelAndView list(int
	 * news_idx, @RequestParam(defaultValue="1") int curPage, ModelAndView mav,
	 * HttpSession session) { int count = commentService.count(news_idx); Pager
	 * pager = new Pager(count, curPage); // int start = pager.getPageBegin(); //
	 * int end = pager.getPageEnd(); List<CommentDTO> list =
	 * commentService.cmt_list(news_idx); mav.setViewName("project/pro_detail");
	 * mav.addObject("list", list); mav.addObject("pager", pager); return mav; }
	 */
}
