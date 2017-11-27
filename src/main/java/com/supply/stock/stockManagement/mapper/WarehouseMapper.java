package com.supply.stock.stockManagement.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.supply.stock.stockManagement.pojo.Warehouse;

import com.supply.stock.stockManagement.config.MyMapper;

@Mapper
public interface WarehouseMapper extends MyMapper<Warehouse>{

	
	List<Warehouse> WarehouseList(Warehouse warehouse);
}
