package com.itwill.shopping.orderItem;

import com.itwill.shopping.orderItem.OrderItemDao;

public class OrderItemTestMain {

	public static void main(String[] args) throws Exception{
		OrderItemDao orderItemDao = new OrderItemDao();
		System.out.println("1. 주문 한 개의  주문상세 여러 개 (주문상세)");
		System.out.println(orderItemDao.oi_detail(1));
	}

}
