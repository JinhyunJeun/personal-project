show tables;
create table tbl_board 
(
    id int not null primary key auto_increment,
    title varchar(45) not null,
    content text,
    reg_user varchar(45),
    reg_dt timestamp default now(),
    menu_icon varchar(45),
    tags varchar(45),
    delete_yn varchar(45)
) default charset=utf8

show tables
desc tbl_board
use pwiki
insert 
into 
tbl_board 
(
    title, content, reg_user, delete_yn
)
values 
(
    'testTitle', 'testContent', '관리자', 'N'
)
select * from tbl_board
SELECT
            id as id,
            title as title,
            content as content,
            reg_user as regUser,
            reg_dt as regDt,
            menu_icon as icon,
            tags as tags,
            delete_yn as deleteYn
        FROM
        tbl_board
        WHERE 
        delete_yn = 'N'
--190629
show databases
use pwiki
show tables
desc tbl_board
CREATE table tbl_food
(
    id int not null primary key,
    food_name varchar(20) not null,
    calorie varchar(30),
    num int default 1,
    food_weight int
) 
default charset=utf8
desc tbl_food

--190720
use pwiki
show tables
CREATE table tbl_board
(
    id int not null primary key,
    title varchar(50) not null,
    content text,
    reg_user varchar(20) not null,
    reg_dt timestamp default now(),
    upd_dt varchar(20),
    delete_yn char(1),
    property varchar(100),
    website varchar(200),
    tags varchar(100)
)
default charset=utf8
show tables
desc tbl_board
alter table tbl_board change reg_dt reg_dt varchar(20) default null
alter table tbl_board change reg_dt reg_dt timestamp default now()
show databases
use mysql
select Host, User from user
desc tbl_board
alter table tbl_board change reg_user reg_user varchar(20)
alter table tbl_board change id id int not null auto_increment
alter table tbl_board change reg_dt reg_dt varchar(30) not null
--190808
show databases
use pwiki
show tables
alter table tbl_food convert to character set utf8
select * from tbl_board
--190810
desc tbl_board
alter table tbl_board change id id int not null auto_increment
alter table tbl_board change reg_user reg_user varchar(20) default null
create table code 
    (
        id int not null primary key auto_increment,
        mode varchar(10)
    )
    default charset=utf8
desc code
insert into code (mode) values ('edit'), 
                            ('delete'),
                            ('new')
select * from code
drop table code;
create table pwiki_code
(
    code_group varchar(32) not null,
    code_id varchar(32) not null,
    code_name varchar(50),
    code_etc varchar(50),
    display_order int not null,
    reg_dt datetime,
    primary key(code_group, code_id)
)
default charset=utf8
desc pwiki_code
alter table pwiki_code change display_order display_order int not null default 0
insert into pwiki_code 
(
    code_group, code_id, code_name, code_etc
) 
values
(
    'WRITING', 'edit', '수정', '수정'
),
(
    'WRITING', 'delete', '삭제', '삭제'
),
(
    'WRITING', 'create', '생성', '생성' 
)
select * from pwiki_code