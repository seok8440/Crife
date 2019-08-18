package com.crowd.funding.maker.controller;

import java.io.File;

import javax.inject.Inject;
import javax.print.DocFlavor.READER;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.crowd.funding.maker.model.MakerDTO;
import com.crowd.funding.maker.service.MakerService;
import com.crowd.funding.member.model.MemberDTO;
import com.crowd.funding.project.model.ProjectDTO;

@Controller
@RequestMapping(value = "/maker")
public class MakerController {
	
	@Inject
	MakerService maService;
	
	//메이커 등록뷰 이동
	@RequestMapping(value = "/maker", method = RequestMethod.GET)
	public String makerGET() throws Exception{
		return "maker/maker_join";
	}
	
	//메이커 등록 처리
	@RequestMapping(value = "/makerPOST", method = RequestMethod.POST)
	public String makerPOST(@RequestParam int mem_idx, MakerDTO maDTO, Model model, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		
		// 로그인이 되어 있는 상태
		int idx = maService.idx(mem_idx);
		
		if(idx==0) {
			System.out.println("#### 메이커 insert ##### ");
			maService.makerPOST(maDTO);
			
		}else {
			System.out.println("메이커 등록이 되어 있음");
			return "redirect:/";
		}		
											//mem_idx에 맞는 maker_idx
		session.setAttribute("maker_idx", maService.makeridx(mem_idx));
		model.addAttribute("maker_idx", maService.makeridx(mem_idx));
		//로그인이 되어 있는 동안, maker_idx값 있음! 로그아웃 후, 로그인하면 세션이 만료되어 날라감. 어떻게 해결해야 하냐?	
		// logininterceptor에 maker_idx를 넣어줌! 해결끝!
		
		return "redirect:/";
	}

	
		
	//메이커 정보 뷰
	@RequestMapping(value = "/makerinfo", method = RequestMethod.GET)
	public String makerinfoGET(@RequestParam int mem_idx, Model model) throws Exception{
		model.addAttribute("maker", maService.makerinfo(mem_idx));
		return "maker/makerinfo";
	}
	
	
	//메이커 정보 - 수정
	@RequestMapping(value = "/save4", method = RequestMethod.POST)
	public String makerinfoUP(MakerDTO dto, HttpSession session, Model model) throws Exception{
		System.out.println("%%% 메이커 정보 수정 : maker_idx : "+ dto.getMaker_idx()+"%%%");
		String filename = "-";
		// 새로운 첨부 파일이 있으면
		if (!dto.getFile3().isEmpty()) {
			// 첨부 파일의 이름
			filename = dto.getFile3().getOriginalFilename();
			try {
				String path ="D:\\JavaBigData2th\\mywork_spring\\.metadata\\.plugins\\"
						+ "org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Funding\\resources\\images\\";
				// 디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				// 임시 디렉토리에 저장된 첨부파일을 이동
				dto.getFile3().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setMaker_photo(filename);
		} else { // 새로운 첨부 파일이 없을 때
			// 기존에 첨부한 파일 정보를 가져옴
			MakerDTO dto2 = maService.makerinfo(dto.getMem_idx());
			dto.setMaker_photo(dto2.getMaker_photo());
		}
		maService.makerinfoUP(dto);
		model.addAttribute("id", session.getAttribute("login"));
		model.addAttribute("maker_detail", maService.makerinfo(dto.getMaker_idx()));
		return "project/input";
	}
	
	//메이커 정보 - 삭제?
	@RequestMapping(value = "/maker_del", method = RequestMethod.POST)
	public String makerinfoDEL(@ModelAttribute MakerDTO maDTO, HttpSession http) throws Exception{
		System.out.println("%%% 메이커 정보 삭제 : maker_idx "+maDTO.getMaker_idx()+" %%%");
		System.out.println("%%% 메이커 정보 삭제 : mem_idx "+maDTO.getMem_idx()+" %%%");
		
		
		maService.makerinfoDEL(maDTO);
		//session에 저장된 maker_idx 삭제
		Object ob = http.getAttribute("maker_idx");
		if(ob!=null) {
			http.removeAttribute("maker_idx");
		}
		
		//진행중인 프로젝트가 있다면 삭제 불가!
		//완료된 프로젝트만 있다면,? 프로젝트내용도 삭제?? 보관?? 어떻게 해야함???
		return "maker/makerDEL";
	}
	

}
