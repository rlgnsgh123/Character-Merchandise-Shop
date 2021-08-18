package com.itwill.shopping.product;

public class ProductSQL {
	public final static String PRODUCT_DETAIL =
			"select p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image from product where p_no =?";
	public final static String PRODUCT_SELECT_ASC =
			"select p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image from product order by p_price asc";
	public final static String PRODUCT_SELECT_DESC =
			"select p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image from product order by p_price desc";
	public final static String PRODUCT_INSERT = 
			"insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,?,?,?,?,sysdate,?)";
	public final static String PRODUCT_COUNT = 
			"select count(*) count from product";
	
}
