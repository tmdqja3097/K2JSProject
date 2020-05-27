package com.k2js.p1.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.k2js.p1.member.MemberVO;

@Component
public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean result = false;
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		if(memberVO != null) {
			if(memberVO.getId().equals("admin")) {
				result = true;
			}
		}else {
			result = false;
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/defaultAccess.jsp");
			view.forward(request, response);
		}
		return result;
	}
}
