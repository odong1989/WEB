package com.swdo.memo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.memo.vo.Memo;

@Repository
public class MemoDAO {
	
	@Autowired
	private SqlSession session;
	
	public int insertMemo(Memo memo) {
		int cnt = 0;
		try {
			MemoMapper mapper = session.getMapper(MemoMapper.class);
			cnt = mapper.insertMemo(memo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public ArrayList<Memo> selectMemoList(){
		ArrayList<Memo> list = null;
		try {
			MemoMapper mapper = session.getMapper(MemoMapper.class);
			list = mapper.selectMemoList();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
	
	
	
}
