package global.sesoc.sample.dao;

import java.util.concurrent.ExecutionException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.sample.vo.Notice;

/**
 * 개인정보 관련 DB처리를 담당
 */
@Repository
public class NoticeDAO {
	@Autowired
	private SqlSession session;
	
	public int noticeInsert(Notice notice) {
		int count =0;
		try {
			NoticeMapper mapper = session.getMapper(NoticeMapper.class);
			count = mapper.noticeInsert(notice);
		}catch(Exception e) {
			e.printStackTrace();
			//파일을 삭제(물리적) -인셉션이 발생하면 실시.
		}
		return count;
	}
}
