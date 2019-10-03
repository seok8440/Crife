package com.crowd.funding.admin.ad_project;

import java.util.List;

import com.crowd.funding.project.model.ProjectDTO;

public interface Ad_ProjectService {
	public List<ProjectDTO> proSearch(String searchOption, String keyword, int status, int start, int end) throws Exception;
	public int searchCount(String searchOption, String keyword) throws Exception;
	public int proCount(int pro_status) throws Exception;
}
