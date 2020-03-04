package com.boseong.swdo3th.VO;

import lombok.Data;

@Data
public class Reply {
/*
 create table reply(
	reply_no			number				primary key
	,board_no			number				not null	--어떤 글에 대한 리플인가?(#외래키로 사용)--
	,reply_content		varchar2(200)		not null
	,member_id			varchar2(50)		not null	--리플작성자의 ID--
	,reply_indate		date				default sysdate
	,constraint reply_fk foreign key(board_no)
	references board(board_no) on delete cascade
);
*/
	
	private int  	reply_no;		//시퀀스 통해 입력됨. 사람이 일일이 입력할 필요 없어
	private int 	board_no;		//보드의 번호를 가져옴. 사람이 입력할 필요가 없지.(#글이 존재하고 있으니 리플이 있지)
	private String  reply_content;	//리플 내용. 사용자의 입력을 가져온다.
	private String	member_id;		//세션에서 받아온다. 로그인한 사람의 id는 세션에서 갖고 있으니까
	private String  reply_indate;	//자동으로 입력된다.
	//이처럼 받아올 것들의 성격을 분류하는 것이 코드 작성시 좋습니다.

	/* 사용자 화면에서 넘겨 줄 것.
	private int 	board_no;		//보드의 번호를 가져옴. 사람이 입력할 필요가 없지.(#글이 존재하고 있으니 리플이 있지)
	private String  reply_content;	//리플 내용. 사용자의 입력을 가져온다.
	 */
	
}
