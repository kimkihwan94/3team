SHOW VARIABLES LIKE 'autocommit';
SET autocommit = ON;

select * from member;

use login;

create table member(
	user_num INT PRIMARY KEY AUTO_INCREMENT,			-- 회원 번호
	id varchar(300) not null unique,					-- 회원 아이디
	pass varchar(300) not null,							-- 비밀번호
	name varchar(50) not null,							-- 이름
	nickName varchar(50) not null						-- 닉네임
);

