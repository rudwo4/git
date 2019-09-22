package spring.project.Mybatis.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import spring.project.Mybatis.vo.UserVO;

//UserDetailsService :  스프링 프레임 워크에 내장된 인터페이스
//UserDetailsService : user 테이블의 정보를 가지고 인증처리를 위해 사용자 상세 정보를 제공하는 인터페이스
public class userAuthenticationService implements UserDetailsService{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	public userAuthenticationService() {}
	
	public userAuthenticationService(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	/* 핵심 코드
	 * 로그인 인증을 처리하는 코드
	 * 매개변수가 userid뿐이지만 패스워드까지 전달된다.(매개변수 username=>userid로 수정)
	 * 파라미터로 입력된 아이디값에 해당하는 테이블의 레코드를 읽어옴
	 * 정보가 없으면 예외를 발생시키고, 있으면 해당 정보가 map(vo)로 리턴된다. 
	 */
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		// id와 패스워가 불일치 시 null이 넘어오고, 일치 시 계정이 넘어온다.
		// 비밀번호 체크로 찍은 스프링 시큐리티안에 숨어있다.
		
		Map<String,Object> user = sqlSession.selectOne("spring.project.Mybatis.persistence.guestDAO.selectUser",userid);
		System.out.println("로그인 체크 ==>" + user);
		
		// 인증 실패 시 인위적으로 예외 발생
		if(user == null) throw new UsernameNotFoundException(userid);
		//ArrayList 먼저 import 후 GrantedAuthority import 실시
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		
		authority.add(new SimpleGrantedAuthority(user.get("AUTHORITY").toString()));
		
		//오라클에서는 필드명을 반드시 대문자 취급
		//오라클에서는 BigInteger 관련 오류가 발생할 수 있으므로 아래와 같이 처리
		
		//사용자가 입력한 값과 테이블의 USERNAME(=id), PASSWORD(아래)를 비교해서
		//비밀번호가 불일치시 LoginFailure, 일치 시 LoginSuccess
		//스프링 시큐리티에서 체크하는 아래 필드로 별칭울 줌, SELECT 시 테이블의 암호화 된 비밀번호와 사용자가 입력한 비밀번호를 내부로직으로 비교처리
		return new UserVO(user.get("USERNAME").toString(),
				user.get("PASSWORD").toString(),
				(Integer)Integer.valueOf(user.get("ENABLED").toString()) ==1,
				true, true,true, authority, user.get("USERNAME").toString());
	}

}