package com.itwill.shopping.product;

public class ProductSQL {
	public final static String PRODUCT_DETAIL =
			"select * from product where p_no =?";
	public final static String PRODUCT_SELECT_ASC =
			"select * from product order by p_price asc";
	public final static String PRODUCT_SELECT_DESC =
			"select * from product order by p_price desc";
	
}
