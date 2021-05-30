--创建学生表
drop table if exists student;
create table student(
    id int,
    name varchar(20),
    qq varchar(20)
);

--插入数据（Insert）
--插入时，必须保证values中括号的值得顺序必须和列的顺序相匹配。
--insert 操作是实实在在的写到了磁盘上，（持久化存储），
insert into student values (
    1,
    'pryor',
    11111
);
--全列插入：将一条记录的所有属性都
insert into student values (
    2,
    'qizhou',
    22222
);
--指定列插入：在表名后values前指出要插哪列，指定列插入时也要保证values和前面的匹配.
insert into student (id,name,qq) values(
    3,'张三',33333
);
--多行插入:一次插入多条记录。（也可以和指定列插入进行配合）
insert into student values 
(4,'王五',44444),
(5,'aaaa',55555),
(6,"bbbb",66666);


--查询表数据（Retrieve）
--全列查询：查询所有的数据
select *from student;    -- *是一个通配符，表示要查看所有的列
--指定列查询
select id,name from student;
--查询字段为表达式
select id,name,qq + 10 from student;
--去重 ：distinct。关键字可以对某列数据进行去重
select distinct qq from student;





