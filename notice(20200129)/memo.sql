create table memo(
memo_no 	number(38)        primary key
,memo_pw 	varchar2(50) 	  not null 
,memo_content	varchar2(50)  not null
,memo_indate	date		  default sysdate
);
create Sequence memo_seq
start with 1;