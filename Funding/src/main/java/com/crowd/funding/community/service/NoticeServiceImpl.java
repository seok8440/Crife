package com.crowd.funding.community.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.crowd.funding.community.model.NoticeDAO;
import com.crowd.funding.community.model.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	NoticeDAO noticeDao;
	
	@Override
	public void deleteFile(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<String> getAttach(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAttach(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAttach(String fullName, int bno) {
		// TODO Auto-generated method stub

	}

	@Override
	public void create(NoticeDTO dto) throws Exception {
		noticeDao.create(dto);
	}

	@Override
	public void update(NoticeDTO dto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int notice_idx) throws Exception {
		noticeDao.delete(notice_idx);
	}

	@Override
	public List<NoticeDTO> listAll(int start, int end, String search_option, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return noticeDao.listAll(start, end, search_option, keyword);
	}

	@Override
	public void increaseViewcnt(int notice_idx) throws Exception {
		noticeDao.increaseViewcnt(notice_idx);
	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NoticeDTO read(int notice_idx) throws Exception {
		return noticeDao.read(notice_idx);
	}

}
