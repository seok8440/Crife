package com.crowd.funding.community.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.crowd.funding.community.model.CommentDAO;
import com.crowd.funding.community.model.CommentDTO;

@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	CommentDAO commentDao;
	
	@Override
	public List<CommentDTO> list(Integer news_idx, int start, int end, HttpSession session) {
		return commentDao.list(news_idx, start, end);
	}

	@Override
	public int count(int news_idx) {
		return commentDao.count(news_idx);
	}

	@Override
	public void insert_comment(CommentDTO dto) {
		commentDao.insert_comment(dto);
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
		return commentDao.cmt_list(pro_id);
	}

}
