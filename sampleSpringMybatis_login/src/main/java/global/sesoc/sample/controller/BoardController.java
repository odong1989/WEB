package global.sesoc.sample.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.sample.dao.BoardDAO;
import global.sesoc.sample.dao.MemberDAO;
import global.sesoc.sample.util.FileService;
import global.sesoc.sample.vo.Board;
import global.sesoc.sample.vo.Member;

/**
 * 사용자 입력을 받아 처리
 */
@Controller
@RequestMapping(value="/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final String uploadPath = "/uploadFile";//저장경로 설정
	@Autowired
	private BoardDAO dao;
	
	//보드(게시판)해줄 것 : 페이징 , 리스트 출력 등이 있지요 

	@RequestMapping(value="boardList", method=RequestMethod.GET)
	public String boardList(Model model) {
		logger.info("글 목록 시작");

		ArrayList<HashMap<String, Object>> list = dao.selectBoardList();
		model.addAttribute("list", list);
		return "/board/boardList";
	}
	
	@RequestMapping(value="boardWriteForm", method=RequestMethod.GET)
	public String boardWriteForm() {
		logger.info("글 등록폼 시작");
		
		
		return "/board/boardWriteForm";
	}
	
	@RequestMapping(value="boardWrite", method=RequestMethod.POST )
	public String boardWrite(Board board, MultipartFile upload,HttpSession session) {
		logger.info("글 등록(boardWrite)을 시작");
		/* 파일이 있는지 확인한 후
		 * 파일있음]=> 서버에 물리적으로 저장,
		 *           서버내에 저장된 경로를 DB에 저장한다
		 * 파일없음]=> 기본정보(글제목,내용)들만 저장.
		 * */

		
		logger.info("글 등록(boardWrite) - board : {}",board);
		logger.info("글 등록(boardWrite) - upload : {}",upload);
		logger.info("첨부파일 체크");		
		if(!upload.isEmpty()) {
			//저장파일이 있을시 물리적으로 저장합니다.
			String savedfile = FileService.saveFile(upload, uploadPath);
			board.setBoard_savedfile(savedfile);
			board.setBoard_originfile(upload.getOriginalFilename());
		}
		
		//세션에서 로그인한 사용자의 아이디를 갖고 옵니다.
		String loginId = (String)session.getAttribute("loginId");
		board.setMember_id(loginId);
		logger.info("글 등록(boardWrite) - loginId : {}",loginId);
		//저장된 파일경로 받아와서 DB에 저장한다
		
		int count = dao.insertBoard(board);
		logger.info("글 등록(boardWrite) - SQL실해여부 : {}",count);
		
		//글이 잘 저장되었나 리스트페이지로 갑니다.	
		return "redirect:boardList";
	}
	
	@RequestMapping(value="boardReadForm", method=RequestMethod.GET)	
	public String boardReadForm(int board_no, Model model) {
		//board번호를 FK로 활용하여 웹페지기 가기
		
		logger.info("board_no {}",board_no);
		HashMap<String, Object> board = dao.selectBoardOne(board_no);

		model.addAttribute("board", board);
		logger.info("board ({})",board);
		return "board/boardReadForm";
	}
	
}
