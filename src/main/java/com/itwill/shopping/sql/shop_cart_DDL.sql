-- Shopping Cart DDL SQL
-- SQL Developer는 쓸 때마다 뻗는다.. 오늘 새벽에만 다섯 번이 뻗었다..

-- << insert >>
-- insert into cart(c_item_no, c_item_qty, m_id, p_no) values(CART_C_ITEM_NO_SEQ.nextval, ?, '?', ?) ;
insert into cart(c_item_no, c_item_qty, m_id, p_no) values(CART_C_ITEM_NO_SEQ.nextval, 5, 'customer1', 1) ;

-- << update >>
-- c_item_no로 정보 수정
update cart set c_item_qty = ? where cart_no = ? ;
update cart set p_no = ?, c_item_qty = ? where cart_no = ?;

-- << delete >>
-- c_item_no로 아이템 제거
delete from cart where c_item_no = ?;
-- 장바구니 목록 전체 제거
delete from cart where m_id = '?';


-- << select >>
-- cart item 1개의 제품 정보
-- select * from cart c join product p on c.p_no = p.p_no where c.c_item_no = ?;
select * from cart c join product p on c.p_no = p.p_no where c.c_item_no = 3;
-- m_id의 장바구니 목록
-- select * from cart c join member m on c.m_id = m.m_id join product p on p.p_no = c.p_no where m.m_id = '?';
select * from cart c join member m on c.m_id = m.m_id join product p on p.p_no = c.p_no where m.m_id = 'customer1';


