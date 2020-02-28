package com.sesoc.moneybook.vo;

import lombok.Data;

@Data
public class MoneybookVO {
	private String infonum;
	private String userid;
	private String memo;
	private String type;	//수입?지출? 양자 택일을 저장함.
	private int amount;
	private String inputdate;	//날짜정보를 저장
}
