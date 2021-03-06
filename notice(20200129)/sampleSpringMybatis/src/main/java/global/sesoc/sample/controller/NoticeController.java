package global.sesoc.sample.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.sample.dao.NoticeDAO;
import global.sesoc.sample.util.FileService;
import global.sesoc.sample.vo.Notice;

/**
 * 사용자 입력을 받아 처리
 */
@Controller
@RequestMapping(value="/notice")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	private final String uploadPath = "/uploadFile";
	//uploadPath는 첨부파일이 서버에 저장된 다음에야 생성되기 때문에 가제 성격으로 임시명을 지정한것 
	//C드라이브에 uploadFile이라는 이름의 폴더를 만들고 임시 저장한다는 식으로 생각하면 되겠습니다.
	
	@Autowired
	private NoticeDAO dao;

	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList() {
		logger.info("noticeList(게시글 목록) 으로 이동");
		return "notice/noticeList";
	}	
	
	@RequestMapping(value = "/noticeInsertForm", method=RequestMethod.GET)
	public String noticeInsertForm() {
		logger.info("noticeInsertForm(게시글 등록 폼)으로 이동");
		return "notice/noticeInsertForm";
	}	
	
	@RequestMapping(value="/noticeInsert", method=RequestMethod.POST)
	public String noticeInsert(Notice notice, MultipartFile upload) {
//public static String saveFile(MultipartFile mfile, String uploadPath)
	/*파일을 추가하기 위해서는 아래와 같이 3스텝을 밟습니다.
	 * 1.파일을 업로드
	 * 2. 업로드된 파일의 경로(파일명)을 VO에게 설정(set)
	 * 3.VO를 DB에 INSERT
	 * */ 
		
		//1.파일업로드(물리적)(#글만 올렸을수도 있으니까)
		if(!upload.isEmpty()) { //.isEmpty() : 객체가 비었냐(=파일없냐?)
			String savedfile = FileService.saveFile(upload, uploadPath);
			
			//2.업로드된 파일의 경로(파일명)을 VO에게 설정(set)
			//저장된 파일명(#DB측에서 사용자들이 정의한 이름들이 충돌하지 않도록 임의로 정해서 정리하는것)
			notice.setNotice_savedfile(savedfile);
			//원본 파일명(#사용자가 업로드시 정의한 파일명)
			notice.setNotice_originfile(upload.getOriginalFilename());
			
			// 3.VO를 DB에 INSERT
			int count = dao.noticeInsert(notice);
			
			if(count ==0) {
				logger.info("등록실패");
			}
		}
		
		return "redirect:noticeList";
		/* root(/)붙이면 안되는 이유는 이미 @RequestMapping(value="/notice")
		   으로 경로를 설정해주었기 때문.
		   정 쓰고 싶다면 절대경로로
		 return "redirect:/notice/noticeList";하거나. */
	}
	/*
	/**
	 * 입력 폼으로 이동
	 * @return
	 */
	/*
	@RequestMapping(value = "/inputForm", method = RequestMethod.GET)
	public String goInputForm() {
		logger.info("입력 폼으로 이동");
		return "inputForm";
	}
	
	@RequestMapping(value="input", method = RequestMethod.POST)
	public String input(Notice person) {
		logger.debug("폼으로부터 전달된 정보 : {}", person.toString());
		dao.insertPerson(person);
		return "redirect:/";
	}
	*/
}
