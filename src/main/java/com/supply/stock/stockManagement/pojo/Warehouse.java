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
	

	@Column(name = "address")
	private String address;
	
	@Column(name = "contact")
	private String contact;
	
	@Column(name = "article")
	private String article;
	
	@Column(name = "frontPage")
	private String frontPage;
	@Column(name = "frontPage1")
	private String frontPage1;
	@Column(name = "frontPage2")
	private String frontPage2;
	
	@Column(name = "area")
	private Integer area;

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

	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getFrontPage() {
		return frontPage;
	}

	public void setFrontPage(String frontPage) {
		this.frontPage = frontPage;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getArea() {
		return area;
	}

	public void setArea(Integer area) {
		this.area = area;
	}

	public String getFrontPage1() {
		return frontPage1;
	}

	public void setFrontPage1(String frontPage1) {
		this.frontPage1 = frontPage1;
	}

	public String getFrontPage2() {
		return frontPage2;
	}

	public void setFrontPage2(String frontPage2) {
		this.frontPage2 = frontPage2;
	}
	
}
