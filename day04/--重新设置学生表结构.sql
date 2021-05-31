--重新设置学生表结构
drop table if exists student;
create table student (
    id int not null,
    sn int,
    name varchar(20),
    qq_mail varchar(20)
);
--=========================================分割线================================
--约束
--null约束  创建表时，可以指定某一列不为空。
drop table if exists student;
create table student(
    id int not null,
    sn int,
    name varchar(20),
    qq_mail varchar(20)
);
--unique：唯一约束   指定sn列为唯一的，不重复的
drop table if exists student;
create table student (
    id int not null,
    sn int unique,
    name varchar(20),
    qq_mail varchar(10)
)
--default：默认值约束   指定插入数据时，name列为空，默认值unknow；
--primary key：主键约束     指定id列为主键
--对于整数类型的主键，一般可以搭配自增auto_increment来使用，在每次插入时，对应的字段不给值时，使用最大的值+1；
--foreign key：外键约束     
--check：约束（了解）

--=========================================分割线================================
--表的设计
--

--





