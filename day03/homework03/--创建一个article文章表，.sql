--创建一个article文章表，
drop table if exists article;
create table article (
    title varchar(20),
    create_date datetime
);
--向article中插入一条信息
insert into article (title,create_date) values (
    null,
    '2019-02-03 12:32:18'
);

--查询article文章表中，
--文章标题title为空，或者满足发表日期create_date在2019年1月1日之后
select *from article where title is null or create_date >= '2019-01-01 00:00:00';



--==================================================================================================================
--创建一个book表
drop table if exists book;
create table book (
    name varchar(20),
    author varchar(20),
    price decimal,
    publish_date datetime
);

insert into book values (
    'books',
    'zhangsan',
    34.5,
    '2000-03-03 23:23:00'
);
insert into book values (
    'Java核心技术',
    'zhangsan',
    34.5,
    '2034-07-02 22:13:00'
);

select name from book where author is not null or price < 50 and publish_date > '2019-01-01 00:00:00';

--修改“Java核心技术”的图书信息，将价格修改为61
update book set price = 61 where name  = 'Java核心技术';




