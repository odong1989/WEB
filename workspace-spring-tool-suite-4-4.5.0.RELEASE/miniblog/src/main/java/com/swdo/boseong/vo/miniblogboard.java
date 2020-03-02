package com.swdo.boseong.vo;

import lombok.Data;

@Data
public class miniblogboard {
	private String board_no;   
	private String 	miniblogmember_id;
	private String 	board_title;     
	private String 	board_contents;   
	private int 	board_hits;    
	private String board_savedfile;
	private String board_originfile;	
	private String board_indate;
}
	/*
drop table miniblogboard;
create table miniblogboard(
      board_no                number              primary key
      ,miniblogmember_id      varchar2(50)        not null 
      ,board_title            varchar2(200)       not null
      ,board_contents         varchar2(500)       not null
      ,board_hits             number              default 0
      ,board_savedfile        varchar2(200)
      ,board_originfile       varchar2(200)
      ,board_indate           date               default sysdate
      ,constraint board_fk foreign key(miniblogmember_id)   
      references miniblogmember(miniblogmember_id) on delete  cascade 
);  
create SEQUENCE miniblogboard_seq;

drop table miniblogreply;
create table miniblogreply(
      reply_no                number                        primary key
      ,board_no               number                        not null      --어떤 글에 대한 리플인가?(#외래키로 사용)--
      ,reply_content          varchar2(200)           not null
      ,miniblogmember_id              varchar2(50)            not null      --리플작성자의 ID--
      ,reply_indate           date                    default sysdate
      ,constraint reply_fk foreign key(board_no)
      references board(board_no) on delete cascade
);
create SEQUENCE miniblogreply_seq;
 * 
 * */
