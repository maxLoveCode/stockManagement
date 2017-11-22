package com.supply.stock.stockManagement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.supply.stock.stockManagement.pojo.Order;
import com.supply.stock.stockManagement.mapper.OrderMapper;

import java.util.List;
@Service
public class OrderService extends BaseService<Order>{
	
	@Autowired
	OrderMapper orderMapper;
	
	public List<Order> selectList(){
		return orderMapper.selectList();
	}
	
}
