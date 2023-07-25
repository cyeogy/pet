package multi.com.pet.etc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import multi.com.pet.erp.LoginUserDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			LoginUserDTO user = (LoginUserDTO) session.getAttribute("user");
			
			if(user == null) { 
				response.sendRedirect("/pet/menu/login.do");
				return false;
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	

}
