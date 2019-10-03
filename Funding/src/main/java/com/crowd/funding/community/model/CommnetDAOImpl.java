package com.crowd.funding.community.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommnetDAOImpl implements CommentDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<CommentDTO> list(Integer news_idx, int start, int end) {
		Map<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("news_idx", news_idx);
		return sqlSession.selectList("community.listcmt", map);
	}

	@Override
	public int count(int news_idx) {
		return sqlSession.selectOne("community.count", news_idx);
	}

	@Override
	public void insert_comment(CommentDTO dto) {
		sqlSession.insert("community.insert_comment", dto);
	}

	@Override
	public void update(CommentDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Integer cmt_idx) {
		// TODO Auto-generated method stub

	}

	@Override
	public CommentDTO detail(int cmt_idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CommentDTO> cmt_list(int pro_id) {
		return sqlSession.selectList("community.listcmt", pro_id);
	}

}
