create table security_user(
	userId			varchar2(30)			primary key,
	userPw			varchar2(30)			not null,
	userNm			varchar2(30)			not null,
	userAuth		varchar2(30)			default		'user'
);

insert into security_user(
	userId
	,userPw
	,userNm
)values(
	'user'
	,'pw'
	,'userNm'
);

insert into security_user(
	userId
	,userPw
	,userNm
	,userAuth
)values(
	'admin'
	,'pw'
	,'adminNm'
	,'admin'
);

commit;