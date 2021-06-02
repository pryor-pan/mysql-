--4查询
--=========================================分割线================================
--4.1聚合查询
--count
select count(*) from student;       --统计班级共有多少同学
select count(0) from student;

select count(qq_mail) from student;     --统计班级收集的 qq_mail 有多少个，qq_mail 为 NULL 的数据不会计入结果
--sum:求和是求行和行之间,求和的对象必须是数字，如果是非数组就会出问题
select sum(math) from exam_result;      --统计数学成绩总分
select sum(math) from exam_result where math < 60;  --不及格<60的总分，没有结果，返回null；
--avg
select avg(chinese + math + english) as 平均总分 from exam_result;  --统计平均分
--max
select max(english) from exam_result;   --返回英语最高分
--min
select min(math) from exam_result where math > 70;       --返回>70，以上的数学最低分

--4.1.1group by字句:
--准备测试表
drop table if exists emp;
create table emp(
    id int primary key auto_increment,
    name varchar(20) not null,  
    role varchar(20) not null,
    salary numeric(11,2)
);
insert into emp(name, role, salary) values
('马云','服务员', 1000.20),
('马化腾','游戏陪玩', 2000.99),
('孙悟空','游戏角色', 999.11),
('猪无能','游戏角色', 333.5),
('沙和尚','游戏角色', 700.33),
('隔壁老王','董事长', 12000.66);
--查询每个角色的最高工资、最低工资和平均工资
select role,max(salary),min(salary),avg(salary) from emp group by role;
--4.1.2having
--GROUP BY 子句进行分组以后，需要对分组结果再进行条件过滤时，不能使用 WHERE 语句，而需要用HAVING
--显示平均工资低于1500的角色和它的平均工资
select role,max(salary),min(salary),avg(salary) from emp group by role having avg(salary)<1500;


--4.2联合查询
--实际开发中往往数据来自不同的表，所以需要多表联合查询。多表查询是对多张表的数据取笛卡尔积：
drop table if exists classes;
drop table if exists student;
drop table if exists course;
drop table if exists score;

create table classes (id int primary key auto_increment, name varchar(20), `desc` varchar(100));

create table student (id int primary key auto_increment, sn varchar(20),  name varchar(20), qq_mail varchar(20) ,
        classes_id int);

create table course(id int primary key auto_increment, name varchar(20));

create table score(score decimal(3, 1), student_id int, course_id int);

insert into classes(name, `desc`) values 
('计算机系2019级1班', '学习了计算机原理、C和Java语言、数据结构和算法'),
('中文系2019级3班','学习了中国传统文学'),
('自动化2019级5班','学习了机械自动化');

insert into student(sn, name, qq_mail, classes_id) values
('09982','黑旋风李逵','xuanfeng@qq.com',1),
('00835','菩提老祖',null,1),
('00391','白素贞',null,1),
('00031','许仙','xuxian@qq.com',1),
('00054','不想毕业',null,1),
('51234','好好说话','say@qq.com',2),
('83223','tellme',null,2),
('09527','老外学中文','foreigner@qq.com',2);

insert into course(name) values
('Java'),('中国传统文化'),('计算机原理'),('语文'),('高阶数学'),('英文');

insert into score(score, student_id, course_id) values
-- 黑旋风李逵
(70.5, 1, 1),(98.5, 1, 3),(33, 1, 5),(98, 1, 6),
-- 菩提老祖
(60, 2, 1),(59.5, 2, 5),
-- 白素贞
(33, 3, 1),(68, 3, 3),(99, 3, 5),
-- 许仙
(67, 4, 1),(23, 4, 3),(56, 4, 5),(72, 4, 6),
-- 不想毕业
(81, 5, 1),(37, 5, 5),
-- 好好说话
(56, 6, 2),(43, 6, 4),(79, 6, 6),
-- tellme
(80, 7, 2),(92, 7, 6);
--4.2.1内连接:进行笛卡尔积
--查询“许仙”同学的 成绩
select student.id, student.name, score.student_id, score.course_id, score.score from student  inner join score on student.id = score.student_id and student.name = '许仙';
select student.id, student.name, score.student_id, score.course_id, score.score from student, score where student.id = score.student_id and student.name = '许仙';  
--查询所有同学的总成绩，及同学的个人信息
select 
    student.sn,
    student.name,
    student.qq_mail,
    sum(score.score)
from 
    student,score
where
    student.id = score.student_id
group by
    student.id;
--查询所有同学的成绩，及同学的个人信息
--查询出来的都是有成绩的同学，“老外学中文”同学 没有显示
select * from student stu join score sco on stu.id=sco.student_id;
-- 学生表、成绩表、课程表3张表关联查询
SELECT
    student.id,
    student.sn,
    student.NAME,
    student.qq_mail,
    score.score,
    score.course_id,
    course.NAME
FROM
    student,score,course
where
    student.id = score.student_id and
    score.course_id = course.id
ORDER BY
    student.id;
--
--4.2.2外连接:只能使用join on 实现 内连接是表中数据必须在两张表中都出现
--左外连接：可以保证左边的表中的数据一定会出现。left join
select * from student left join score on student.id = score.student_id;
--右外连接：可以保证右边的表中的数据一定会出现。right join
select * from score score right join student on student.id=score.student_id;
--全外连接（mysql不支持）：两张表中所有的数据都会出现。


--4.2.3自连接:自己和自己做笛卡尔积
--自连接是指在同一张表连接自身进行查询
--显示所有“计算机原理”成绩比“Java”成绩高的成绩信息
--先查询“计算机原理”和“java”课程的id




--4.2.4子查询：也叫嵌套查询，嵌套在其他查询语句中的查询语句
--查询“语文”或 “英语”的成绩
--[not]in：主要使用方式
--对于in来说，明确的先执行子查询，再把子查询结果放到一张临时表，在执行外层父查询，
--父查询where条件就是拿着父查询中每个记录去和子查询表中的结果进行对比，（适用于子查询结果比较小，可以直接放在内存中的，如果子查询比较大执行速度就比较慢了）
select score from score where course_id in(
select id from course
where name ='语文' or name = '英语');
--exists：是在一些特定情况下才使用
--exists是先执行父查询，针对父查询的每一条结果，都在执行一次父查询，（对于工作中，如果in搞不定，exists大概率也搞不定）
select *from score where exists(select score.course_id from course where (name = '语文' or name = '英文')and course_id = score.course_id);

--4.2.5合并查询
--union:该操作符用于取得两个结果集的并集。当使用该操作符时，会自动去掉结果集中的重复行
select * from course where id<3
union
select * from course where name='英文';
-- 或者使用or来实现
select * from course where id<3 or name='英文';

--union all:该操作符用于取得两个结果集的并集。当使用该操作符时，不会去掉结果集中的重复行
-- 可以看到结果集中出现重复数据Java
select * from course where id<3
union all
select * from course where name='英文';






