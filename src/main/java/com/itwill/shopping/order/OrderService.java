package com.itwill.shopping.order;


import java.util.ArrayList;
import java.util.Iterator;

import com.itwill.shopping.cartItem.CartDao;
import com.itwill.shopping.cartItem.CartItem;
import com.itwill.shopping.orderItem.OrderItem;
import com.itwill.shopping.product.Product;
import com.itwill.shopping.product.ProductDao;

public class OrderService {
	private OrderDao orderDao;
	private ProductDao productDao;
	private CartDao cartDao;
	
	public OrderService() throws Exception{
		orderDao=new OrderDao();
		productDao=new ProductDao();
		cartDao=new CartDao();
	}
	
	
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
	public int create(String m_id, int p_no, int oi_amount) throws Exception{
		Product product = productDao.getProduct(p_no);
		OrderItem orderItem = new OrderItem(0, oi_amount, p_no, product);
		ArrayList<OrderItem> orderItemList = new ArrayList<OrderItem>();
		orderItemList.add(orderItem);
		Order newOrder = new Order(0,
									null,
									orderItemList.get(0).getProduct().getP_name(),
									orderItemList.get(0).getOi_amount()*orderItemList.get(0).getProduct().getP_price(),
									m_id,
									orderItemList);
		return orderDao.create(newOrder);
	}
	
	//카트에서 주문
	public int create(String m_id) throws Exception{
		ArrayList<CartItem> cartList = cartDao.selectCart(m_id);
		ArrayList<OrderItem> orderItemList = new ArrayList<OrderItem>();
		int o_tot_price = 0;
		for(CartItem cart: cartList) {
			OrderItem orderItem = new OrderItem(0,cart.getC_item_qty(), 0, cart.getProduct());
			orderItemList.add(orderItem);
			o_tot_price+=orderItem.getOi_amount()*orderItem.getProduct().getP_price();
		}
		
		String o_desc = orderItemList.get(0).getProduct().getP_name()+"외"+orderItemList.size()+" 건";
		Order newOrder = new Order(0, null, o_desc, o_tot_price, m_id, orderItemList);
		orderDao.create(newOrder);
		cartDao.deleteCartAll(m_id);
		return 0;
	
	}

		
	//카트에서 선택 주문
	
	/*
	public int create(String m_id, String[] cart_item_noStr_array) throws Exception{
		ArrayList<OrderItem> orderItemList = new ArrayList<OrderItem>();
		int o_tot_price=0;
		for(int i=0; i<cart_item_noStr_array.length;i++) {
			
		}
	}
	
	*/
	
}