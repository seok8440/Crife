package com.crowd.funding.admin.manager;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Inject
	ManagerDAO managerDao;

	@Override
	public List<ManagerDTO> listManager() throws Exception {
		return managerDao.listManager();
	}

	@Override
	public void insertManager(ManagerDTO dto) throws Exception {
		managerDao.insertManager(dto);
	}

	@Override
	public void updateManager(ManagerDTO dto) throws Exception {
		managerDao.updateManager(dto);

	}

	@Override
	public void deleteManager(String admin_id) throws Exception {
		managerDao.deleteManager(admin_id);

	}

	@Override
	public ManagerDTO viewManager(String admin_id) throws Exception {
		return managerDao.viewManager(admin_id);
	}

	@Override
	public String loginCheck(ManagerDTO dto) throws Exception {
		
		return managerDao.loginCheck(dto);
	}

	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate(); // 세션 초기화
	}

}
