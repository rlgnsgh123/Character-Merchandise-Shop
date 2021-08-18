package com.itwill.shopping.orderItem;

public class OrderItemService {

	private OrderItemDao orderItemDao;
	
	private OrderItemService() throws Exception{
		orderItemDao = new OrderItemDao();
	}
	//주문 한 개의  주문상세 여러 개 (주문상세)
	public OrderItem oi_detail (int o_no) throws Exception{
		return orderItemDao.oi_detail(o_no);
	}
}
