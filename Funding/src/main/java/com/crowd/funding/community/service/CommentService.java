package com.crowd.funding.community.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.crowd.funding.community.model.CommentDTO;
import com.crowd.funding.community.model.NewsDTO;

public interface CommentService {
	public List<CommentDTO> list(Integer news_idx, int start, int end, HttpSession session);
	List<CommentDTO> cmt_list(int news_idx);
	public int count(int news_idx);
	public void insert_comment(CommentDTO dto);
	public void update(CommentDTO dto);
	public void delete(Integer cmt_idx);
	public CommentDTO detail(int cmt_idx);
}
