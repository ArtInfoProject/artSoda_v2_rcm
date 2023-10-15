package com.art.project.common;

import java.sql.Date;

import lombok.Data;

@Data
public class GoodsDTO {

	private int gdsNum;
	private String gdsName;
	private String cateCode;
	private int gdsPrice;
	private int gdsStock;
	private String gdsDes;
	private String gdsImg;
	private Date gdsDate;
	
	private String gdsThumbImg;
}
