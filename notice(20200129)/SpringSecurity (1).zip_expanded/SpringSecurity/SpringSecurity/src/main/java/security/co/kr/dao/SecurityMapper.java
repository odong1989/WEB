package security.co.kr.dao;

import security.co.kr.domain.SecurityUser;

public interface SecurityMapper {
	public SecurityUser selectUser(SecurityUser userInfo);
	public void insertUser(SecurityUser user);
}
