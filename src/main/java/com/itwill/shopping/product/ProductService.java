package com.itwill.shopping.product;

import java.util.ArrayList;


public class ProductService {
	private ProductDao productDao;
	
	public ProductService() throws Exception{
		productDao = new ProductDao();
	}
	
	// 전체상품이 있는 페이지볼때 비싼 가격순
	public ArrayList<Product> getProductListAsc() throws Exception {
		ArrayList<Product> productList = productDao.getProductListDesc();
		return productList;
	}
	
	// 전체상품이 있는 페이지볼때 저렴한 가격순
	public ArrayList<Product> getProductListDesc() throws Exception {
		ArrayList<Product> productList = productDao.getProductListAsc();
		return productList;
	}
	//제품 하나의 상세 페이지 확인시
	public Product getProduct(int p_no) throws Exception {
		Product product = productDao.getProduct(p_no);
		return product;
	}
	
	//제품넣기
	public int insertProduct(Product product) throws Exception{
		int insertCount = productDao.insertProduct(product);
		return insertCount;
	}
	
	//총 제품의 갯수
	public int getProductCount() throws Exception{
		int productCount = productDao.getProductCount();
		return productCount;
	}
}
