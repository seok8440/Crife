package com.crowd.funding.community.model;

import java.util.List;

import com.crowd.funding.community.model.NoticeDTO;

public interface NoticeDAO {
	public void create(NoticeDTO dto) throws Exception; // 글쓰기
	public void update(NoticeDTO dto) throws Exception; // 글수정
	public void delete(int notice_idx) throws Exception; // 글삭제
	// 목록
	public List<NoticeDTO> listAll(int start, int end, String search_option, String keyword) throws Exception;
	public void increaseViewcnt(int notice_idx) throws Exception;// 조회수 증가 처리
	public NoticeDTO read(int notice_idx) throws Exception;// 레코드 조회
}
