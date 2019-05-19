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