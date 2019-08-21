package com.crowd.funding.maker.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.crowd.funding.maker.model.MakerDAO;
import com.crowd.funding.maker.model.MakerDTO;

@Service
public class MakerServiceImpl implements MakerService {

	@Inject
	MakerDAO maDAO;
	
	@Override
	public void makerPOST(MakerDTO maDTO) throws Exception {
		System.out.println("### makerService : makerPOST ###");
		maDAO.makerPOST(maDTO);
	}
	
	@Override
	public int idx(int mem_idx) throws Exception {
		System.out.println("### makerService : idx ###");
		return maDAO.idx(mem_idx);
	}



	@Override
	public int makeridx(int mem_idx) throws Exception {
		System.out.println("### makerService : makeridx ###");
		return maDAO.makeridx(mem_idx);
	}

	@Override
	public MakerDTO makerinfo(int pro_id) throws Exception {
		System.out.println("### makerService : makerinfo ###");
		return maDAO.makerinfo(pro_id);
	}
	


	@Override
	public void makerinfoUP(MakerDTO maDTO) throws Exception {
		System.out.println("### makerService : makerinfoUP ###");
		maDAO.makerinfoUP(maDTO);
	}

	@Override
	public void delete(int maker_idx) throws Exception {
		System.out.println("### makerService : makerinfoDEL ###");
		maDAO.delete(maker_idx);
	}
	
	

}
