package com.crowd.funding.project.service;

import java.util.List;

import com.crowd.funding.project.model.ProjectDTO;
import com.crowd.funding.reward.domain.OptionDTO;
import com.crowd.funding.reward.domain.RewardDTO;

public interface ProjectService {
	List<ProjectDTO> listProject();

	void add(ProjectDTO dto);

	ProjectDTO pro_detail(int pro_id);

	void save1(ProjectDTO dto);

	String nameSelect(int pro_id);

	int idSelect(String pro_name);

	List<ProjectDTO> my_pro(int mem_idx);

	void my_delete(int pro_id);

	void story_update(ProjectDTO dto);

	void request(int pro_id);
	
	void makerAdd(ProjectDTO dto);

	void maker(ProjectDTO dto);
	
	void insertReward(List<RewardDTO> list);
	
	void insertOption(List<OptionDTO> list);
	
	void delReward(int pro_id);
	
	List<OptionDTO> selOption(int pro_id);
}
