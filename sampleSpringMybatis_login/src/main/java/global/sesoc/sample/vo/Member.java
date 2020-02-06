package global.sesoc.sample.vo;

import lombok.Data;

/**
 * 개인정보를 저장하는 VO 
 */
@Data
public class Member {
	/*
 	member_id		varchar2(50)			primary key
	,member_pw		varchar2(50)			not null
	,member_nm		varchar2(50)			not null
	,member_addr	varchar2(1000)			
	,member_indate	date					default sysdate
	*/
	private String member_id;
	private String member_pw;
	private String member_nm;
	private String member_addr;
	private String member_indate;	
}
