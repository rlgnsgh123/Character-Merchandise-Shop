/*
<< 할 일 >>
- SQL 
- "/**\/" 추가
- Select 완성
- 간지나는 CartService.java 만들기

<< 참고 링크 >>
- https://github.com/2021-05-JAVA-DEVELOPER/eclipse-workspace-ee/blob/master/projectShop/src/main/webapp/ERD/shop_select_update_delete.sql
- https://github.com/2021-05-JAVA-DEVELOPER/eclipse-workspace-ee/blob/master/projectShop/src/main/java/com/itwill/shop/cart/CartDao.java

*/

package com.itwill.shopping.cartItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class CartDao {
	
	private DataSource dataSource;
	
	// DAO 객체 생성
	public CartDao() throws Exception{
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/shopping/jdbc.properties"));
		
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("usetname"));
		basicDataSource.setPassword(properties.getProperty("password"));
		this.dataSource = basicDataSource;
		
	}
	
	// INSERT :: 장바구니에 상품 추가하기
	public int addCart(String m_id, int p_no, int p_cart_qty) throws Exception {
		// insert SQL
		String insertSQL = "insert into cart(c_item_no, c_item_qty, m_id, p_no) values(CART_C_ITEM_NO_SEQ.nextval, ?, ?, ?)";
		// Connection
		Connection con =  null;
		PreparedStatement pstmt = null;
		// insert Count
		int count = 0;
		
		try {
			// parameter insert
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setInt(1, p_cart_qty);
			pstmt.setString(2, m_id);
			pstmt.setInt(3, p_no);
			count = pstmt.executeUpdate();
		} finally {
			// connection check
			if (con != null) {
				con.close();
			}
		}
		
		return count; // success - 1 , fail - 0;
	} // add end
	
	
	// Update :; 장바구니 상품 수정
	public int updateCart(String m_id, int p_no, int p_cart_qty) throws Exception{
		String updateSQL = "/**/";
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(updateSQL);
			// updateSQL - parameter 추가하기~
			/**/
			count = pstmt.executeUpdate();
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return count;
	}
	
	// Delete :: 장바구니 상품 선택 삭제
	public int deleteCart(/**/) throws Exception{
		String deleteSQL = "/**/";
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(deleteSQL);
			/**/
			count = pstmt.executeUpdate();
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return count;
	}
	
	// DeleteCartAll :: 장바구니 상품 전체 삭제
	public int deleteCartAll(String m_id) throws Exception {
		String deleteAllSQL = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(deleteAllSQL);
			/**/
			count = pstmt.executeUpdate();
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return count;
	}
	
	// SelectByMember :: 장바구니 상품 (멤버 번호 기준) 출력
	public ArrayList<CartItem> selectCart() throws Exception {
		ArrayList<CartItem> cartList = new ArrayList();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectSQL = "";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(selectSQL);
			/**/
			rs = pstmt.executeQuery();
			while (rs.next()) {
				/**/
				// cartList.add(/*new CartItem(...)*/, );
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return cartList;
	}
	
	// SelectByProduct :: 장바구니 상품 (상품 기준) 출력 -- 관리자 메뉴 같긴 한데 일단은 만들어만 두겠습니다..
	/*
	public Product selectByProduct() throws Exception {
		Product product = new Product();
		return product;
	}
	*/
	
}
