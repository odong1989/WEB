package com.boseong.swdo3th.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.boseong.swdo3th.VO.Board;
import com.boseong.swdo3th.VO.Reply;

public interface BoardMapper {
	

	public int				 insertBoard(Board board);

//	<select id="selectBoardOne" parameterType="int" resultType="hashmap">
	public HashMap<String, Object> selectBoardOne(int board_no);
	
	//20.02.10 페이징 위해 업글
	public int	selectTotalCount(String searchText);
	
	//selectBoardList() 는  아래와 같이 업글테크트리를 타게 된다.
//	public ArrayList<Board> 				  selectBoardList();
//	public ArrayList<HashMap<String, Object>> selectBoardList();
	public ArrayList<HashMap<String, Object>> selectBoardList(RowBounds rb ,String searchText); //페이징까지 처리
	
	
	//20.02.11
	public int boardDelete(Board board);
	
	//20.02.11
	public void boardUpdate(Board board);
	
	//20.02.12
	public void 			replyInsert(Reply reply);
	public ArrayList<Reply> selectReply(int board_no);
	public void 				replyDelete(Reply reply);

	//20.02.13
	//	<update id="replyUpdate" parameterType="reply">
	public void replyUpdate(Reply reply);
	
	public void updateHits(int board_no);
	
	
}
