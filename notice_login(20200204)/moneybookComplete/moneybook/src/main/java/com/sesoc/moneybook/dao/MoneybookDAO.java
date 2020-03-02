package com.sesoc.moneybook.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.moneybook.vo.MoneybookVO;

@Repository
public class MoneybookDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public void write(MoneybookVO vo) {
		MoneyBookMapper mapper = sqlSession.getMapper(MoneyBookMapper.class);
		mapper.write(vo);
	}
	
	public void remove(MoneybookVO vo) {
		MoneyBookMapper mapper = sqlSession.getMapper(MoneyBookMapper.class);
		mapper.remove(vo);
	}
	
	public ArrayList<MoneybookVO> list(MoneybookVO vo) {
		MoneyBookMapper mapper = sqlSession.getMapper(MoneyBookMapper.class);
		return mapper.list(vo);
	}
}







