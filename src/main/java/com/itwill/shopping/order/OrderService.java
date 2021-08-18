package com.itwill.shopping.order;


import java.util.ArrayList;

import com.itwill.shopping.cartItem.CartDao;
import com.itwill.shopping.orderItem.OrderItem;
import com.itwill.shopping.product.Product;
import com.itwill.shopping.product.ProductDao;

public class OrderService {
	private OrderDao orderDao;
	private ProductDao productDao;
	private CartDao cartDao;
	
	//주문 1개삭제
	public int delete(int o_no) throws Exception{
		return orderDao.delete(o_no);
	}
	
	//멤버 한 사람의 주문내역 전체 삭제
	public int deleteOrderById(String m_id) throws Exception{
		return orderDao.deleteOrderById(m_id);
		
	}
	
	//멤버 한 사람의 주문전체목록
	
	public ArrayList<Order> list(String m_id) throws Exception{
		return orderDao.list(m_id);
	}
	
	
	//멤버 한 사람의 주문 1개 보기
	public Order order1(int o_no) throws Exception{
		return orderDao.order1(o_no);
	}
	
	
	//주문 한 개의 주문상세,제품정보 여러 개(주문상세,제품)
	public Order detail(String m_id,int o_no) throws Exception{
		return orderDao.detail(m_id, o_no);
	}
	

	//상품에서 주문
	
	
	//카트에서 주문
	
	
	//카트에서 선택 주문
	
	
	
	
}