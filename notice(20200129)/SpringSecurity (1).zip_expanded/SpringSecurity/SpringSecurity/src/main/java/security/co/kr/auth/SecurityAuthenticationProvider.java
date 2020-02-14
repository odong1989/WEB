/**
 * 
 */
package security.co.kr.auth;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import security.co.kr.dao.SecurityMapper;
import security.co.kr.domain.SecurityUser;
import security.co.kr.domain.SecurityUserConfig;

@Component
public class SecurityAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(SecurityAuthenticationProvider.class);
	
	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		WebApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
		
		sqlSession = (SqlSession) ctx.getBean("sqlSession");
		passwordEncoder = (PasswordEncoder) ctx.getBean("passwordEncoder");
		
		List<GrantedAuthority> roles = new ArrayList<>();
		
		String user_id = (String)authentication.getPrincipal();
		String user_pw	= (String)authentication.getCredentials();
		
		SecurityMapper mapper = sqlSession.getMapper(SecurityMapper.class);
		
		SecurityUser userInfo = new SecurityUser();
		userInfo.setUserId(user_id);
		
		SecurityUser user = mapper.selectUser(userInfo);
		
		
		//회원 비밀번호 체크
		if(!(passwordEncoder.matches(user_pw, user.getUserPw()))){
			logger.debug("사용자 비밀번호가 틀립니다.");
			throw new BadCredentialsException("비밀번호가 틀렸습니다. 다시 입력해 주세요.", new BadCredentialsException("비밀번호 오류"));
		}else{
			//회원 권한 부여
			roles.add(new SimpleGrantedAuthority("ROLE_"+user.getUserAuth()));
			UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(user_id, user_pw, roles);
			result.setDetails(new SecurityUserConfig(user));
			return result;
		}
	}
}
