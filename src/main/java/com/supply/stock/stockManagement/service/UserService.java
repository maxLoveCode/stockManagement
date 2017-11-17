package com.supply.stock.stockManagement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supply.stock.stockManagement.pojo.User;
import com.supply.stock.stockManagement.mapper.UserMapper;
import com.supply.stock.stockManagement.service.BaseService;

@Service
public class UserService extends BaseService<User>{
	
	@Autowired
	UserMapper userMapper;

	public User findUserByUsername(String username)
	{
		return userMapper.findUserByUsername(username);
	}
}
