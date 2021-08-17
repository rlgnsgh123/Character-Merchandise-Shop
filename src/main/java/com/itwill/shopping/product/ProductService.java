package com.itwill.shopping.product;

import java.util.ArrayList;


public class ProductService {
	private ProductDao productDao;
	
	public ProductService() throws Exception{
		productDao = new ProductDao();
	}
	
	public ArrayList<Product> getProductListAsc() throws Exception {
		ArrayList<Product> productList = productDao.getProductListAsc();
		return productList;
	}
	public ArrayList<Product> getProductListDesc() throws Exception {
		ArrayList<Product> productList = productDao.getProductListAsc();
		return productList;
	}
	public Product getProduct(int p_no) throws Exception {
		Product product = productDao.getProduct(p_no);
		return product;
	}
}
