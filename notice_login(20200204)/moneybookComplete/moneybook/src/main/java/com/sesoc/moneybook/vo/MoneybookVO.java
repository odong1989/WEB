package com.sesoc.moneybook.vo;

import lombok.Data;

@Data
public class MoneybookVO {
	private String infonum;
	private String userid;
	private String memo;
	private String type;
	private int amount;
	private String inputdate;
}
