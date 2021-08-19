package com.itwill.shopping.cartItem;

import java.util.ArrayList;

public class CartService {
	
	private CartDao cartDao;
	
	// 생성자..
	public CartService() throws Exception{
		this.cartDao = new CartDao();
	}
	
	
	// addCart
	public int addCart(String m_id, int p_no, int c_item_qty) throws Exception {
		if(cartDao.cartExist(m_id, p_no)) {
			return cartDao.updateCart(m_id, p_no, c_item_qty);
		} else {
			return cartDao.addCart(m_id, p_no, c_item_qty);
		}
	}
	
	
	// updateCart
	public int updateCart(String m_id, int p_no, int c_item_qty) throws Exception {
		return cartDao.addCart(m_id, p_no, c_item_qty);
	}
	
	
	// Select (m_id)
	public ArrayList<CartItem> getCartList(String m_id) throws Exception {
		return cartDao.selectCart(m_id);
	}
	
	
	// Select (p_no)
	/*
	public CartItem getCartListItem(int c_item_no) throws Exception {
		return cartDao.sele
	}
	*/
	
	// Delete (c_item_no)
	public int deleteCartItem (int c_item_no) throws Exception {
		return cartDao.deleteCart(c_item_no);
	}
	
	// Delete All 
	public int deleteCartAll (String m_id) throws Exception {
		return cartDao.deleteCartAll(m_id);
	}
	
}
