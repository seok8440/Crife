package com.crowd.funding.community.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImple implements NoticeDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public void create(NoticeDTO dto) throws Exception {
		sqlSession.insert("community.insert_notice", dto);
	}

	@Override
	public void delete(int notice_idx) throws Exception {
		sqlSession.delete("community.delete_notice", notice_idx);
	}

	// 게시물 목록 리턴
	@Override
	public List<NoticeDTO> listAll(int start, int end, String search_option, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%" + keyword + "%");
		map.put("start", start); // 맵에 자료 저장
		map.put("end", end);
		// mapper에는 2개 이상의 값을 전달할 수 없음(dto 또는 map 사용)
		return sqlSession.selectList("community.noticeList", map);
	}

	// 조회수 증가 처리
	@Override
	public void increaseViewcnt(int notice_idx) throws Exception {
		sqlSession.update("community.increaseViewcnt", notice_idx);
	}

	// 게시물 조회
	@Override
	public NoticeDTO read(int notice_idx) throws Exception {
		return sqlSession.selectOne("community.detail_notice", notice_idx);
	}

	@Override
	public void update(NoticeDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
