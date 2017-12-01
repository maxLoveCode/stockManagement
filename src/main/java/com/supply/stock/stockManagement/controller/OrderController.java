package com.supply.stock.stockManagement.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.supply.stock.stockManagement.dto.BaseCondition;
import com.supply.stock.stockManagement.pojo.Order;
import com.supply.stock.stockManagement.pojo.Warehouse;
import com.supply.stock.stockManagement.service.OrderService;
import com.supply.stock.stockManagement.service.WarehouseService;

@Controller
@RequestMapping("/order")
public class OrderController extends BaseController{
	
	@Autowired
	OrderService orderService;
	@Autowired
	WarehouseService warehouseService;
	
	
	/**
	 * 
	 * Insert预约参观
	 * 
	 */
	@RequestMapping(value="/appoint",method = RequestMethod.GET)
	public String appoint(Order order) {
		orderService.insertSelective(order);
		return "forward:/weindex";
	}
	
	/**
	 * 
	 * orderList
	 */
	@ResponseBody
	@RequestMapping(value = "orderList")
	public Map<String, Object> orderList(BaseCondition condition) {
		Page<Order> pager = PageHelper.startPage(condition.getPage(), condition.getRows());
		List<Order> list = orderService.selectList();
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows", list);
		result.put("total", pager.getTotal());
		return result;
	}
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String orderIndex() {
		return "order/index";
	}
	
	@RequestMapping(value = "appointmentIndex", method = RequestMethod.GET)
	public String appointmentIndex(ModelMap map,Warehouse warehouse) {
		List<Warehouse> warehouses=warehouseService.select(new Warehouse());
		map.addAttribute("warehouses", warehouses);
		map.addAttribute("warehouse", warehouse);
		return "wechat/appointmentIndex";
	}
}
