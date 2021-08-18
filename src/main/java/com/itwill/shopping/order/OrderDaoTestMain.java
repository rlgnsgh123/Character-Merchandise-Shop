package com.itwill.shopping.order;

public class OrderDaoTestMain {

	public static void main(String[] args) throws Exception {
		OrderDao orderDao = new OrderDao();
		//System.out.println("1. 주문 생성");
		//System.out.println(orderDao.create(null));
		//System.out.println("2. 멤버 한 사람의 주문전체목록");
		//System.out.println(orderDao.list("customer3"));
		//System.out.println("3. 멤버 한 사람의 주문 1개");
		//System.out.println(orderDao.order1(1));
		System.out.println("4. 주문 한 개의 주문상세,제품정보 여러 개(주문상세,제품)");
		System.out.println(orderDao.detail("customer1",1));
		//System.out.println("5. 주문 한 개 삭제(주문 아이템 1개 삭제, 주문 삭제)");
		//System.out.println(orderDao.delete(1));
		//System.out.println("6. 멤버 한 사람의 주문내역 전체 삭제");
		//System.out.println(orderDao.deleteOrderById("customer2"));
	
	}

}
