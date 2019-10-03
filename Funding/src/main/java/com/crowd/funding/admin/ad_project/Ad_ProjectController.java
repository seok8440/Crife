package com.crowd.funding.admin.ad_project;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.crowd.funding.community.service.Pager;
import com.crowd.funding.project.model.ProjectDTO;

@Controller
@RequestMapping("/admin/*")
public class Ad_ProjectController {

	@Inject
	Ad_ProjectService proService;
	

	@RequestMapping("/proSearch.do")
	public ModelAndView proSearch(@RequestParam(defaultValue = "pro_name") String searchOption,
			                      @RequestParam(defaultValue = "") String keyword, 
			                      @RequestParam(defaultValue = "1") int curPage,
			                      @RequestParam(defaultValue = "0") int status) 
					throws Exception {

		int proCount2 = proService.proCount(2);
		int proCount3 = proService.proCount(3);
		int proCount4 = proService.proCount(4);
		int proCount5 = proService.proCount(5);
		
		System.out.println("========================="+proCount2 +"//"+proCount3+"==========================");
		
		int count = proService.searchCount(searchOption, keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<ProjectDTO> proSearch = proService.proSearch(searchOption, keyword, status, start, end);
		ModelAndView mav = new ModelAndView(); // 모델과 뷰

		HashMap<String, Object> map = new HashMap<>();
		map.put("list", proSearch);
		map.put("proCount2", proCount2);
		map.put("proCount3", proCount3);
		map.put("proCount4", proCount3);
		map.put("proCount5", proCount3);
		map.put("count", count); // 레코드 갯수
		map.put("pager", pager);
		map.put("searchOption", searchOption); // 검색옵션
		map.put("keyword", keyword); // 검색 키워드
		map.put("status",status);

		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		System.out.println(count + "여기야 여기~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

		mav.setViewName("admin/project/pro_search"); // 전달할 데이터
		return mav;
	}

	// 프로젝트 리스트 (조회전)
	@RequestMapping(value = "/projectList.do",method = RequestMethod.GET)
	public String projectList(ModelAndView mav,@RequestParam(defaultValue = "pro_name") String searchOption,
            @RequestParam(defaultValue = "") String keyword, 
            @RequestParam(defaultValue = "1") int curPage,
            @RequestParam(defaultValue = "0") int status) throws Exception {
		
		int proCount2 = proService.proCount(2);
		int proCount3 = proService.proCount(3);
		int proCount4 = proService.proCount(4);
		int proCount5 = proService.proCount(5);
		
		
		HashMap<String, Object> map = new HashMap<>();
		
		

		
		return "admin/project/pro_search";
	}

	/*
	 * @RequestMapping("/projectApply.do") public String projectApply() throws
	 * Exception { return "admin/project/pro_apply"; }
	 * 
	 * @RequestMapping("/projectProgress.do") public String projectProgress() throws
	 * Exception { return "admin/project/pro_progress"; }
	 * 
	 * @RequestMapping("/projectProgress.do") public String projectProgress() throws
	 * Exception { return "admin/project/pro_progress"; }
	 */

}
