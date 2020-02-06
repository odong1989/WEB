package global.sesoc.sample.dao;

import org.apache.ibatis.session.SqlSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//import com.sun.media.jfxmedia.logging.Logger;

import global.sesoc.sample.controller.MemberController;
import global.sesoc.sample.vo.Member;

/**
 * 개인정보 관련 DB처리를 담당
 */
@Repository
public class MemberDAO {
	private static final Logger logger = LoggerFactory.getLogger(MemberDAO.class);	
	
	@Autowired
	private SqlSession session;

	/**
	 * 전달된 Person객체의 값을 DB로 저장
	 * @param person
	 */
	public Member memberSelectOne (String member_id) {
		Member member = null;
		
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			member = mapper.memberSelectOne(member_id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return member;
	}

	public int memeberJoin(Member member) {
		int result = 0;
		
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			result = mapper.memeberJoin(member);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}	
	
	
}
