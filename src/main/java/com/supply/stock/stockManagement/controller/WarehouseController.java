package com.supply.stock.stockManagement.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.supply.stock.stockManagement.dto.Message;
import com.supply.stock.stockManagement.pojo.Warehouse;
import com.supply.stock.stockManagement.service.WarehouseService;
import com.supply.stock.stockManagement.dto.BaseCondition;

@Controller
@RequestMapping("/warehouse")
public class WarehouseController extends BaseController {
	
	@Autowired
	WarehouseService warehouseService;
	//首页 index

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String login() {
		return "warehouse/index";
	}
	
	//添加
	@ResponseBody
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Message add(Warehouse warehouse)
	{
		//Warehouse warehouse=new Warehouse();
		warehouseService.insertSelective(warehouse);
		
		if (warehouse.getId() != 0) {
			return successMessage();
		} else {
			return failMessage("新增仓库失败");
		} 
	}
	
	/**
	 * 获得列表数据
	 * 
	 * @param model
	 * @return 
	 */
	@ResponseBody
	@RequestMapping(value = "/list")
	public Map<String, Object> list(BaseCondition condition) {
		Page<Warehouse> pager = PageHelper.startPage(condition.getPage(), condition.getRows());
		List<Warehouse> list = warehouseService.select(new Warehouse());
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("total", pager.getTotal());
		result.put("rows", list);
		return result;
	}
}