package com.crowd.funding.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	//요청 전에 경유
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {
		//세션 객체 생성
		HttpSession session=request.getSession();
		if(session.getAttribute("admin_id")==null) {
			//로그인 페이지로 이동
			response.sendRedirect(request.getContextPath()
					+"/admin/admin_login.do?message=nologin");
			System.out.println("############################ 어드민 인터셉터 #####################");
			//메인 액션으로 이동하지 않음
			return false;
			
		}else{		
		//세션 변수가 있으면 메인 액션으로 이동
		    return true;
		}
	}

	//요청 후에 경유
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler, ModelAndView modelAndView) throws Exception {

		super.postHandle(request, response, handler, modelAndView);
	}
}
