package com.crowd.funding.maker.model;

public interface MakerDAO {
	
	void makerPOST(MakerDTO maDTO) throws Exception;
	int idx(int mem_idx) throws Exception;
	int makeridx(int mem_idx) throws Exception;
	MakerDTO makerinfo(int pro_id) throws Exception;
	void makerinfoUP(MakerDTO maDTO) throws Exception;
	void delete(int maker_idx) throws Exception;

}
