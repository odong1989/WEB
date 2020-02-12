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
	@RequestMapping(value="boardDelete", method=RequestMethod.GET)
	public String boardDelete(Board board, HttpSession session) {
		//1교시때 파일삭제를 깜박해서 파일삭제를 추가하고 있습니다.
		
		/* 첫 파라미터를 Board board로 하면 
		 * Board board = new Board();식으로 한번더 생성할 수고를 줄여줍니다.
		 * 
		 * [?]public String boardDelete(int board_no, HttpSession session) {
		 * 처럼 첫 파라미터를 int board_no로 직관적으로 만드면 안되요?
		 * [!] 결론은 기능상으로는 가능합니다(구현에 문제없어요)
		 *     하지만 사용자가 임의로 일일이 생성자 통해 생성하는 것을 지양하는 것이 스프링의 방침입니다.
		 * 스프링에서는 
		 * */
		//SQL에게 여러개의 값을 전달하는 방법은 VO객체형을 쓰거나, 해시맵을 쓰는 방법이 2가지이다. 
		logger.info("BoardController - boardDelete 메소드 시작");
		logger.info("BoardController - boardDelete - board : {}",board);
		logger.info("BoardController - boardDelete - session : {}",session);

		
		String loginId= (String)session.getAttribute("loginId");
		board.setMember_id(loginId);
		logger.info("BoardController - boardDelete - loginId : {}",loginId);
		
		
		HashMap<String, Object> map = dao.selectBoardOne(board.getBoard_no());/*지우기 전에 조회를 먼저합니다.*/
		//join해서 글쓴이까지 출력을 하려다보니 2개의 테이블이 합체(join)되었고 그에 따라 파라미터 받기도 해시맵으로 변경하였다.
		
		
		
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
	//팁 : 수정폼은 등록폼을 활용하여 만드는게 시간절약 됨
	
	@RequestMapping(value="boardUpdate", method=RequestMethod.POST)
	public String boardUpdate(Board board, MultipartFile upload, HttpSession session){
		//이전에 update의 sql부분을 작성합니다.(본영상 촬영전 깜박하고 촬영않음)
		/* 파일의 경우를 수를 나눠보면 아래와 같이 4가지로 나뉜다.
		             변동사항 내역               |    실시할 사항 
 	  	    -----------------|-----------------------------------------------
		 1. 기존파일 X,수정파일도 X | 아무것도 해주지 않아도 됨.
 	  	    -----------------|-----------------------------------------------
		  2. 기존파일 X,수정파일도 O|  파일을 등록함.
 	  	    -----------------|-----------------------------------------------
		  3. 기존파일 O,수정파일도 X|  아무것도 해주지 않아도 됨.
 	  	    -----------------|----------------------------------------------- 	  	    		     
		  4.기존파일 X,수정파일도 X| 기존파일을 삭제, 수정파일을 등록한다.
 	  	    ----------------|------------------------------------------------

			파일여부부터 체크하면 1,3을 먼저 일타쌍피로 걸러줄 수 있따.
			[주의] 등록은 무조건할거에요
		 */
		
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
	

}
