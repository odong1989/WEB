package com.sesoc.testTraining200123.dao;


import java.util.ArrayList;
import java.util.HashMap;

import com.sesoc.testTraining200123.vo.MemoVO;//내 틀림1
 
public interface MemoMapper {
	public int 					insertMemo (MemoVO memo);
	//나의 잘못 day27-1 ArrayList<MemoVO>선언을 헷갈림.
	public ArrayList<MemoVO>	ListView   ();
	public int 					deleteMemo (HashMap<String, Object> params);
	public int 					updateMemo (MemoVO memo);
	public MemoVO				selectMemo (String memo_no);
}
