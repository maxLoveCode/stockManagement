package com.supply.stock.stockManagement.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TreeSet;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supply.stock.stockManagement.pojo.User;
import com.supply.stock.stockManagement.pojo.Warehouse;
import com.supply.stock.stockManagement.service.UserService;
import com.supply.stock.stockManagement.service.WarehouseService;

@Controller
@RequestMapping("/")
public class IndexController extends BaseController {
	@Autowired
	WarehouseService warehouseService;
	@Autowired
	UserService userService;

	/**
	 * 跳转至api文档
	 * 
	 * @param response
	 */
	@RequestMapping(value = "/api", method = RequestMethod.GET)
	public void api(HttpServletResponse response) {
		try {
			response.sendRedirect("/swagger-ui.html");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 登录页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	/**
	 * 登录操作
	 * 
	 * @param username
	 * @param password
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(String username, String password, Model model, HttpSession session) {
	if (StringUtils.isEmpty(username)) {
		model.addAttribute("error", "用户名不能为空");
		return "login";
		}
		model.addAttribute("username", username);
		if (StringUtils.isEmpty(password)) {
		model.addAttribute("error", "密码不能为空");
			return "login";
		}
		User admin = userService.findUserByUsername(username);
		
		if (StringUtils.isEmpty(admin)) {
		model.addAttribute("error", "用户名不存在");
		return "login";
	}
	if (!admin.getPassword().equals(password)) {
		model.addAttribute("error", "用户名或密码错误");
			return "login";
		}

		//更新登录时间
		admin.setLogintime(new Date());
		userService.updateByPrimaryKey(admin);

		session.setAttribute(SESSION_ID, session.getId());
		session.setAttribute(SESSION_NAME, admin);
		session.setAttribute(WEBSOCKET_USERNAME, String.valueOf(admin.getId()));
		return "index";
	}

	/**
	 * 登出页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.setAttribute(SESSION_ID, null);
		session.setAttribute(SESSION_NAME, null);
		session.invalidate();
		return "login";
	}

	/**
	 * 主页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	/**
	 * 主页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/weindex", method = RequestMethod.GET)
	public String weindex(HttpSession session,Warehouse warehouse) {
		List<Warehouse> indexList = warehouseService.WarehouseList(warehouse);
		TreeSet<String> city =new TreeSet<String>();
		TreeSet<String> district =new TreeSet<String>();
		for (Warehouse warehouses : indexList) {
			if(null!=warehouses.getCity()&& null!=warehouses.getDistrict()) {
			city.add(warehouses.getCity());
			district.add(warehouses.getDistrict());
			}
		}
		System.out.println(indexList);
		session.setAttribute("list", indexList);
		session.setAttribute(SESSION_ID, session.getId());
		session.setAttribute(SESSION_NAME, "wechat");
		session.setAttribute(WEBSOCKET_USERNAME, "wechat");
		session.setAttribute("city", city);
		session.setAttribute("district",district);
		return "wechat/weindex";
	}
	
	/**
	 * 
	 * ajax显示
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/ajaxwarehouse", method = RequestMethod.GET)
	public List<Warehouse> ajaxwarehouse(Warehouse warehouse) {
	List<Warehouse> list=warehouseService.WarehouseList(warehouse);
	System.out.println("aaaaa");
		return list;
	}
	
	
}
