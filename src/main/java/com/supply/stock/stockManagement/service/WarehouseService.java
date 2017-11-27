package com.supply.stock.stockManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supply.stock.stockManagement.mapper.WarehouseMapper;
import com.supply.stock.stockManagement.pojo.Warehouse;

@Service
public class WarehouseService extends BaseService<Warehouse>{

	@Autowired
	WarehouseMapper warehouseMapper;
	
	public List<Warehouse> WarehouseList(Warehouse warehouse){
	return	warehouseMapper.WarehouseList(warehouse);
	}
}
