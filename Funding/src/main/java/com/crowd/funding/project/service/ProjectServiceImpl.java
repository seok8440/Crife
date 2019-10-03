package com.crowd.funding.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.crowd.funding.project.model.ProjectDAO;
import com.crowd.funding.project.model.ProjectDTO;
import com.crowd.funding.reward.domain.OptionDTO;
import com.crowd.funding.reward.domain.RewardDTO;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Inject
	ProjectDAO projectDao;

	@Override
	public void add(ProjectDTO dto) {
		projectDao.add(dto);
	}
	
	@Override
	public void maker(ProjectDTO dto) {
		projectDao.maker(dto);
	}
	
	@Override
	public String nameSelect(int pro_id) {
		return projectDao.nameSelect(pro_id);
	}

	@Override
	public ProjectDTO pro_detail(int pro_id) {
		return projectDao.pro_detail(pro_id);
	}

	@Override
	public void save1(ProjectDTO dto) {
		projectDao.save1(dto);
	}

	@Override
	public int idSelect(String pro_name) {
		return projectDao.idSelect(pro_name);
	}

	@Override
	public List<ProjectDTO> listProject() {
		return projectDao.listProject();
	}

	@Override
	public List<ProjectDTO> my_pro(int mem_idx) {
		return projectDao.my_pro(mem_idx);
	}

	@Override
	public void my_delete(int pro_id) {
		projectDao.my_delete(pro_id);
	}

	@Override
	public void story_update(ProjectDTO dto) {
		projectDao.story_update(dto);
	}

	@Override
	public void request(int pro_id) {
		projectDao.request(pro_id);
	}

	@Override
	public void makerAdd(ProjectDTO dto) {
		projectDao.makerAdd(dto);
	}
	
	@Override
	public void insertReward(List<RewardDTO> list) {
		projectDao.insertReward(list);
	}

	@Override
	public void insertOption(List<OptionDTO> list) {
		projectDao.insertOption(list);
	}

	@Override
	public void delReward(int pro_id) {
		projectDao.delReward(pro_id);
	}

	@Override
	public List<OptionDTO> selOption(int pro_id) {
		return projectDao.selOption(pro_id);
	}
	
}
