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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

			rttr.addAttribute("pro_id", pro_id); // controller로 id값을 넘길 수 있게 설정 ㅍ
			projectService.maker(dto); // 현재 생성된 프로젝트에 maker번호 추가해줌
			return "redirect:/project/input_page"; // id값을 넘김
		} else {
			return "/user/login"; // 비로그인 상태일 때는 로그인 페이지로 이동
		}
	}

	// 위에 controller에서 redirect로 id값이 넘어옴
	@RequestMapping("input_page")
	public String input_list(HttpSession session, ProjectDTO dto, @RequestParam int pro_id, Model model)
			throws Exception {
		model.addAttribute("detail", projectService.pro_detail(pro_id)); // 프로젝트 번호에 맞는 프로젝트 정보를 가져옴
		model.addAttribute("maker_detail", makerService.makerinfo(dto.getPro_id()));
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
				String path = "D:\\JavaBigData2th\\mywork_spring\\.metadata\\.plugins\\"
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

	@RequestMapping("project/request")
	public String request(Model model, int pro_id) throws Exception {
		projectService.request(pro_id);
		model.addAttribute("detail", projectService.pro_detail(pro_id));
		model.addAttribute("maker_detail", makerService.makerinfo(pro_id));
		return "project/input";
	}

	// 스마트에디터 싱글파일 업로드
	@RequestMapping("file_uploader")
	public String file_uploader(HttpServletRequest request, HttpServletResponse response, ProjectDTO dto) {
		String return1 = request.getParameter("callback");
		String return2 = "?callback_func=" + request.getParameter("callback_func");
		String return3 = "";
		String name = "";
		try {
			if (dto.getFile2() != null && dto.getFile2().getOriginalFilename() != null
					&& !dto.getFile2().getOriginalFilename().equals("")) {
				// 기존 상단 코드를 막고 하단코드를 이용
				name = dto.getFile2().getOriginalFilename()
						.substring(dto.getFile2().getOriginalFilename().lastIndexOf(File.separator) + 1);
				String filename_ext = name.substring(name.lastIndexOf(".") + 1);
				filename_ext = filename_ext.toLowerCase();
				String[] allow_file = { "jpg", "png", "bmp", "gif" };
				int cnt = 0;
				for (int i = 0; i < allow_file.length; i++) {
					if (filename_ext.equals(allow_file[i])) {
						cnt++;
					}
				}
				if (cnt == 0) {
					return3 = "&errstr=" + name;
				} else {
					// 파일 기본경로
					String dftFilePath = request.getSession().getServletContext().getRealPath("/");
					// 파일 기본경로 _ 상세경로
					String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator + "upload"
							+ File.separator;
					File file = new File(filePath);
					if (!file.exists()) {
						file.mkdirs();
					}
					String realFileNm = "";
					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
					String today = formatter.format(new java.util.Date());
					realFileNm = today + UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
					String rlFileNm = filePath + realFileNm;
					///////////////// 서버에 파일쓰기 /////////////////
					dto.getFile2().transferTo(new File(rlFileNm));
					///////////////// 서버에 파일쓰기 /////////////////
					return3 += "&bNewLine=true";
					return3 += "&sFileName=" + name;
					return3 += "&sFileURL=/resources/editor/upload/" + realFileNm;
				}
			} else {
				return3 += "&errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:" + return1 + return2 + return3;
	}

	// 스마트에디터 다중파일업로드
	@RequestMapping(value = "file_uploader_html5", method = RequestMethod.POST)
	@ResponseBody
	public String multiplePhotoUpload(HttpServletRequest request) {
		// 파일정보
		StringBuffer sb = new StringBuffer();
		try {
			// 파일명을 받는다 - 일반 원본파일명
			String oldName = request.getHeader("file-name");
			// 파일 기본경로 _ 상세경로
			String filePath = "D:\\JavaBigData2th\\mywork_spring\\.metadata\\.plugins\\"
					+ "org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Funding\\resources\\photoUpload";
			String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis()))
					.append(UUID.randomUUID().toString()).append(oldName.substring(oldName.lastIndexOf(".")))
					.toString();
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(filePath + saveName);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			os.flush();
			os.close();
			// 정보 출력
			sb = new StringBuffer();
			sb.append("&bNewLine=true").append("&sFileName=").append(oldName).append("&sFileURL=")
					.append("http://localhost:8888/Funding/resources/photoUpload/").append(saveName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}

}