package com.swdo.boseong.vo;

import lombok.Data;

@Data
public class MiniblogMember {
	private String miniblogmember_id;   
	private String 	password;
	private String 	membername;     
	private String 	email;   
	private String 	phone;      
	
}
/*
drop table miniblogmember;
create table miniblogmember(
miniblogmember_id         varchar2(100)       primary key     
,password         varchar2(100)       not null
,membername       varchar2(30)        not null   
,email            varchar2(100)       not null
,phone            varchar2(100)       not null
);
 */
