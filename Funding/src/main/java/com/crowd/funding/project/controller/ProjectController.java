package com.crowd.funding.project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.crowd.funding.maker.service.MakerService;
import com.crowd.funding.member.model.MemberDTO;
import com.crowd.funding.project.model.ProjectDTO;
import com.crowd.funding.project.service.ProjectService;

@Controller
@RequestMapping("/project/*")
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	@Inject
	ProjectService projectService;
	
	@Inject
	MakerService makerService;

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
		// 로그인 상태일 때
		if (session != null) {
			projectService.makerAdd(dto);// 메이커생성
			projectService.add(dto); // 프로젝트 생성
			int pro_id = dto.getPro_id(); // 생성된 프로젝트 번호
			int maker_idx = dto.getMem_idx(); // 생성된 메이커 번호
			
			rttr.addAttribute("pro_id", pro_id); // controller로 id값을 넘길 수 있게 설정                                                                                                                                                                   ㅍ
			projectService.maker(dto); // 현재 생성된 프로젝트에 maker번호 추가해줌
			return "redirect:/project/input_page"; // id값을 넘김
		} else {
			return "/user/login"; // 비로그인 상태일 때는 로그인 페이지로 이동
		}
	}
	
	// 위에 controller에서 redirect로 id값이 넘어옴 
	@RequestMapping("input_page")
	public String input_list(HttpSession session, ProjectDTO dto, @RequestParam int pro_id, Model model) throws Exception {
		model.addAttribute("detail", projectService.pro_detail(pro_id)); // 프로젝트 번호에 맞는 프로젝트 정보를 가져옴
		model.addAttribute("maker_detail", makerService.makerinfo(dto.getPro_id()));
		return "project/input"; //input.jsp로 이동
	}

	// input_update.jsp에서 저장하기버튼 클릭 시
	@RequestMapping("save1")
	public String update(HttpSession session, ProjectDTO dto, Model model, MemberDTO mem) throws Exception {
		// 공백일 경우 null 셋팅
		if(dto.getPro_start().equals("") || dto.getPro_end().equals("")) {
			dto.setPro_start(null);
			dto.setPro_end(null);
		}
		String filename = "-";
		// 새로운 첨부 파일이 있으면
		if (!dto.getFile1().isEmpty()) {
			// 첨부 파일의 이름
			filename = dto.getFile1().getOriginalFilename();
			try {
				String path ="D:\\JavaBigData2th\\mywork_spring\\.metadata\\.plugins\\"
						+ "org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Funding\\resources\\images\\";
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
		model.addAttribute("maker_detail", makerService.makerinfo(dto.getPro_id()));
		return "project/input";
	}
	
	// input_update로 이동
	@RequestMapping("update_page")
	public String update_page(Model model, ProjectDTO dto) throws Exception { 
		model.addAttribute("detail",projectService.pro_detail(dto.getPro_id()));
		model.addAttribute("maker_detail", makerService.makerinfo(dto.getPro_id()));
		return "project/input";
	}
	
	@RequestMapping("story/{pro_id}")
	public ModelAndView storypage(@PathVariable("pro_id") int pro_id, ModelAndView mav, Model model) throws Exception {
		mav.setViewName("project/story_detail");
		model.addAttribute("maker_detail", makerService.makerinfo(pro_id));
		mav.addObject("detail", projectService.pro_detail(pro_id));
		return mav;
	}
	
	@RequestMapping("update/{pro_id}")
	public ModelAndView updatepage(@PathVariable("pro_id") int pro_id, ModelAndView mav, Model model) throws Exception {
		mav.setViewName("project/input");
		mav.addObject("detail", projectService.pro_detail(pro_id));
		model.addAttribute("maker_detail", makerService.makerinfo(pro_id));
		return mav;
	}
	
	@RequestMapping("detail/{pro_id}")
	public ModelAndView detail(@PathVariable("pro_id") int pro_id, ModelAndView mav, Model model) throws Exception {
		mav.setViewName("project/pro_detail");
		mav.addObject("dto", projectService.pro_detail(pro_id));
		model.addAttribute("maker_detail", makerService.makerinfo(pro_id));
		return mav;
	}
	
	// 상단 바 - 내 프로젝트 목록
	@RequestMapping("my_pro")
	public ModelAndView my_pro(HttpSession session, ModelAndView mav) {
		MemberDTO id = (MemberDTO) session.getAttribute("login");
		System.out.println("id.getMem_idx() : " + id.getMem_idx());
		mav.setViewName("project/my_project");
		mav.addObject("my_pro", projectService.my_pro(id.getMem_idx()));
		return mav;
	}
	
	// 프로젝트 삭제, 메이커 삭제
	@RequestMapping("my_delete")
	public String my_delete(int pro_id) throws Exception {
		makerService.delete(pro_id);
		projectService.my_delete(pro_id);
		return "redirect:/project/my_pro";
	}
	
	@RequestMapping("project/request")
	public String request(Model model, int pro_id) throws Exception {
		projectService.request(pro_id);
		model.addAttribute("detail",projectService.pro_detail(pro_id));
		model.addAttribute("maker_detail", makerService.makerinfo(pro_id));
		return "project/input";
	}

}