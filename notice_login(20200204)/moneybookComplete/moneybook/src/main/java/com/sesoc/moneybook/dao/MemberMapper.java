package com.sesoc.moneybook.dao;

import com.sesoc.moneybook.vo.MemberVO;

public interface MemberMapper {

	public int signup(MemberVO vo);
	public int login(MemberVO vo);
}
