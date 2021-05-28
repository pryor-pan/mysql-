--设计一张图书表，
--包含以下字段：图书名称，图书作者、图书价格、图书分类
create table books (
    name varchar(20),
    author varchar(20),
    price decimal,
    type varchar(20)
);
--设计一张老师表，
--包含以下字段：姓名、年龄、身高、体重、性别、学历、生日、身份证号
drop table if exists teacher;
create table teacher(
    name varchar(20),
    age smallint,
    tall decimal(4,1),
    weight float,
    sex varchar(10),
    education varchar(20),
    brithday date,
    card_id varchar(18)
);

--设计一张商品表，
--包含以下字段：商品名称、商品价格、商品库存、商品描述
create table if not exists goods02(
    goods_name varchar(20),
    goods_price decimal,
    goods_inventory int,
    goods_describe varchar(50)
);