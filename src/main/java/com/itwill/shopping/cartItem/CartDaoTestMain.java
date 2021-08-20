package com.itwill.shopping.cartItem;

public class CartDaoTestMain {

	public static void main(String[] args) throws Exception{
		CartDao cartDao = new CartDao();
		
		System.out.println("INSERT");
		System.out.println(cartDao.addCart("customer2", 3, 1));
		
		System.out.println("UPDATE");
		System.out.println(cartDao.updateCart("customer2", 2, 2));
		
		System.out.println("DELETE");
		System.out.println(cartDao.deleteCart(5));
		
		System.out.println("DELETE ALL");
		System.out.println(cartDao.deleteCartAll("customer3"));
		
		System.out.println("SELECT BY MEMBER");
		System.out.println(cartDao.selectCart("customer2"));
		
		System.out.println("SelectByProduct");
		System.out.println(cartDao.selectCartItemByNo(1));
		
		System.out.println("상품 존재 여부!");
		System.out.println(cartDao.cartExist("customer1", 2));

	}

}
