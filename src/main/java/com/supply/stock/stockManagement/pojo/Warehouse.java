package com.supply.stock.stockManagement.pojo;

import javax.persistence.Column;
import javax.persistence.Table;


@Table(name = "stock_warehouse")
public class Warehouse extends Base{
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "province")
	private String province;
	
	@Column(name = "district")
	private String district;
	
	@Column(name = "city")
	private String city;
	
	@Column(name = "contact")
	private String contact;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProvince() {
		return province;
	}

	public void setArea(String province) {
		this.province = province;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
}
