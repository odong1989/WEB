package com.sesoc.moneybook.dao;

import com.sesoc.moneybook.vo.Member;

public interface MemberMapper {

	public int insertMoneybookMember(Member member);
	public Member selectOne(String userid);

}
