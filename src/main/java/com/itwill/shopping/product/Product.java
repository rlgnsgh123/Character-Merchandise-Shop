package com.itwill.shopping.product;

import java.util.Date;

/*
 이름        널?       유형            
--------- -------- ------------- 
P_NO      NOT NULL NUMBER(10)    
P_NAME             VARCHAR2(50)  
P_PRICE   NOT NULL NUMBER(10)    
P_DESC             VARCHAR2(256) 
P_STOCK            NUMBER(10)    
P_REGDATE          DATE          
P_IMAGE            VARCHAR2(100) 
 */
public class Product {
	private int p_no;
	private String p_name;
	private int p_price;
	private String p_desc;
	private int p_stock;
	private Date p_regdate;
	private String p_image;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int p_no, String p_name, int p_price, String p_desc, int p_stock, Date p_regdate, String p_image) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_desc = p_desc;
		this.p_stock = p_stock;
		this.p_regdate = p_regdate;
		this.p_image = p_image;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_desc() {
		return p_desc;
	}

	public void setP_desc(String p_desc) {
		this.p_desc = p_desc;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	public Date getP_regdate() {
		return p_regdate;
	}

	public void setP_regdate(Date p_regdate) {
		this.p_regdate = p_regdate;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	@Override
	public String toString() {
		return "Product [p_no=" + p_no + ", p_name=" + p_name + ", p_price=" + p_price + ", p_desc=" + p_desc
				+ ", p_stock=" + p_stock + ", p_regdate=" + p_regdate + ", p_image=" + p_image + "]";
	}
	
}
