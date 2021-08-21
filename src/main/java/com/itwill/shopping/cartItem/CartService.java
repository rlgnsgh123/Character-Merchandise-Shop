package com.itwill.shopping.cartItem;

import java.util.ArrayList;

public class CartService {
	
	private CartDao cartDao;
	
	// 생성자..
	public CartService() throws Exception{
		this.cartDao = new CartDao();
	}
	
	
	// addCart :: 장바구니에 상품 추가! (멤버 아이디, 상품 번호, 장바구니 번호 필요)
	public int addCart(String m_id, int p_no, int c_item_qty) throws Exception {
		if(cartDao.cartExist(m_id, p_no)) {
			return cartDao.updateCart(m_id, p_no, c_item_qty);
		} else {
			return cartDao.addCart(m_id, p_no, c_item_qty);
		}
	}
	
	
	// updateCart :: 장바구니 수정 (멤버 아이디, 변경할 상품 번호, 상품 수량 필요)
	// (상품 수량만 변경하는 메소드 추가 예정)
	public int updateCart(String m_id, int p_no, int c_item_qty) throws Exception {
		return cartDao.addCart(m_id, p_no, c_item_qty);
	}
	
	
	// Select (m_id) :: 장바구니 목록 출력 메소드
	// 멤버 아이디가 갖고 있는 장바구니 아이템 목록을 가져옴
	public ArrayList<CartItem> getCartList(String m_id) throws Exception {
		return cartDao.selectCart(m_id);
	}
	
	
	// Select (p_no) :: 장바구니 목록 출력 메소드 ★★★★★
	// 상품 번호!!! 별 분류인데, 일반 소비자 입장에서는 위 select m_id만 사용될 것 같고 해당 메소드는 admin 전용 메소드 같아 추가 보류 중입니다.
	// SQL에서 실행시, 1번 상품을 추가한 사람, 개수 등등을 볼 수 있는 메소드예요 :3
	/*
	public CartItem getCartListItem(int c_item_no) throws Exception {
		return cartDao.sele
	}
	*/
	
	// Delete (c_item_no) :: 상품 번호를 기준으로 장바구니에서 상품을 삭제하는 메소드
	// sM_id로 로그인 체크가 기존에 들어가서 m_id에 맞는 c_item_no의 상품이 장바구니에서 삭제됩니당~
	public int deleteCartItem (int c_item_no) throws Exception {
		return cartDao.deleteCart(c_item_no);
	}
	
	// Delete All :: 장바구니 비우기~
	// m_id의 장바구니 목록이 모두 삭제됩니다
	public int deleteCartAll (String m_id) throws Exception {
		return cartDao.deleteCartAll(m_id);
	}
	
}
