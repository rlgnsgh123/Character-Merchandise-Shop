-- Shopping Cart DDL SQL

-- << insert >>
-- insert into cart(c_item_no, c_item_qty, m_id, p_no) values(CART_C_ITEM_NO_SEQ.nextval, ?, '?', ?) ;
insert into cart(c_item_no, c_item_qty, m_id, p_no) values(CART_C_ITEM_NO_SEQ.nextval, 5, 'customer1', 1) ;

-- << update >>
-- c_item_no로 정보 수정
-- 이거 헷갈린다.. 왜 카트 번호가 담은 사람(m_id)에 관계 없이 부여될까? 사용자가 볼 때 그냥 출력하면서 번호만 새로 부여하면 되나? 흠,,
-- update cart set p_no = ?, c_item_qty = ? where c_item_no = ? ;
-- update cart set p_no = ?, c_item_qty = ? where m_id = ? ;
update cart set p_no = 3, c_item_qty = 10 where m_id = 'customer2';
update cart set p_no = 2, c_item_qty = 10 where c_item_no = 4;

-- << delete >>
-- c_item_no로 아이템 제거
-- delete from cart where c_item_no = ?;
delete from cart where c_item_no = 3;
-- 장바구니 목록 전체 제거
-- delete from cart where m_id = '?';
delete from cart where m_id = 'customer1';

-- << select >>
-- cart item 중 하나를 담은 사람들의 내역 (admin?)
-- select * from cart c join product p on c.p_no = p.p_no where c.c_item_no = ?;
select * from cart c join product p on c.p_no = p.p_no where c.c_item_no = 3;
-- m_id의 장바구니 목록
-- select * from cart c join member m on c.m_id = m.m_id join product p on p.p_no = c.p_no where m.m_id = '?';
select * from cart c join member m on c.m_id = m.m_id join product p on p.p_no = c.p_no where m.m_id = 'customer1';


-- 허리펴기 ~.~