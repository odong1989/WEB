package com.swdo.boseong.DAO;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.swdo.boseong.vo.MiniblogMember;

public class MemberDAO {
	
	@Autowired
	private SqlSession session;

	public MiniblogMember selectOne(String checkId){
		MiniblogMember result =null;
		
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			result = mapper.selectOne(checkId);
		}
		catch(Exception e){
			 e.printStackTrace();
		}
		
		return result;
	}
	
	
	
}
