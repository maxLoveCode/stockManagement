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
		} else if (request.getRequestURI().toString().equals("/stockManagement/weindex")
				||request.getRequestURI().toString().equals("/error")
				||request.getRequestURI().toString().equals("/stockManagement/")){
			System.out.println(request.getRequestURI());
			return true;
		}else {

			System.out.println(request.getRequestURI());
			response.sendRedirect(request.getContextPath() + "/login");
			System.out.println(request.getSession().getAttribute(BaseController.SESSION_ID));
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
