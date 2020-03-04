package com.boseong.swdo3th.DAO;

import com.boseong.swdo3th.VO.Member;

public interface MemberMapper {
	

	public Member memberSelectOne (String member_id);
	public int	  memeberJoin(Member member);
}
