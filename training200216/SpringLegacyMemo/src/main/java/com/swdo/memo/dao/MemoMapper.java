package com.swdo.memo.dao;

import java.util.ArrayList;

import com.swdo.memo.vo.Memo;

public interface MemoMapper {
	
	public int insertMemo(Memo memo);
	public ArrayList<Memo> selectMemoList();
	
}
