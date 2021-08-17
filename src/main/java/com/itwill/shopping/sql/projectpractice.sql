select * from product;
select * from cart;
select * from member;
select * from order_item;
select * from orders;
select * from qna_board;
select * from notice_board;

--customer1의 카트확인 (멤버 한사람의 카트에 제품존재여부)
select count(*) from cart c join member m on c.m_id= m.m_id
where m.m_id='customer1';

--customer1의 카트리스트 보여주기
select * from cart c 
join member m on c.m_id = m.m_id 
join product p on p.p_no = c.p_no
where m.m_id = 'customer1';


--customer1의 구매내역 학인
select * from order_item oi 
join orders o on oi.o_no=o.o_no
where o.m_id = 'customer1'
order by o_date desc;

select * from member;
--customer1의 비밀번호와 이름 바꾸기
update member set m_password = '6666', m_name='kkk' where m_id ='customer1'; 

--고객센터 게시글 전체글 확인
select * from bulletin_board order by bb_date;

--고객센터 customer1이 쓴 글 확인
select * from bulletin_board where m_id = 'customer1';

--고객센터 글쓰기
insert into bulletin_board 
values(bulletin_board_bb_no_seq.nextval,'제목목','내용용',sysdate,0,'customer1');

--카트아이템 1개 제품정보(customer1꺼)
select * from cart c join product p on c.p_no =p.p_no 
where c.m_id = 'customer1';

--customer1 카트에 있는 제품 중 제품번호가 2번인 제품 수량 증가
update cart c set c.c_item_qty = c.c_item_qty+1 where c.m_id = 'customer1' and c.p_no =2;
select * from cart;

--.customer1 카트에 있는 제품 중 제품번호가 2번인 제품 수량 감소
update cart c set c.c_item_qty = c.c_item_qty-1 where c.m_id = 'customer1' and c.p_no =2;

select * from cart c join member m on c.m_id=m.m_id;
select * from cart;
--customer1의 카트 전체 삭제
delete from cart where m_id ='customer1';

--customer1의 카트 중 제품번호가 2번인 품목 삭제
delete from cart where m_id ='customer1'and p_no=2;  

--admin1의 qna게시판 보여주기
select * from qna_board q 
join member m on q.m_id=m.m_id 
where m.m_id='admin1';

rollback;

select * from product;
--35000원 이상인 제품 보여주기
select * from product where p_price >= 35000;






