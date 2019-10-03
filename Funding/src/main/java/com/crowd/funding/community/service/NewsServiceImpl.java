package com.crowd.funding.community.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.crowd.funding.community.model.NewsDAO;
import com.crowd.funding.community.model.NewsDTO;
import com.crowd.funding.myorder.domain.MyorderDTO;

@Service
public class NewsServiceImpl implements NewsService {
	
	@Inject
	NewsDAO newsDao;

	@Override
	public List<NewsDTO> pro_news(int pro_id) {
		return newsDao.pro_news(pro_id);
	}

	@Override
	public void insert_news(NewsDTO dto) throws Exception {
		newsDao.insert_news(dto);
	}

	@Override
	public List<MyorderDTO> sup_list(int pro_id) {
		return newsDao.sup_list(pro_id);
	}

	@Override
	public int support_count(int pro_id) {
		return newsDao.support_count(pro_id);
	}

}
