package com.crowd.funding.community.service;

import java.util.List;

import com.crowd.funding.community.model.NewsDTO;
import com.crowd.funding.myorder.domain.MyorderDTO;

public interface NewsService {
	List<NewsDTO> pro_news(int pro_id);
	List<MyorderDTO> sup_list(int pro_id);
	void insert_news(NewsDTO dto) throws Exception;
	int support_count(int pro_id);	// 서포터 수
}
