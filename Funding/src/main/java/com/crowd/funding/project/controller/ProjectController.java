package com.crowd.funding.project.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.crowd.funding.community.model.NewsDTO;
import com.crowd.funding.community.service.CommentService;
import com.crowd.funding.community.service.NewsService;
import com.crowd.funding.maker.service.MakerService;
import com.crowd.funding.member.model.MemberDTO;
import com.crowd.funding.project.model.ProjectDTO;
import com.crowd.funding.project.service.ProjectService;
import com.crowd.funding.reward.domain.RewardDTO;
import com.crowd.funding.reward.service.RewardService;

@Controller
@RequestMapping("/project/*")
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	@Inject
	ProjectService projectService;

	@Inject
	MakerService makerService;
	
	@Inject
	CommentService commentService;
	
	@Inject
	NewsService newsService;

	@Inject
	RewardService rewardService;
	
	// check.jsp로 이동
	@RequestMapping("check")
	public String check() {
		return "project/check";
	}

	// list.jsp로 이동
	@RequestMapping("listv")
	public String list(Model model) {
		// 프로젝트 리스트를 DB에서 가져와서 모델에 넣음
		model.addAttribute("list", projectService.listProject());
		return "project/list";
	}

	// input.jsp로 이동
	@RequestMapping("add")
	public String input(HttpSession session, ProjectDTO dto, RedirectAttributes rttr, Model model) {
		
		projectService.makerAdd(dto); // 메이커생성
		projectService.add(dto); // 프로젝트 생성
		int pro_id = dto.getPro_id(); // 생성된 프로젝트 번호

		rttr.addAttribute("pro_id", pro_id); // controller로 id값을 넘길 수 있게 설정
		projectService.maker(dto); // 현재 생성된 프로젝트에 maker번호 추가해줌
		return "redirect:/project/input_page"; // id값을 넘김
		
	}

	// 위에 controller에서 redirect로 id값이 넘어옴
	@RequestMapping("input_page")
	public String input_list(HttpSession session, ProjectDTO dto, @RequestParam int pro_id, Model model) throws Exception {
		model.addAttribute("detail", projectService.pro_detail(pro_id)); // 프로젝트 번호에 맞는 프로젝트 정보를 가져옴
		model.addAttribute("maker_detail", makerService.makerinfo(dto.getPro_id())); // 프로젝트 번호에 맞는 메이커 정보를 가져옴
		return "project/input"; // input.jsp로 이동
	}

	// input_update.jsp에서 저장하기버튼 클릭 시
	@RequestMapping("save1")
	public String update(HttpSession session, ProjectDTO dto, Model model, MemberDTO mem) throws Exception {

		// 공백일 경우 null 셋팅
		if (dto.getPro_start().equals("") || dto.getPro_end().equals("")) {
			dto.setPro_start(null);
			dto.setPro_end(null);
		}
		String filename = "-";
		// 새로운 첨부 파일이 있으면
		if (!dto.getFile1().isEmpty()) {
			// 첨부 파일의 이름
			filename = dto.getFile1().getOriginalFilename();
			try {
				// 이미지 파일 저장경로(본인 컴퓨터에 맞게 설정 workspace->.metadata->.plugins->??)
				String path ="C:\\eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\"
						+ "tmp0\\wtpwebapps\\Funding\\resources\\images";
				// 디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				// 임시 디렉토리에 저장된 첨부파일을 이동
				dto.getFile1().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setPro_imageURL(filename);
		} else { // 새로운 첨부 파일이 없을 때
			// 기존에 첨부한 파일 정보를 가져옴
			ProjectDTO dto2 = projectService.pro_detail(dto.getPro_id());
			dto.setPro_imageURL(dto2.getPro_imageURL());
		}
		projectService.save1(dto);
		model.addAttribute("id", session.getAttribute("login"));
		model.addAttribute("detail", projectService.pro_detail(dto.getPro_id()));
		return "project/input";
	}

	// 스토리에서 저장버튼 클릭
	@RequestMapping("save3")
	public String my_story(Model model, ProjectDTO dto) throws Exception {
		projectService.story_update(dto);
		model.addAttribute("maker_detail", makerService.makerinfo(dto.getPro_id()));
		model.addAttribute("detail", projectService.pro_detail(dto.getPro_id()));
		return "project/input";
	}

	// input_update로 이동
	@RequestMapping("update_page")
	public String update_page(Model model, ProjectDTO dto) throws Exception {
		model.addAttribute("detail", projectService.pro_detail(dto.getPro_id()));
		model.addAttribute("maker_detail", makerService.makerinfo(dto.getPro_id()));
		// 리워드 보여주기
		model.addAttribute("rewards", rewardService.rewardShow(dto.getPro_id()));
		model.addAttribute("options", projectService.selOption(dto.getPro_id()));
		return "project/input";
	}

	// 스토리
	@RequestMapping("story/{pro_id}")
	public ModelAndView storypage(@PathVariable("pro_id") int pro_id, ModelAndView mav, Model model) throws Exception {
		mav.setViewName("project/story_detail");
		model.addAttribute("maker_detail", makerService.makerinfo(pro_id));
		mav.addObject("detail", projectService.pro_detail(pro_id));
		return mav;
	}
	
	// 프로젝트 수정하기
	@RequestMapping("update/{pro_id}")
	public ModelAndView updatepage(@PathVariable("pro_id") int pro_id, ModelAndView mav, Model model) throws Exception {
		mav.setViewName("project/input");
		mav.addObject("detail", projectService.pro_detail(pro_id));
		model.addAttribute("maker_detail", makerService.makerinfo(pro_id));
		return mav;
	}

	// 프로젝트 상세보기
	@RequestMapping("detail/{pro_id}")
	public ModelAndView detail(@PathVariable("pro_id") int pro_id, ModelAndView mav, Model model) throws Exception {
		mav.setViewName("project/pro_detail");
		mav.addObject("dto", projectService.pro_detail(pro_id));
		mav.addObject("com_news", newsService.pro_news(pro_id));
		mav.addObject("com_cmt", commentService.cmt_list(pro_id));
		mav.addObject("sup_list", newsService.sup_list(pro_id));
		mav.addObject("sup_count", newsService.support_count(pro_id));
		model.addAttribute("maker_detail", makerService.makerinfo(pro_id));
		return mav;
	}
	
	// 프로젝트 새소식 등록폼 이동
	@RequestMapping("news_write/{pro_id}")
	public ModelAndView news_write (@PathVariable("pro_id") int pro_id, ModelAndView mav) throws Exception{
		mav.setViewName("community/news_write");
		mav.addObject("news_dto", projectService.pro_detail(pro_id));
		return mav;
	}
	
	// 프로젝트 새소식 등록하기
	@RequestMapping("news_insert/{pro_id}&{maker_idx}")
	public ModelAndView insert(@PathVariable int pro_id, @PathVariable int maker_idx, @ModelAttribute NewsDTO dto, ModelAndView mav) throws Exception {
		/*
		 * // 로그인한 사용자의 아이디 String writer = (String) session.getAttribute("mem_email");
		 * dto.setWriter(writer);
		 */
		System.out.println("######################"+pro_id);
		System.out.println("######################"+maker_idx);
		mav.setViewName("redirect:/project/detail/{pro_id}");
		mav.addObject("pro_id", pro_id);
		mav.addObject("maker_idx", maker_idx);
		// 레코드가 저장됨
		newsService.insert_news(dto);
		return mav; // 목록 갱신
	}

	// 상단 바 - 내 프로젝트 목록
	@RequestMapping("my_pro")
	public ModelAndView my_pro(HttpSession session, ModelAndView mav, Model model) {
		MemberDTO id = (MemberDTO) session.getAttribute("login");
		System.out.println("id.getMem_idx() : " + id.getMem_idx());
		mav.setViewName("project/my_project");
		mav.addObject("my_pro", projectService.my_pro(id.getMem_idx()));
		return mav;
	}

	// 프로젝트 삭제, 메이커 삭제
	@RequestMapping("my_delete")
	public String my_delete(ProjectDTO dto) throws Exception {
		projectService.my_delete(dto.getPro_id());
		makerService.delete(dto.getMaker_idx());
		return "redirect:/project/my_pro";
	}
	// 프로젝트 승인요청버튼
	@RequestMapping("project/request")
	public String request(Model model, int pro_id) throws Exception {
		projectService.request(pro_id);
		model.addAttribute("detail", projectService.pro_detail(pro_id));
		model.addAttribute("maker_detail", makerService.makerinfo(pro_id));
		return "project/input";
	}
	//리워드 삽입 컨트롤러
	@RequestMapping(value="/rewardInput", method = RequestMethod.POST)
	@ResponseBody
	public Map insertReward(@RequestBody RewardDTO rewardDTO, HttpSession session) throws Exception {
		MemberDTO memDTO = (MemberDTO) session.getAttribute("login");
		int memIdx = memDTO.getMem_idx();
		// 공백일 경우 null 셋팅
		
		if(rewardDTO.getList().get(0).getPro_id() != 0)
			projectService.delReward(rewardDTO.getList().get(0).getPro_id());
	    if (rewardDTO != null) {
	    	for(int i = 0 ; i < rewardDTO.getList().size(); i++) {
	    		rewardDTO.getList().get(i).setMem_idx(memIdx);
	    		if (rewardDTO.getList().get(i).getShipment_start().equals("")) {
	    			rewardDTO.getList().get(i).setShipment_start(null);
	    		}
			}
	    	projectService.insertReward(rewardDTO.getList());
	    	// 옵션 rewardId 매핑 작업, 옵션 insert
	    	for(int i = 0 ; i < rewardDTO.getList().size(); i++) {
		    	int rewardId = rewardDTO.getList().get(i).getReward_id();
		    	RewardDTO rewardList = rewardDTO.getList().get(i);
		    	if(rewardList.getOptionlist().size() != 0) {
			    	for (int j = 0; j < rewardList.getOptionlist().size(); j++) {
			    		rewardList.getOptionlist().get(j).setReward_id(rewardId);
			    	}
			    	// 옵션 insert
			    	projectService.insertOption(rewardList.getOptionlist());
		    	}
			}
	    }
	    
	    System.out.println("RewardDTO >>"+rewardDTO.toString());
	    //System.out.println("optionDTo >>"+rewardDTO.getList().get(0).getOptionlist().get(0).toString());
	 
		Map<String, Object> result = new HashMap<>();
		result.put("result", Boolean.TRUE);
		return result;

	}

}