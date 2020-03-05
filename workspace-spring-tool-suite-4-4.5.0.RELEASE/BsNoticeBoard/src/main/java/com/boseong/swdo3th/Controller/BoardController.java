package com.boseong.swdo3th.Controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.boseong.swdo3th.DAO.BoardDAO;
import com.boseong.swdo3th.VO.Board;
import com.boseong.swdo3th.VO.Reply;
import com.boseong.swdo3th.util.FileService;
import com.boseong.swdo3th.util.PageNavigator;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value="board")
public class BoardController {
	
	private final String uploadPath = "/uploadFile";//저장경로 설정
	private int countPerPage=5;		//페이지당 글목록 수
	private int pagePerGroup=5;		//그룹당 페이지 수 
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardDAO dao;

	//1.게시판 글들 출력
	@RequestMapping(value="boardList", method=RequestMethod.GET)
	public String boardList(Model model
							,@RequestParam(value="currentPage",defaultValue="1") int currentPage
							,@RequestParam(value="searchText",defaultValue="") String searchText) {
		logger.info("글 목록 시작");
		//전체 글수 카운트 
		int totalCount =dao.selectTotalCount(searchText); 
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalCount);
		
		ArrayList<HashMap<String, Object>> list = dao.selectBoardList(navi.getStartRecord(), countPerPage, searchText);
																		//시작위치				,가져와야 할 개수,		검색조건
		model.addAttribute("list", list);			//출력할 목록 정보
		model.addAttribute("navi", navi);				//페이지 정보
		model.addAttribute("searchText", searchText);//검색어 정보
		model.addAttribute("totalCount", totalCount);
		return "/board/boardList";
	}
	
	
	//2.게시판 글 등록 ====================================================================================================
	//2.1게시판 글 등록폼 이동
	@RequestMapping(value="boardWriteForm", method=RequestMethod.GET)
	public String boardWriteForm() {
		logger.info("글 등록폼으로 이동");
		return "/board/boardWriteForm";
	}
	
	//2.2게시판 글 등록 실시.
	@RequestMapping(value="boardWrite", method=RequestMethod.POST )
	public String boardWrite(Board board, MultipartFile upload,HttpSession session) {
		logger.info("글 등록(boardWrite)을 시작");
		logger.info("글 등록(boardWrite) - board : {}",board);
		logger.info("글 등록(boardWrite) - upload : {}",upload);
		logger.info("첨부파일 체크");		
		if(!upload.isEmpty()) {//저장파일이 있을시 물리적으로 저장합니다.
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
	
	//3.게시판 글 읽기(1개의 글만 자세히 읽기)========================================================================
	@RequestMapping(value="boardReadForm", method=RequestMethod.GET)	
	public String boardReadForm(int board_no, Model model) {
		//board번호를 FK로 활용하여 웹페지기 가기
		HashMap<String, Object> board = dao.selectBoardOne(board_no);
		ArrayList<Reply> replyList = dao.selectReply(board_no);
		logger.info("board_no {}",board_no);
		
		
		model.addAttribute("board", board);
		model.addAttribute("replyList", replyList);
		logger.info("board ({})",board);
		
		
		dao.updateHits(board_no);
		return "board/boardReadForm";
	}
	
	//3.다운로드
	@RequestMapping(value="/download", method=RequestMethod.GET)
	public void download(int board_no,HttpServletResponse response) {
		HashMap<String, Object> board = dao.selectBoardOne(board_no);
		String originFile =(String)board.get("BOARD_ORIGINFILE");
		String savedFile= (String)board.get("BOARD_SAVEDFILE");

		try {
			response.setHeader("content-Disposition", "attachment;filename="+URLEncoder.encode(originFile,"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}		
		String fullPath = uploadPath + "/" + savedFile ;
		FileInputStream fi = null;
		ServletOutputStream so = null;
		
		try {
			fi = new FileInputStream(fullPath);
			so = response.getOutputStream();
			FileCopyUtils.copy(fi, so);//인풋스트림, 아웃풋스트림
			}catch(IOException e) {
			e.printStackTrace();
		}		
	} 
	
	//
	@RequestMapping(value="boardDelete", method=RequestMethod.GET)
	public String boardDelete(Board board, HttpSession session) {
		logger.info("BoardController - boardDelete 메소드 시작");
		String loginId= (String)session.getAttribute("loginId");
		board.setMember_id(loginId);
		
		logger.info("BoardController - boardDelete - board : {}",board);
		logger.info("BoardController - boardDelete - session : {}",session);
		logger.info("BoardController - boardDelete - loginId : {}",loginId);
	
		HashMap<String, Object> map = dao.selectBoardOne(board.getBoard_no());
	
		int count = dao.boardDelete(board);
		if(count == 1) {
			logger.info("DB의 계정 정보 삭제 성공");			
		}
		else {
			logger.info("DB의 계정 정보 삭제 실패");			
		}
		
		
		//step2. 파일삭제 ------------------------------------------------------------
		String savedfile = (String)map.get("BOARD_SAVEDFILE");
		//DB의 정보를 삭제가 성공했고 첨부파일이 있다면 첨부파일도 삭제한다. 
		if((count != 0) && (savedfile != null)){
			String fullPath = uploadPath + "/" + savedfile;
			//전체경로 = 폴더경로 (uploadPath)/파일명(savedfile)
			boolean flag = FileService.deleteFile(fullPath);
			
			if(flag) {
				logger.info("파일 삭제 성공");			
			}
			else {
				logger.info("파일 삭제 실패");			
			}		
		}
		return "redirect:boardList";
	}
	
	
	@RequestMapping(value="boardUpdateForm", method=RequestMethod.GET)
	public String boardUpdateForm(int board_no,Model model){
		HashMap<String, Object> map =dao.selectBoardOne(board_no);
		model.addAttribute("board", map);
		
		return "board/boardUpdateForm";
	}

	
	@RequestMapping(value="boardUpdate", method=RequestMethod.POST)
	public String boardUpdate(Board board, MultipartFile upload, HttpSession session){
		logger.info("boardUpdate 시작");
		//로그인 정보 수취
		String loginId = (String)session.getAttribute("loginId");
		board.setMember_id(loginId);
		logger.info("boardUpdate -board의 Member_id : {}",board.getMember_id());	
		//기존 정보를 갖고 옵니다.
		HashMap<String, Object> oldBoard = dao.selectBoardOne(board.getBoard_no());
		
		//파일이 저장된 여부를 구분하기위해 파일명을 받습니다.(null이면 파일없음, null이외 이름이면 파일이 있다)
		String oldSavedFile = (String)oldBoard.get("BOARD_SAVEDFILE");
		logger.info("boardUpdate -board의 oldSavedFile : {}",oldSavedFile);
		//검문1 : case 1,3인 아무것도 해주지 않아도 되는것인지 여부부터 분별.
		if(!upload.isEmpty()){
			//검문2 : 파일명이 비었느냐를 통해 2차 파일저장여부 체크
			if(oldSavedFile != null) {
				String fullPath = uploadPath + "/" + oldSavedFile;//기존의 저장된 파일을 삭제하기 위한 경로 정보 얻기
				FileService.deleteFile(fullPath);				  //기존 파일삭제
			}
			//신규파일 저장을 위한 준비작업.
			String savedFile = FileService.saveFile(upload, uploadPath);
			String originFile = upload.getOriginalFilename();
			board.setBoard_savedfile(savedFile);
			board.setBoard_originfile(originFile);
		}
		
		//수정하는 DAO함수를 호출한다.
		dao.boardUpdate(board);
		
		//기존의 글이 잘 갱신되었나 확인을 위해  redirect:
		//담당 문장은 boardReadForm
		//해당 글의 번호까지 주어야 제대로 감board_no="+board.getBoard_no();
		return "redirect:boardReadForm?board_no="+board.getBoard_no();
	}
	

	//3.리플=====================================================================================================================
	
	//3.1[실행]리플 추가
	@RequestMapping(value="/replyInsert", method=RequestMethod.POST)
	public String replyInsert(Reply reply, HttpSession session) {

		logger.info("BoardController - replyInsert 시작 ");
		
		String loginId = (String)session.getAttribute("loginId");
		logger.info("BoardController - replyInsert -loginId :{} ",loginId);
		
		reply.setMember_id(loginId);
		logger.info("BoardController - replyInsert -reply의 멤버아이디 :{} ",reply.getMember_id());
		logger.info("BoardController - replyInsert -reply의 정보 : {} ",reply);
		dao.replyInsert(reply);
		
		return "redirect:boardReadForm?board_no="+reply.getBoard_no();
	}
	
	
	//3.2[실헹] 리플 삭제
	@RequestMapping(value="/replyDelete", method=RequestMethod.GET)
	public String replyDelete(Reply reply, HttpSession session) {
	//	public String replyDelete(int reply_no, int board_no) {으로 선언하는 것보다 효율적이다
		String loginId = (String)session.getAttribute("loginId");
		reply.setMember_id(loginId);
		dao.replyDelete(reply);
		return "redirect:boardReadForm?board_no="+reply.getBoard_no();
		//해당 번호의 글로 바로 가기 위해 ?board_no="+reply.getBoard_no(); 를 추가합니다.
	}
	
	//3.3 리플 업데이트
	@RequestMapping(value="/replyUpdate", method=RequestMethod.POST)
	public String replyUpdate(Reply reply, HttpSession session){
		logger.info("BoardController - replyUpdate 시작 ");
		logger.info("BoardController - replyUpdate 파라미터 reply값 : {} ",reply);
		String loginId = (String)session.getAttribute("loginId");		
		reply.setMember_id(loginId);
		logger.info("BoardController - replyUpdate 파라미터 loginId값 : {} ",loginId);
		logger.info("BoardController - replyUpdate 파라미터 reply값 : {} ",reply);
		dao.replyUpdate(reply);
		
		return "redirect:boardReadForm?board_no="+reply.getBoard_no();
		
	}
	
	
	
}
