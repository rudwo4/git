package spring.project.Mybatis.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import spring.project.Mybatis.vo.UserVO;

public class userLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	//로그인 성공한 경우
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		UserVO vo = (UserVO) authentication.getPrincipal();
		System.out.println("UserVO ==>" + vo);
		
		String msg = authentication.getName() + "님 환영합니다.";
		request.setAttribute("msg", msg);
		
		RequestDispatcher rd = request.getRequestDispatcher("/");
		rd.forward(request, response);
	}

}
