package com.boseong.swdo3th.DAO;

import org.apache.ibatis.session.SqlSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//import com.sun.media.jfxmedia.logging.Logger;

import com.boseong.swdo3th.Controller.MemberController;
import com.boseong.swdo3th.VO.Board;
import com.boseong.swdo3th.VO.Member;

/**
 * 개인정보 관련 DB처리를 담당
 */
@Repository
public class MemberDAO {
	private static final Logger logger = LoggerFactory.getLogger(MemberDAO.class);	
	
	@Autowired
	private SqlSession session;

	public Member memberSelectOne (String member_id) {
		logger.info("BoardDAO.java - memberSelectOne 메소드 시작");
		Member member = null;
		
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			member = mapper.memberSelectOne(member_id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		logger.info("BoardDAO.java - memberSelectOne 리턴 member값 : {}", member);

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
	
	public String memberUpdateName(Member member){
		String changedName=null;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			mapper.memberUpdateName(member);
			changedName = member.getMember_nm();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return changedName;
	}

	public String memberUpdateAddress(Member member){
		String changedAddress=null;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			mapper.memberUpdateAddress(member);
			changedAddress = member.getMember_addr();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return changedAddress;
	}
}
