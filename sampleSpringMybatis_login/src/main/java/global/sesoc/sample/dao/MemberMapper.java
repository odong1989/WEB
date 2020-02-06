package global.sesoc.sample.dao;

import global.sesoc.sample.vo.Member;

public interface MemberMapper {
	

	public Member memberSelectOne (String member_id);
	public int	  memeberJoin(Member member);
}
