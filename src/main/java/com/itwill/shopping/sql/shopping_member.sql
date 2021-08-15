--회원존재여부
select count(*) cnt from member where member_id='customer1';

--회원등록
insert values(member_id,member_name,member_password,member_address,member_birthday,member_gender,member_phone,member_email,member_join_date);

--회원정보수정
update member set member_password=?,member_email=?,member_phone=? where member_id='customer1';

--회원 한명 삭제(on delete cacscade)
delete from member where m_id='customer1';

--회원 아이디로 회원찾기 
select * from member where member_id='customer1';
