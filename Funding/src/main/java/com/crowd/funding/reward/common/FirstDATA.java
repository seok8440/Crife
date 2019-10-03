package com.crowd.funding.reward.common;

import java.util.ArrayList;
import java.util.List;

import com.crowd.funding.reward.domain.OptionDTO;
import com.crowd.funding.reward.domain.RewardDTO;

public class FirstDATA {
	int addDonation;
	private ArrayList<RewardDTO> list;
	private List<OptionDTO> optionlist;
	
	public List<OptionDTO> getOptionlist() {
		return optionlist;
	}
	public void setOptionlist(List<OptionDTO> optionlist) {
		this.optionlist = optionlist;
	}
	public ArrayList<RewardDTO> getList() {
		return list;
	}
	public void setList(ArrayList<RewardDTO> list) {
		this.list = list;
	}
	public int getAddDonation() {
		return addDonation;
	}
	public void setAddDonation(int addDonation) {
		this.addDonation = addDonation;
	}
	@Override
	public String toString() {
		return "FirstDATA [addDonation=" + addDonation + ", list=" + list + ", optionlist=" + optionlist + "]";
	}

}
