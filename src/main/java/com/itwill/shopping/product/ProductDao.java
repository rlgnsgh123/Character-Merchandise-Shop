package com.itwill.shopping.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

public class ProductDao {
	private DataSource dataSource;

	public ProductDao() throws Exception {
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/shopping/jdbc.properties"));
		// load경로잘모르겟다
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}

	public ArrayList<Product> getProductListDesc() throws Exception {
		// 전체상품이 있는 페이지볼때 비싼가격순
		ArrayList<Product> productList = new ArrayList<Product>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.PRODUCT_SELECT_DESC);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				productList.add(new Product(rs.getInt("p_no"), rs.getString("p_name"), rs.getInt("p_price"), null, 0,
						null, rs.getString("p_image")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con!=null) con.close();
		}
		return productList;
	}
	
	public ArrayList<Product> getProductListAsc() throws Exception {
		// 전체상품이 있는 페이지볼때 저렴한 가격순
		ArrayList<Product> productList = new ArrayList<Product>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.PRODUCT_SELECT_ASC);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				productList.add(new Product(rs.getInt("p_no"), rs.getString("p_name"), rs.getInt("p_price"), null, 0,
						null, rs.getString("p_image")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con!=null) con.close();
		}
		return productList;
	}

	public Product getProduct(int p_no) throws Exception {
		// 상품 하나의 상세 페이지 볼때
		Product product = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con= dataSource.getConnection();
			pstmt= con.prepareStatement(ProductSQL.PRODUCT_DETAIL);
			pstmt.setInt(1, p_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				product = new Product(rs.getInt("p_no"), 
						rs.getString("p_name"), 
						rs.getInt("p_price"),
						rs.getString("p_desc"),
						rs.getInt("p_stock"),
						null,
						rs.getString("p_image"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) con.close();
		}
		return product;
	}
	
	public int insertProduct(Product product) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.PRODUCT_INSERT);
			pstmt.setString(1, product.getP_name());
			pstmt.setInt(2, product.getP_price());
			pstmt.setString(3, product.getP_desc());
			pstmt.setInt(4, product.getP_stock());
			pstmt.setString(5, product.getP_image());
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) con.close();
		}
		return insertCount;
	}
	
	
	
	
	
	
	
	
	
	
	
}
