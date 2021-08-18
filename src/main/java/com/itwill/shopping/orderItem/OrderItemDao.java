package com.itwill.shopping.orderItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shopping.member.MemberDao;
import com.itwill.shopping.order.Order;
import com.itwill.shopping.product.Product;
import com.itwill.shopping.orderItem.OrderItem;

public class OrderItemDao {
	private DataSource dataSource;
	
	public OrderItemDao() throws Exception{
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/shopping/jdbc.properties"));
		BasicDataSource basicDataSource=new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		this.dataSource=basicDataSource;
	}
	
	//1. 주문 한 개의  주문상세 여러 개 (주문상세)
	//select * from order_item where o_no = 1;
	
	public OrderItem oi_detail (int o_no) throws Exception{
		
		OrderItem orderItem = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select * from order_item where o_no = ?";
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setInt(1,o_no);
			rs=pstmt.executeQuery();
			
		
			while(rs.next()){
				orderItem = new OrderItem(rs.getInt("oi_no"),
									rs.getInt("oi_amount"),
									rs.getInt("p_no"),
									rs.getInt("o_no"));	
		}
		
		
	}finally {
		if(con!=null) {
			con.close();
		}
		
	}
	
	return orderItem;
	}
	
	
	
	
	
	
}