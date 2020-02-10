package global.sesoc.sample.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.sample.dao.BoardDAO;
import global.sesoc.sample.dao.MemberDAO;
import global.sesoc.sample.util.FileService;
import global.sesoc.sample.util.PageNavigator;
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

	private int countPerPage=5;		//페이지당 글목록 수
	private int pagePerGroup=5;		//그룹당 페이지 수 
	
	
	@Autowired
	private BoardDAO dao;
	
	//보드(게시판)해줄 것 : 페이징 , 리스트 출력 등이 있지요 

	/*
	@RequestMapping(value="boardList", method=RequestMethod.GET)
	public String boardList(Model model) {
		logger.info("글 목록 시작");

		ArrayList<HashMap<String, Object>> list = dao.selectBoardList();
		model.addAttribute("list", list);
		return "/board/boardList";
	}
	*/
	

		//20.02.10 페이징위해서 업글하고 있습니다.
	@RequestMapping(value="boardList", method=RequestMethod.GET)
	public String boardList(Model model
							,@RequestParam(value="currentPage",defaultValue="1") int currentPage
							,@RequestParam(value="searchText",defaultValue="") String searchText) {
		logger.info("글 목록 시작");
		//전체 글수 카운트 
		int totalCount =dao.selectTotalCount(searchText); //선생님이 주신 페이지 네비게이터를 실행하기 위한 파라미터 4개를 모두 모았다.
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalCount);
		
		ArrayList<HashMap<String, Object>> list = dao.selectBoardList(navi.getStartRecord(), countPerPage, searchText);
																		//시작위치				,가져와야 할 개수,		검색조건
		model.addAttribute("list", list);			//출력할 목록 정보
		model.addAttribute("navi", navi);				//페이지 정보
		model.addAttribute("searchText", searchText);//검색어 정보
		model.addAttribute("totalCount", totalCount);
		return "/board/boardList";
	}
	
	
	//새로운 글을 올리는 절차 시작
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
	
	//[20.02.10] 다운로드 실시(board_no를 파라미터로 받는다)
	@RequestMapping(value="/download", method=RequestMethod.GET)
	public void download(int board_no,HttpServletResponse response) {
		//다운로드 스텝
		//스텝1. board_no를 통하여 조회(#selectBoardOne SQL활용)
		//스텝2. HttpServletResponse response 객체를 통해 파일다운로드 위한 헤더부분 작성
		//스텝3. 전체경로를 만들어줍니다(파일명만으로는 찾을 수 없어)
		
		//스텝1. board_no를 통하여 조회(#selectBoardOne SQL활용)
		HashMap<String, Object> board = dao.selectBoardOne(board_no);
		
		//스텝2. HttpServletResponse response 객체를 통해 파일다운로드 위한 헤더부분 작성
		String originFile =(String)board.get("BOARD_ORIGINFILE"); //대문자로 해야 먹히기 때문으로 깅억함.
		String savedFile= (String)board.get("BOARD_SAVEDFILE");

		try {
			response.setHeader("content-Disposition", "attachment;filename="+URLEncoder.encode(originFile,"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		//"content-Disposition" : 키값
		//"attachment" : 첨부파일이 있다는 의미.
		//filename= :파일명칭은 
		//+URLEncoder.encode(originFile,"UTF-8"")) : 파일명이 한글,일본어등이어도 번역이 되도록합니다.
		//예외처리를 해주어야 하기에 surround 관련 실시.
		
		
		//스텝3. 전체경로를 만들어줍니다(파일명만으로는 찾을 수 없어)
		String fullPath = uploadPath + "/" + savedFile ;
		
		//스텝4. 인풋스트림으로 파일을 읽고, 아웃풋스트림으로 파일을 내보냅니다.
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
	
	

}
