package com.crowd.funding.maker.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MakerDTO {

	private int maker_idx;
	private String maker_name;
	private String maker_phone;

	private int maker_zipcode;
	private String maker_site;
	private String maker_intro;
	private String maker_photo;

	private int mem_idx;
	private MultipartFile file3;

}
