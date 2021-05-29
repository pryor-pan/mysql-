--在图书表中新增一条记录：
--Java核心技术、作者“Cay S. Horstman”，价格56.43，分类为“计算机技术”
insert into books (name,author,price,type) values(
    'Java核心技术',
    'Cay S. Horstman',
    56.43,
    '计算机技术'
);

--在以上创建的商品表中插入一条数据：
--名称为“学生书包”、价格18.91、库存101、描述为空
insert into goods02 (goods_name,goods_price,goods_inventory) values(
    '学生书包',
    18.91,
    101
);

--student学生表中，
--字段有姓名name，年龄age，要求查询姓张，并且年龄在18到25岁之间的学生
select name, age from student where age between 18 and 25;

--查询article文章表中，
--发表日期create_date在2019年1月1日上午10点30分至2019年11月10日下午4点2分的文章
select article from articles where create_date between 2019-01-01 10:30:00 and 2019-11-10 16:02:00;











