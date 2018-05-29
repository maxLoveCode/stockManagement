package com.supply.stock.stockManagement.pojo;

import javax.persistence.Column;
import javax.persistence.Id;

public class Picture {
	
	@Id
	private Integer id;
	@Column(name = "warehouseid")
	private Integer warehouseid;
	@Column(name = "picurl")
	private String picurl;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getWarehouseid() {
		return warehouseid;
	}
	public void setWarehouseid(Integer warehouseid) {
		this.warehouseid = warehouseid;
	}
	public String getPicurl() {
		return picurl;
	}
	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}
	

}
