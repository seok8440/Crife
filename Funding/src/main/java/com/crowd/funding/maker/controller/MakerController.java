package com.crowd.funding.maker.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.crowd.funding.maker.model.MakerDTO;
import com.crowd.funding.maker.service.MakerService;
import com.crowd.funding.project.model.ProjectDTO;
import com.crowd.funding.project.service.ProjectService;

@Controller
@RequestMapping(value = "/maker/*")
public class MakerController {

	@Inject
	MakerService maService;
	
	@Inject
	ProjectService projectService;

	// 메이커 정보 - 수정
	@RequestMapping(value = "save4", method = RequestMethod.POST)
	public String makerinfoUP(MakerDTO dto, HttpSession session, Model model, ProjectDTO pro) throws Exception {
		System.out.println("%%% 메이커 정보 수정 : maker_idx : " + dto.getMaker_idx() + "%%%");
		System.out.println("prorororo : " + pro.getPro_id());
		String filename = "-";
		// 새로운 첨부 파일이 있으면
		if (!dto.getFile3().isEmpty()) {
			// 첨부 파일의 이름
			filename = dto.getFile3().getOriginalFilename();
			try {
				String path = "D:\\JavaBigData2th\\mywork_spring\\.metadata\\.plugins\\"
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
			MakerDTO dto2 = maService.makerinfo(pro.getPro_id());
			dto.setMaker_photo(dto2.getMaker_photo());
		}
		maService.makerinfoUP(dto);
		model.addAttribute("id", session.getAttribute("login"));
		model.addAttribute("maker_detail", maService.makerinfo(pro.getPro_id()));
		model.addAttribute("detail", projectService.pro_detail(pro.getPro_id()));
		return "project/input";
	}

}