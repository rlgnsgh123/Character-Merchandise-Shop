/****************Member Select***********************/

-- 회원정보 리스트 보기
select * from member m join member_detail md on m.m_id=md.m_id;
-- 회원 아이디로 회원 찾기
select * from member where m_id = 'customer1';
-- 회원 존재여부 체크(회원가입시)
select count(*) cnt from member where m_id= 'customer1';


/****************Product Select***********************/

-- 제품 리스트 보기
select * from product;
-- 제품 이름으로 제품 찾기
select * from product where p_name='펭슈';
/****************Bulletin Select***********************/
-- 공지사항 게시글 전체 보기
select * from bulletin_board;


/****************QNA Board Select***********************/

-- 고객센터 게시글 전체 보기
select * from qna_board;
-- 고객센터 작성자 이름이로 찾기
select * from qna_board where m_id = 'customer1';
/****************Cart Select***********************/
-- 로그인한 멤버의 카트리스트 전체보기
select * from cart c join member m 
                    on c.m_id=m.m_id
                    join product p
                    on c.p_no=p.p_no
                    where m.m_id='customer1';
-- 카트내 담은 제품 1개 정보 보기
select * from cart c join product p on c.p_no =p.p_no where c_item_no=1;


/****************Orders Select***********************/

-- 회원들 주문 전체리스트 보기(관리자용)(ORDERS TABLE)
select * from orders;

-- 로그인한 멤버의 주문 통합보기(ORDERS TABLE)
select * from orders where m_id = 'customer2';
-- 주문 번호 별 주문 상세사항 리스트 보기(ORDER_ITEM TABLE)
select * from order_item where o_no=2;
-- 로그인한 멤버의 주문한제품(oreder_item) 중 1개 제품(product)의 상세정보 보기
select * from orders o join order_item oi 
                       on o.o_no=oi.o_no
                       join product p
                       on oi.p_no = p.p_no
                       where o.m_id = 'customer2';


select o.o_no,o.m_id,p.p_name,oi.oi_amount,p.p_price,p.p_image,o.o_price 
                                                                   from orders o join order_item oi 
                                                                   on o.o_no=oi.o_no
                                                                   join product p
                                                                   on oi.p_no = p.p_no
                                                                   where o.m_id = 'customer2';