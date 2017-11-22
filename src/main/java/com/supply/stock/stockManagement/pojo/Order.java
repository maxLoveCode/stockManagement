package com.supply.stock.stockManagement.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="stock_order")
public class Order{
	
	@Id
	private Integer id;
	@Column(name = "createtime")
	private Date createtime;
	@Column(name = "visitName")
	private String visitName;
	@Column(name="name")
	private String name;
	@Column(name = "phone")
	private String phone;
	
	@Column(name="company")
	private String company;
	
	@Column(name="wareHouse_id")
	private Integer wareHouseid;
	
	@Column(name="visitTime")
	private Date visitTime;

	public String getVisitName() {
		return visitName;
	}

	public void setVisitName(String visitName) {
		this.visitName = visitName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Integer getWareHouseid() {
		return wareHouseid;
	}

	public void setWareHouseid(Integer wareHouseid) {
		this.wareHouseid = wareHouseid;
	}

	public Date getVisitTime() {
		return visitTime;
	}

	public void setVisitTime(Date visitTime) {
		this.visitTime = visitTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	 
}
