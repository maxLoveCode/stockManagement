package com.supply.stock.stockManagement.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.supply.stock.stockManagement.controller.BaseController;

public class SessionInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (!StringUtils.isEmpty(request.getSession().getAttribute(BaseController.SESSION_ID))) {
			return true;
		} else if (request.getRequestURL().toString().equals("http://localhost:8080/stockManagement/weindex")){
			System.out.println(request.getRequestURL());
			return true;
		}else {
			response.sendRedirect(request.getContextPath() + "/login");
			
			System.out.println(request.getSession().getAttribute(BaseController.SESSION_ID));
			System.out.println("======REDIRECT======");
			return false;
		}
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
