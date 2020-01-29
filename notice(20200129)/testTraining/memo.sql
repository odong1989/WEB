create table memo(
memo_no 	number(38)        primary key
,memo_pw 	varchar2(50) 	  not null 
,memo_content	varchar2(50)  not null
,memo_indate	date		  default sysdate
);
create Sequence memo_seq
start with 1;


--------------------------------------이하 문장은 sql 정상insert 체크용 문장입니다.---------------------
--insert into memo
--values(1,1234,'첫글!',sysdate);
 
 --xml형식으로 입력체크하는 문
insert into memo
(memo_no, memo_pw, memo_content, memo_indate)
values
(memo_seq.nextval,'1234','1234',sysdate);   

--출력문 (정상입력확인 위한)
select * from memo;
        