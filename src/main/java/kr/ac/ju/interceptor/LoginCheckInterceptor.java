package kr.ac.ju.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("LOGIN_STUDENT") == null && 
				session.getAttribute("LOGIN_PROFESSOR") == null && 
				session.getAttribute("LOGIN_EMPLOYEE") == null) {
					
			request.getRequestDispatcher("/WEB-INF/views/error/deny.jsp").forward(request, response);
			
			return false;
		}
		
		return true;
	}
}
