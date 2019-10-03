package com.crowd.funding.community.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.crowd.funding.community.model.NoticeDTO;
import com.crowd.funding.community.service.NoticeService;
import com.crowd.funding.community.service.Pager;

@Controller
@RequestMapping("/community/*")
public class NoticeController {

	@Inject
	NoticeService noticeService;

	@RequestMapping("/notice/notice.do")
	public ModelAndView list(@RequestParam(defaultValue = "name") String search_option,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {
		// 레코드 갯수 계산
		int count = 100;
		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<NoticeDTO> list = noticeService.listAll(start,end,search_option,keyword); // 목록
		ModelAndView mav = new ModelAndView();
		HashMap<String,Object> map=new HashMap<>();
		map.put("list", list); // 맵에 자료 저장
		map.put("count", count); 
		map.put("pager", pager); // 페이지 네비게이션을 위한 변수
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.setViewName("community/notice/notice"); // 이동할 페이지
		mav.addObject("map", map); // 데이터 저장
		return mav;
	}

	@RequestMapping("/notice/write.do")
	public String write() {
		return "community/notice/notice_write";
	}

	@RequestMapping("/notice/detail.do")
	public ModelAndView view(@RequestParam int notice_idx, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("community/notice/notice_detail");
		mav.addObject("dto", noticeService.read(notice_idx));
		return mav;
	}

	@RequestMapping("/notice/insert/{mem_idx}")
	public ModelAndView insert(@PathVariable int mem_idx, @ModelAttribute NoticeDTO dto, ModelAndView mav) throws Exception {
		// 로그인한 사용자의 아이디
		/*
		 * String writer = (String) session.getAttribute("mem_email");
		 * dto.setWriter(writer);
		 */
		mav.setViewName("redirect:/community/notice/notice.do");
		mav.addObject("mem_idx", mem_idx);
		System.out.println("####################"+mem_idx);
		// 레코드가 저장됨
		noticeService.create(dto);
		return mav; // 목록 갱신
	}
	
	@RequestMapping("/notice/update.do")
	public String update() {
		return "community/notice/notice_update";
	}

	@RequestMapping("/notice/delete/{notice_idx}")
	public String delete(@PathVariable int notice_idx, HttpSession session) throws Exception {
		noticeService.delete(notice_idx);
		return "redirect:/community/notice/notice.do"; // 목록 갱신
	}
		
}
