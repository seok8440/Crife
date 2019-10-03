package com.crowd.funding.community.model;

import java.util.List;

import com.crowd.funding.myorder.domain.MyorderDTO;

public interface NewsDAO {
	List<NewsDTO> pro_news(int pro_id);	// 새소식 리스트
	List<MyorderDTO> sup_list(int pro_id);	// 서포터 리스트
	void insert_news(NewsDTO dto) throws Exception;	// 새소식 등록
	int support_count(int pro_id);	// 서포터 수
}
