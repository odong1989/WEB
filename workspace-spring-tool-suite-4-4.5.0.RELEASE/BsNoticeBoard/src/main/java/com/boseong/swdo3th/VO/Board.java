package com.boseong.swdo3th.VO;

import lombok.Data;

@Data
public class Board {
	/*
 create table board(
	board_no			number					primary key
	,member_id			varchar2(50)			not null --글을 쓴 사람이 누구인지 알기위해서 왜래키로 적용하고자 한다.(외래키 설정은 아래서 설정)--
	,board_title		varchar2(200)			not null
	,board_content		carchar2(2000)			not null
	,board_hits			number					default 0
	,board_savedfile	varchar2(200)
	,board_originfile	varchar2(200)
	,board_indate		date					default sysdate 
	
	*/
		
	private int		board_no;
	private String	member_id;
	private String	board_title	;
	private String  board_content;
	
	private int 	board_hits;
	private String  board_savedfile;
	private String  board_originfile;
	private String  board_indate;
			

}
