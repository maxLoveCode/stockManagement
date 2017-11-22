package com.supply.stock.stockManagement.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.supply.stock.stockManagement.config.MyMapper;
import com.supply.stock.stockManagement.pojo.Order;

@Mapper
public interface OrderMapper extends MyMapper<Order> {

	List<Order> selectList();
}
