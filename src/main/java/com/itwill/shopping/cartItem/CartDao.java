/*
<< 참고 링크 >>
- https://github.com/2021-05-JAVA-DEVELOPER/eclipse-workspace-ee/blob/master/projectShop/src/main/webapp/ERD/shop_select_update_delete.sql
- https://github.com/2021-05-JAVA-DEVELOPER/eclipse-workspace-ee/blob/master/projectShop/src/main/java/com/itwill/shop/cart/CartDao.java

* 생각하기
- Select By Member - 왜 new Member, Product 생성할까
- Update - 왜 c_item_no는 순차부여인데 m_id별 분류를 하지 않는가 (이건 출력할 때만 별개로 사용돼도 되는건지)
*/

package com.itwill.shopping.cartItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shopping.member.Member;
import com.itwill.shopping.product.Product;

public class CartDao {
	private DataSource dataSource;
	
	// DAO 객체 생성
	public CartDao() throws Exception{
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/shopping/jdbc.properties"));
		
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
		
	}
	
	
	// INSERT :: 장바구니에 상품 추가하기.
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
	
	// UPDATE :; 장바구니 상품 수정.
	public int updateCart(String m_id, int p_no, int p_cart_qty) throws Exception{
		String updateSQL = "update cart set c_item_qty = ? where m_id = ? and p_no = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(updateSQL);
			pstmt.setInt(1, p_cart_qty);
			pstmt.setString(2, m_id);
			pstmt.setInt(3, p_no);
			count = pstmt.executeUpdate();
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return count;
	}
	
	
	// DELETE :: 장바구니 상품 선택 삭제 /**/.
	public int deleteCart(int c_item_no) throws Exception{
		String deleteSQL = "delete from cart where c_item_no = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(deleteSQL);
			pstmt.setInt(1, c_item_no);
			count = pstmt.executeUpdate();
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return count;
	}
	
	/*
	// !!! DELETE TEST !!! (수정중)
	public int deleteCartTest(String m_id, int c_item_no) throws Exception {
		String deleteSQL = "delete from cart where m_id = ? and c_item_no = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0 ;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(deleteSQL);
			pstmt.setString(1, m_id);
			pstmt.setInt(2, c_item_no);
			count = pstmt.executeUpdate();
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return count;
	}
	*/
	
	
	// DELETE ALL :: 장바구니 상품 전체 삭제.
	public int deleteCartAll(String m_id) throws Exception {
		String deleteAllSQL = "delete from cart where m_id = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(deleteAllSQL);
			pstmt.setString(1, m_id);
			count = pstmt.executeUpdate();
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return count;
	}
	
	// SELECT BY MEMBER :: 장바구니 상품 (m_id 기준) 출력.
	public ArrayList<CartItem> selectCart(String m_id) throws Exception {
		ArrayList<CartItem> cartList = new ArrayList<CartItem>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectSQL = "select * from cart c join member m on c.m_id = m.m_id join product p on p.p_no = c.p_no where m.m_id = ?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(selectSQL);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cartList.add(
						new CartItem(rs.getInt("c_item_no"),
											rs.getInt("c_item_qty"), 
											new Member(), // 이거 왜지! 
											new Product( 
													rs.getInt("p_no"), 
													rs.getString("p_name"), 
													rs.getInt("p_price"), 
													rs.getString("p_desc"), 
													rs.getInt("p_stock"), 
													rs.getDate("p_regdate"), 
													rs.getString("p_image")
												)
											)
						);
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return cartList;
	}
	
	
	// SelectByProduct :: 장바구니 상품 (상품 기준) 출력 -- 관리자 메뉴?.
	public CartItem selectCartItemByNo(int c_item_no) throws Exception {
		CartItem cartItem = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectSQL = "select * from cart c join product p on c.p_no = p.p_no where c.c_item_no = ?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(selectSQL);
			pstmt.setInt(1, c_item_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cartItem = new CartItem(
												rs.getInt(c_item_no),
												rs.getInt("c_item_qty"),
												new Member(),
												new Product(
															rs.getInt("p_no"),
															rs.getString("p_name"),
															rs.getInt("p_price"),
															rs.getString("p_desc"),
															rs.getInt("p_stock"),
															rs.getDate("p_regdate"),
															rs.getString("p_image"))
												);
			} // try - if end
		} finally {
			if (con != null) {
				con.close();
			} // finally - if end
		} // finally end
		
		return cartItem;
	}
	
	// 상품 존재 여부!.
	public boolean cartExist(String m_id, int p_no) throws Exception {
		boolean isExist = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String selectSQL = "select count(*) as p_count from cart c join member m on c.m_id = m.m_id where m.m_id = ? and c.p_no = ?";
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(selectSQL);
			pstmt.setString(1, m_id);
			pstmt.setInt(2, p_no);
			rs = pstmt.executeQuery();
			int count = 0;
			
			if(rs.next()) {
				count = rs.getInt(1);
			} // 헷갈림..
			
			if (count == 0) {
				isExist = false;
			} else {
				isExist = true;
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return isExist;
	}
	
	
	// Select existingQty :: Test
	// m_id가 담은 p_no의 수량을 반환하는 메소드~
	public int getExistingQty(String m_id, int p_no) throws Exception {
		String selectSQL = "select * from cart where p_no = ? and m_id = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int existingQty = 0;
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(selectSQL);
			pstmt.setInt(1, p_no);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				existingQty += rs.getInt("c_item_no");
			}
			
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return existingQty;
	}
	
	
	
}
