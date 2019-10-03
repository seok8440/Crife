package com.crowd.funding.project.model;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crowd.funding.reward.domain.OptionDTO;
import com.crowd.funding.reward.domain.RewardDTO;

@Repository
public class ProjectDAOImpl implements ProjectDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public void makerAdd(ProjectDTO dto) {
		sqlSession.insert("project.makerInsert", dto);
	}
	
	@Override
	public void add(ProjectDTO dto) {
		sqlSession.insert("project.add", dto);
	}
	
	@Override
	public void maker(ProjectDTO dto) {
		sqlSession.update("project.maker_update", dto);
	}

	@Override
	public ProjectDTO pro_detail(int pro_id) {
		return sqlSession.selectOne("project.pro_detail", pro_id);
	}

	@Override
	public void save1(ProjectDTO dto) {
		sqlSession.update("project.save1", dto);
	}

	@Override
	public String nameSelect(int pro_id) {
		return sqlSession.selectOne("project.pro_name", pro_id);
	}

	@Override
	public int idSelect(String pro_name) {
		return sqlSession.selectOne("project.pro_id", pro_name);
	}

	@Override
	public List<ProjectDTO> listProject() {
		return sqlSession.selectList("project.pro_list");
	}

	@Override
	public List<ProjectDTO> my_pro(int mem_idx) {
		return sqlSession.selectList("project.my_pro", mem_idx);
	}

	@Override
	public void my_delete(int pro_id) {
		sqlSession.delete("project.my_delete", pro_id);
	}

	@Override
	public void story_update(ProjectDTO dto) {
		sqlSession.update("project.story_update", dto);
	}

	@Override
	public void request(int pro_id) {
		sqlSession.update("project.request", pro_id);
	}
	
	@Override
	public void insertReward(List<RewardDTO> list) {
		sqlSession.insert("project.reward_insert",list);
	}

	@Override
	public void insertOption(List<OptionDTO> list) {
		sqlSession.insert("project.option_insert",list);
	}

	@Override
	public void delReward(int pro_id) {
		sqlSession.delete("project.reward_del", pro_id);
	}

	@Override
	public List<OptionDTO> selOption(int pro_id) {
		return sqlSession.selectList("project.option_sel", pro_id);
	}
}
