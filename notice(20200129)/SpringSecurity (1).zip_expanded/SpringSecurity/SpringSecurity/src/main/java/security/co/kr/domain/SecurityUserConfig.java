package security.co.kr.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class SecurityUserConfig implements UserDetails{
	
	private static final long serialVersionUID = -7084588819777716024L;
	
	private SecurityUser user;
	
	public SecurityUserConfig(SecurityUser user){
		this.user = user;
	}
	
	public SecurityUser getUser(){
		return user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority("ROLE_"+user.getUserAuth()));
		return authorities;
	}

	@Override
	public String getPassword() {
		return user.getUserPw();
	}

	@Override
	public String getUsername() {
		return user.getUserNm();
	}

	//기간제 계정의 경우 기간만료 여부 
	//탈퇴여부
	@Override
	public boolean isAccountNonExpired() {
		return false;
	}

	//사용제제 여부
	//정지 여부
	@Override
	public boolean isAccountNonLocked() {
		return false;
	}

	//인증정보 만료 여부
	@Override
	public boolean isCredentialsNonExpired() {
		return false;
	}

	//휴면계정 여부
	@Override
	public boolean isEnabled() {
		return false;
	}
	
}
