package com.sesoc.moneybook.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.moneybook.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int signup(MemberVO vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.signup(vo);
	}
	
	public int login(MemberVO vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.login(vo);
	}
}







