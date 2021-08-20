package com.itwill.shopping.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shopping.order.Order;
import com.itwill.shopping.orderItem.OrderItem;
import com.itwill.shopping.member.Member;
import com.itwill.shopping.member.MemberDao;
import com.itwill.shopping.product.Product;

public class OrderDao {
	private DataSource dataSource;
	
	public OrderDao() throws Exception{
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/shopping/jdbc.properties"));
		BasicDataSource basicDataSource=new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		this.dataSource=basicDataSource;
	}
	
	//1. 주문 생성
	/*
	 * insert into orders(o_no,o_date,o_desc,o_price,m_id) values(orders_o_no_seq.nextval,sysdate,'펭슈','30000','customer1');
       insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,1,1,ORDERS_O_NO_SEQ.currval);
	 */
	public int create(Order order) throws Exception {
		Connection con=null;
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		int insertRowCount=0;
		String insertOrder=
				"insert into orders(o_no,o_date,o_desc,o_price,m_id) values(orders_o_no_seq.nextval,sysdate,?,?,?)";
		String insertOrderItem=
				"insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,?,?,ORDERS_O_NO_SEQ.currval)";		
		try {
			con=dataSource.getConnection();
			pstmt1=con.prepareStatement(insertOrder);
			pstmt1.setString(1, order.getO_desc());
			pstmt1.setInt(2, order.getO_price());
			pstmt1.setString(3, order.getM_id());
			insertRowCount=pstmt1.executeUpdate();
			
			pstmt2=con.prepareStatement(insertOrderItem);
			for(OrderItem orderItem:order.getOrderItemList()) {
				pstmt2.setInt(1, orderItem.getOi_amount());
				pstmt2.setInt(2, orderItem.getProduct().getP_no());
				pstmt2.executeUpdate();				
			}
			con.commit();			
		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();
		} finally {
			if(pstmt2!=null)
				pstmt2.close();
			if(pstmt1!=null)
				pstmt1.close();
			if(con!=null)
				con.close();
		}	
		return insertRowCount;		
	}
	
	
	//2. 멤버 한 사람의 주문전체목록
	
	public ArrayList<Order> list(String m_id) throws Exception{
		ArrayList<Order> orderList = new ArrayList<Order>(); 
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String selectQuery = "select * from orders where m_id=?";
		
		try {
			con=dataSource.getConnection(); 
			pstmt= con.prepareStatement(selectQuery); 
			pstmt.setString(1, m_id);
			rs=pstmt.executeQuery();
			while(rs.next()) { //주문이 있다면 주문리스트객체에 정보 추가
				orderList.add(new Order(rs.getInt("o_no"),
										rs.getDate("o_date"),
										rs.getString("o_desc"),
										rs.getInt("o_price"),
										rs.getString("m_id"),
										null));
			}
			
			
		} finally {
			if(con!=null) {
				con.close();
			}
		}
	
		return orderList;
	}
	
	
	
	//3. 멤버 한 사람의 주문 1개
	//select * from orders where o_no= 1;
	
	public Order order1(int o_no) throws Exception{
		Order order = null;
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String selectQuery = "select * from orders where o_no=?";
		
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setInt(1, o_no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				order = new Order(rs.getInt("o_no"),
									rs.getDate("o_date"),
									rs.getString("o_desc"),
									rs.getInt("o_price"),
									rs.getString("m_id"),
									null);
			}
			
			
		} finally {
			if(con!=null) {
				con.close();
			}
		}
		
		return order;
	}
	
	
	//4. 주문 한 개의 주문상세,제품정보 여러 개(주문상세,제품)
	/*
	 * select * from orders o join order_item oi on o.o_no=oi.o_no  join  product p on oi.p_no=p.p_no 
		where o.m_id='customer1' and o.o_no = 1;
	 */

	public Order detail(String m_id,int o_no) throws Exception{
		
		Order order = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select * from orders o join order_item oi on o.o_no=oi.o_no  join  product p on oi.p_no=p.p_no where o.m_id=? and o.o_no = ?";
	
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(selectQuery);
			pstmt.setString(1,m_id);
			pstmt.setInt(2,o_no);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				order = new Order(rs.getInt("o_no"),
								rs.getDate("o_date"),
								rs.getString("o_desc"),
								rs.getInt("o_price"),
								rs.getString("m_id"));
				do {
					order.getOrderItemList().add(new OrderItem(rs.getInt("oi_no"),
																rs.getInt("oi_amount"),
																rs.getInt("o_no"),
																new Product(rs.getInt("p_no"),
																		rs.getString("p_name"),
																		rs.getInt("p_price"),
																		rs.getString("p_desc"),
																		rs.getInt("p_stock"),
																		rs.getDate("p_regdate"),
																		rs.getString("p_image"))));
																
				}while(rs.next());
			}
			
			
			return order;
		}
		
	
	
	//5. 주문 한 개 삭제(주문 아이템 1개 삭제, 주문 삭제)
	/*	delete from order_item where o_no=1;
		delete from orders where o_no=1;
	*/
	
	public int delete(int j_no)throws Exception{
		String deleteSql="delete from orders where o_no=?";
		Connection con=null;
		PreparedStatement pstmt=null;
		int deleteRowCount = 0;
		try {
			con=dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(deleteSql);
			pstmt.setInt(1, j_no);
			deleteRowCount = pstmt.executeUpdate();
			con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
			throw e;
		}finally {
			if(con!=null)con.close();
		}
		return deleteRowCount;
	}
	
	
	//6. 멤버 한 사람의 주문내역 전체 삭제
	/*
	 * select * from orders where m_id='customer4';
	delete from order_item where o_no
	in(select o_no from orders where m_id='customer4');
	delete from orders where m_id='customer4';
	 */
	public int deleteOrderById(String m_id) throws Exception {
		//String deleteSql1="delete from order_item where o_no in(select o_no from orders where m_id=?)";
		String deleteSql="delete from orders where m_id=?";
		Connection con = null;
		//PreparedStatement pstmt1 = null;
		PreparedStatement pstmt = null;
		int deleteRowCount = 0;
		try {
			con=dataSource.getConnection();
			con.setAutoCommit(false);
			//pstmt1=con.prepareStatement(deleteSql);
			pstmt=con.prepareStatement(deleteSql);
			//pstmt1.setString(1, m_id);
			pstmt.setString(1, m_id);
			//int deleteRowCount1 = pstmt1.executeUpdate();
			deleteRowCount = pstmt.executeUpdate();
			con.commit();
		} catch (Exception e) {
			con.rollback();
			e.printStackTrace();
			throw e;
		} finally {
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				con.close();
		}
		return deleteRowCount;		
	}
	
}