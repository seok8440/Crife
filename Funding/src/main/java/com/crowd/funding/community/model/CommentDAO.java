package com.crowd.funding.community.model;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface CommentDAO {
	public List<CommentDTO> list(Integer news_idx, int start, int end);
	List<CommentDTO> cmt_list(int pro_id);
	public int count(int news_idx);
	public void insert_comment(CommentDTO dto);
	public void update(CommentDTO dto);
	public void delete(Integer cmt_idx);
	public CommentDTO detail(int cmt_idx);
}
