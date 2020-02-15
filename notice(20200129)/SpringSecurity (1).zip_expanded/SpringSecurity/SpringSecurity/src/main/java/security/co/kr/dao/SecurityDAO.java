package security.co.kr.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import security.co.kr.domain.SecurityUser;

@Repository
public class SecurityDAO {
	
	@Autowired
	private SqlSession session;
	
	public SecurityUser selectUser(SecurityUser userInfo) {
		SecurityUser user = null;
		try {
			SecurityMapper mapper = session.getMapper(SecurityMapper.class);
			user = mapper.selectUser(userInfo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public void insertUser(SecurityUser user) {
		try {
			SecurityMapper mapper = session.getMapper(SecurityMapper.class);
			mapper.insertUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
