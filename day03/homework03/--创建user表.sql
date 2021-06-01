--创建user表
drop table if exists user;
create table  user(
    id int(10),
    accout varchar(20),
    amount decimal
);

--插入数据
insert into user values(123,'jksaj',2423.5),(533,'sadsa',12.4),(322,'as',6344);


--查询用户user表中，满足以下条件的用户数据：
--1. ID在1至200或300至500，且账号accout列不为空
--2. 充值金额amount在1000以上。
select *from user where id between 1 and 200 or id between 300 and 500 and accout is not null;

select *from user where amount>1000;

--删除商品表中，价格大于60，或者是库存小于200的记录
delete from goods02 where goods_price > 60 or goods_inventory < 200;

--修改所有库存大于30的商品记录，将价格增加50块
update goods02 set goods_price = goods_price + 50 where goods_inventory > 30;





















