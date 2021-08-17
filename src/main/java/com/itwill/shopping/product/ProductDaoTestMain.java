package com.itwill.shopping.product;

public class ProductDaoTestMain {

	public static void main(String[] args) throws Exception{
		ProductDao productDao = new ProductDao();
		System.out.println(productDao.getProduct(4)); 
		System.out.println(productDao.getProductListAsc()); 
		System.out.println(productDao.getProductListDesc()); 
		
	}

}
