package com.crowd.funding.admin.manager;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("admin/*")
public class ManagerController {
	
	@Inject
	ManagerService managerService;
	
	@RequestMapping("/adminhome.do")  //로그인 후 시작화면
	public String admin() throws Exception {
		
		return "admin/admin_home";
	}
	
	@RequestMapping("/managerList.do")
	public ModelAndView listManager(ModelAndView mav) throws Exception {
		List<ManagerDTO> items=managerService.listManager();
		mav.setViewName("/admin/manager/manager_list");
		mav.addObject("list", items);
		return mav;
	}
	
	/*
	 * @RequestMapping("/managerRegister.do") public String register(@ModelAttribute
	 * ManagerDTO dto) throws Exception{ managerService.insertManager(dto); return
	 * "redirect:/admin/managerList.do";
	 * 
	 * }
	 */
	
	@RequestMapping("/login.do")   //관리자로그인
	public String login() throws Exception {
		return "admin/admin_login";
	}

	@RequestMapping("/loginCheck.do")
	public ModelAndView loginCheck(ManagerDTO dto, 
			                       HttpSession session, ModelAndView mav) 
			     throws Exception {
		
		String name=managerService.loginCheck(dto);
		if(name != null) {
		session.setAttribute("admin_id", dto.getAdmin_id());
		session.setAttribute("admin_name", name);
		
		mav.setViewName("admin/admin_home");
		mav.addObject("message", "success");
		
		}else{
			mav.setViewName("admin/admin_login");
			mav.addObject("message", "error");
		}
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) { 
		session.invalidate(); //세션 초기화
		return "redirect:/admin/admin_login.do";
	}
	
}















