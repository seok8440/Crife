package com.crowd.funding.admin.ad_project;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.crowd.funding.project.model.ProjectDTO;

@Service
public class Ad_ProjectServiceImpl implements Ad_ProjectService {
	
	@Inject
	Ad_ProjectDAO proDao;
	
	
	@Override
	public List<ProjectDTO> proSearch(String searchOption, String keyword, 
			int status, int start, int end) throws Exception {
		return proDao.proSearch(searchOption, keyword, status, start, end);
	}


	@Override
	public int searchCount(String searchOption, String keyword) throws Exception {
		return proDao.searchCount(searchOption, keyword);
	}


	@Override
	public int proCount(int pro_status) throws Exception {
		return proDao.proCount(pro_status);
	}
	
	
}
