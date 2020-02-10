package global.sesoc.sample.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//import com.sun.media.jfxmedia.logging.Logger;

import global.sesoc.sample.controller.MemberController;
import global.sesoc.sample.vo.Board;
import global.sesoc.sample.vo.Member;


//@Repository를 붙여줘야 bean이 생성되어 보드다오가 전역으로 쓸수 있습니다.
@Repository
public class BoardDAO {

	//@Autowired를 선언하여 받아서 쓰겠다고 알림.
	@Autowired
	private SqlSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);

	/* 페이징 추가전 사항
	public ArrayList<HashMap<String, Object>> selectBoardList(){
		ArrayList<HashMap<String, Object>> list = null;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			list = mapper.selectBoardList();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	 * */
	
	public ArrayList<HashMap<String, Object>> selectBoardList(int startRecord, int countPerPage, String searchText){
		ArrayList<HashMap<String, Object>> list = null;
		try {
			//20.02.10 추가
			RowBounds rb =new RowBounds(startRecord, countPerPage);//DAO쪽으로 컨트롤러가 전달해줘야 한다는 것입니다.
			//마이바티스에서 제공하는 라운드로빈이라느 기능이며 사용자가 작성한 sellect 쿼리를 그대로 하면서 활용을 할 수 있다는 장점이 있기에 활용합니다.
			//20.02.10 추가 종료
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			//20.02.10 수정
			list = mapper.selectBoardList(rb, searchText);
			//20.02.10 수정 종료
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public int insertBoard(Board board) {
		int count =0;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			count = mapper.insertBoard(board);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
			
		return count;
		}
	
	

	
	
	public HashMap<String, Object> selectBoardOne(int board_no){
		HashMap<String, Object> result = null;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			logger.info("(DAO)board_no ({})",board_no);
			result = mapper.selectBoardOne(board_no);
		}catch(Exception e) {
			e.printStackTrace();
		}
		logger.info("(DAO)result ({})",result);
		return result;
	}
	
	public int	selectTotalCount(String searchText) {
		int totalCount = 0;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			//logger.info("(DAO)board_no ({})",board_no);
			totalCount = mapper.selectTotalCount(searchText);
		}catch(Exception e) {
			e.printStackTrace();
		}
	//	logger.info("(DAO)result ({})",result);
		return totalCount;
	}
	
}
