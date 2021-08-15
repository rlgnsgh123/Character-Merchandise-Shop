---------------------주문(윤희님)-------------------------------

--1. 멤버 한 사람의 주문전체목록
select * from orders where m_id='customer4';

--2. 멤버 한 사람의 주문 1개
select * from orders where o_no= 1;

--3. 주문 한 개의  주문상세 여러 개 (주문상세)
select * from order_item where o_no = 1;

--4. 주문 한 개의 주문상세,제품정보 여러 개(주문상세,제품)
select * from orders o join order_item oi on o.o_no=oi.o_no  join  product p on oi.p_no=p.p_no 
where o.m_id='customer1' and o.o_no = 1;

--5. 주문 한 개 삭제(주문 아이템 1개 삭제, 주문 삭제)
--on delete cascade
delete from order_item where o_no=1;
delete from orders where o_no=1;
--rollback;

--6. 멤버 한 사람의 주문내역 전체 삭제
----on delete cascade
select * from orders where m_id='customer4';
delete from order_item where o_no
in(select o_no from orders where m_id='customer4');
delete from orders where m_id='customer4';

--rollback;

