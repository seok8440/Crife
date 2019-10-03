package com.crowd.funding.community.model;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crowd.funding.myorder.domain.MyorderDTO;

@Repository
public class NewsDAOImpl implements NewsDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<NewsDTO> pro_news(int pro_id) {
		return sqlSession.selectList("project.pro_news", pro_id);
	}

	@Override
	public void insert_news(NewsDTO dto) throws Exception {
		sqlSession.insert("project.insert_news", dto);
	}

	@Override
	public List<MyorderDTO> sup_list(int pro_id) {
		return sqlSession.selectList("community.listsup", pro_id);
	}

	@Override
	public int support_count(int pro_id) {
		return sqlSession.selectOne("community.count_sup", pro_id);
	}

}
