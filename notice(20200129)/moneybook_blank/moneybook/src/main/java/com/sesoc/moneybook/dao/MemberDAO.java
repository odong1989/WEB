package com.sesoc.moneybook.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.moneybook.controller.MemberController;
import com.sesoc.moneybook.vo.Member;

@Repository
public class MemberDAO {
	private static final Logger logger = LoggerFactory.getLogger(MemberDAO.class);	
	@Autowired
	private SqlSession session;
	
	public int insertMoneybookMember(Member member){
		int cnt=0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.insertMoneybookMember(member);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	return cnt;
	}
	public Member selectOne(String userid){
		Member member=null;
		
		logger.info(" selectOne userid :{}",userid);

		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			member = mapper.selectOne(userid);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		logger.info(" selectOne member :{}",member);
		return member;
	}

}
