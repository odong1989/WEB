package com.swdo.boseong.DAO;


import com.swdo.boseong.vo.MiniblogMember;

public interface MemberMapper {
	
	public MiniblogMember selectOne(String checkId);
}
