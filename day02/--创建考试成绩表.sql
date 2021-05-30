--创建考试成绩表
drop table if exists exam_result;
create table exam_result(
    id int,
    name varchar(20),
    chinese decimal(3,1),
    math decimal(3,1),
    english decimal(3,1)
);

--插入测试数据
insert into exam_result (id,name,chinese,math,english) values
    (1,'唐三藏',67,98,56),
    (2,'孙悟空',87.5,78,77),
    (3,'猪悟能',88,98.5,90),
    (4,'曹孟德',82,84,67),
    (5,'刘玄德',55.5,85,45),
    (6,'孙权',70,73,78.5),
    (7,'宋公明',75,65,30);

--查询表数据（Retrieve）
--在selects中，服务器返回的是一张“临时表”，用完就不要了，不会再磁盘上存储.
--他只是将查询到的数据以表格的形式展示给用户而已。
--全列查询：查询所有的数据
select *from exam_result;    -- *是一个通配符，表示要查看所有的列
--指定列查询
select id,name from exam_result;
--查询字段为表达式:可以将查询的结果进行运算
select id,name,math + 10 from exam_result;
--去重 ：distinct。关键字可以对某列数据进行去重
select distinct math from exam_result; 
--别名 as :为查询结果中的列指定别名，表示返回的结果集 ,as可以省略.但不建议省略.
select id,name,chinese + math + english as 总分 from exam_result;
--排序: order by 
select name,chinese  from exam_result order by chinese;
select name,chinese  from exam_result order by chinese desc;
--多列排序：如果第一列值相同，则根据第二列进行排序。
select name,math, chinese  from exam_result order by math, chinese;
select name,math, chinese  from exam_result order by math, chinese;
--多列排序时，对于没一列都能单独指定排序方式
select name,math, chinese  from exam_result order by math desc, chinese;
--使用表达式/别名排序.
select name,chinese + math + english from exam_result 
    order by chinese + math + english desc;
select name,chinese + math + english as 总分 from exam_result
    order by 总分 desc;

--条件查询：where
--基本查询
select name, english from exam_result where english < 60;   --英语不及格的学生姓名
select name, chinese, english from exam_result where chinese > english;    --语文成绩高于英语的学生姓名
select name, chinese + math + english as 总分 from exam_result where chinese + math + english < 200;    --查询总分在200分以下的同学

--and与or:
select * from exam_result where chinese > 80 and english > 80;
select * from exam_result where chinese > 80 or english > 80;
--and和or的优先级不用背，需要用的时候加括号即可.and 的 优先级大于 or
select * from exam_result where chinese > 80 or math > 70 and english > 70;
select * from exam_result where (chinese > 80 or math > 70) and english > 70;

--范围查询： 
--between...and...
select name, chinese from exam_result where chinese between 80 and 90;
select name, chinese from exam_result where chinese >= 80 and chinese <= 90;

--in
select name , math from exam_result where math in (58,59,98,99);
select name , math from exam_result where math = 58 or math = 59 or math = 98 or math = 99;

--模糊查询：like 
--like是一种比较低效的操作，在数据量比较大的时候要慎用，搜索引擎的工作，就‘类似’于like操作，但是实际工作并不是直接使用like的因为效率太低了
--占位符：%：可以替换成任意多个字符，   _：只能替换成一个字符
select name from exam_result where name like '孙%';     --匹配到孙悟空，孙权。（找姓 孙的人）
select name from exam_result where name like '孙_';     --匹配到孙权,
select name from exam_result where name like '%孙%';    --只要包含孙字都能匹配到,不管在开头还是结尾

--null的查询：is[not] null
--null在sql中等同于false，要想正确的查找出空值记录，就要使用<=>，或者is null .
select name, chinese from exam_result where chinese <=> null;
select name, chinese from exam_result where chinese is null;
select name, chinese from exam_result where chinese is not null;

 --分页查询：limit offset代表起始位置，limit代表长度
 select id, name, math , english ,chinese from exam_result limit 3;
 select name , chinese + math + english as 总分 from exam_result order by 总分 desc limit 3;
 select id, name, math , english ,chinese from exam_result order by id limit 3 offset 0;
 select id, name, math , english ,chinese from exam_result order by id limit 3 offset 3;
 select id, name, math , english ,chinese from exam_result order by id limit 3 offset 6;

--====================================分隔线=======================================
--修改表数据:update...set...
--数据库里的数据非常多，一个不加限制的查找，可能会非常之久，甚至会导致数据库被卡死，
update exam_result set math = 80 where name = '孙悟空';
update exam_result set math = 60, chinese = 70 where name = '曹孟德';
update exam_result set math = math + 30 order by chinese + math + english limit 3;
update exam_result set chinese = chinese * 2;


--====================================分隔线=======================================
--删除表数据
delete from exam_result where name = '孙悟空';

drop table if exists for_delete;
create table for_delete(
    id int,
    name varchar(20)
);

insert into for_delete(name) values
    ('A'),
    ('B'),
    ('C');
delete from for_delete;



