package com.supply.stock.stockManagement.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.supply.stock.stockManagement.dto.Message;
import com.supply.stock.stockManagement.pojo.Warehouse;
import com.supply.stock.stockManagement.service.WarehouseService;
import com.supply.stock.stockManagement.service.QiniuService;
import com.supply.stock.stockManagement.dto.BaseCondition;

@Controller
@RequestMapping("/warehouse")
public class WarehouseController extends BaseController {
	
	@Autowired
	WarehouseService warehouseService;
	@Autowired
	QiniuService qiniuService;
	
	
	//首页 index
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String login() {
		return "warehouse/index";
	}
	
	@RequestMapping(value = "/detailView+{id}", method = RequestMethod.GET)
	public String detailView(@PathVariable("id") Integer id, HttpSession session) {
		Warehouse warehouse = warehouseService.selectByPrimaryKey(id);
		session.setAttribute("warehouse", warehouse);
		String url=warehouse.getFrontPage1();
		String[] string=url.split(",");
		List<String> a=new ArrayList<String>();
		for (String string2 : string) {
			if(""!=string2)
				a.add(string2);
		}
		session.setAttribute("url", url);
		return "wechat/detailView";
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
	
	//添加
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public Message update(Warehouse warehouse)
	{
		//Warehouse warehouse=new Warehouse();
		warehouseService.updateByPrimaryKeySelective(warehouse);
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
	
	@ResponseBody
	@RequestMapping(value = "/imageUpload")
	public Map<String, Object> imageUpload(@RequestParam("upload")MultipartFile file, HttpServletRequest request)
	{
		Map<String, Object> result = new HashMap<String, Object>();
		String s = UUID.randomUUID().toString();
		if(qiniuService.upload(file, s))
		{
			result.put("uploaded", 1);
			result.put("fileName", file.getName());
			result.put("url", "http://ozsr8m125.bkt.clouddn.com/"+s);
		}
		else
		{
			result.put("uploaded", 0);
			result.put("fileName", s.toString());
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/imageUpload1")
	public Map<String, Object> imageUpload1(@RequestParam("upload1")MultipartFile file, HttpServletRequest request)
	{
		Map<String, Object> result = new HashMap<String, Object>();
		String s = UUID.randomUUID().toString();
		if(qiniuService.upload(file, s))
		{
			result.put("uploaded", 1);
			result.put("fileName", file.getName());
			result.put("url", "http://ozsr8m125.bkt.clouddn.com/"+s);
		}
		else
		{
			result.put("uploaded", 0);
			result.put("fileName", s);
		}
		return result;
	}
	
	/**
	 * 获得列表数据
	 * 
	 * @param model
	 * @return 
	 */
	@ResponseBody
	@RequestMapping(value = "/selectList")
	public List<Warehouse> selectList(BaseCondition condition) {
		return warehouseService.select(new Warehouse());
	}
	
	/**
	 * shanchu
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	public Message del(Integer id)
	{
		//Warehouse warehouse=new Warehouse();
	int a	=warehouseService.deleteByPrimaryKey(id);
		if (a != 0) {
			return successMessage();
		} else {
			return failMessage("删除失败");
		} 
	}
	
	
	
	
}
