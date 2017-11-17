package com.supply.stock.stockManagement.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.supply.stock.stockManagement.config.MyMapper;
import com.supply.stock.stockManagement.pojo.User;

@Mapper
public interface UserMapper extends MyMapper<User> {
	
	public User findUserByUsername(String username);
}
