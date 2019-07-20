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