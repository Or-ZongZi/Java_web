#通过sql语句建表,表名为t_soft
CREATE TABLE IF NOT EXISTS t_soft(
#通过sql语句建表,字段和类型如上所示
id INT COMMENT '员工id' ,
`name` VARCHAR(100) COMMENT '员工姓名' NOT NULL,
sex VARCHAR(4) COMMENT '性别' NOT NULL, 
card_no VARCHAR(20) COMMENT '身份证号' NOT NULL,
hri_date DATE COMMENT '入职日期' NOT NULL,
sal DOUBLE COMMENT '底薪' NOT NULL,
dept_name VARCHAR(255) COMMENT '岗位名称' NOT NULL,
content VARCHAR(500) COMMENT '备注' 
);
#通过sql语句建表,设置id为主键且自增
ALTER TABLE t_soft ADD PRIMARY KEY(id);
ALTER TABLE t_soft CHANGE id id INT AUTO_INCREMENT;

#设置员工姓名字段唯一约束
ALTER TABLE t_soft CHANGE `name` `name` VARCHAR(100) UNIQUE NOT NULL;

#修改底薪字段数据类型为decimal(16,2)
ALTER TABLE t_soft CHANGE sal sal DECIMAL(16,2) NOT NULL;

#通过sql语句修改sex的字段名为gender
ALTER TABLE t_soft CHANGE sex gender VARCHAR(4) NOT NULL;

#通过sql语句,删除备注字段
ALTER TABLE t_soft DROP content;

#通过sql语句,删除备注字段
INSERT t_soft VALUES(0,'小明','男','5454612323','2021-01-02','5234.22','清洁工');
INSERT t_soft VALUES(0,'小明2','女','4612323','2022-01-02','4234.22','清洁工1');
INSERT t_soft VALUES(0,'小明3','男','454612323','2018-01-02','1234.22','清洁工2');
INSERT t_soft VALUES(0,'小明4','女','9454612323','2015-01-02','2234.22','清洁工3');
INSERT t_soft VALUES(0,'小明5','男','4454612323','2017-01-02','8234.22','清洁工4');

#把所有女性的底薪增加5000
UPDATE t_soft SET sal=sal+5000 WHERE gender='女';

#展示所有员工信息,并按照底薪倒叙排序,字段名称以中文形式显示
SELECT id 编号,`name` 姓名,gender 性别,card_no 身份证号,hri_date 入职日期,sal 底薪,dept_name 岗位名称 FROM t_soft ORDER BY sal DESC;

#展示男性与女性的平均薪资
SELECT gender 性别,AVG(sal) 平均薪资 FROM t_soft GROUP BY(gender);

#展示今年入职员工中,底薪最高的员工薪资
SELECT * FROM t_soft WHERE sal=(SELECT MAX(sal) FROM t_soft) AND  YEAR(hri_date)=YEAR(NOW());

#查询员工表，实现分页查询。从第2条记录开始查询，查询3条记录，并显示员工信息
SELECT * FROM t_soft LIMIT 1,3;

#查询所有员工的平均底薪
SELECT AVG(sal) 所有员工平均薪资 FROM t_soft;

#查询每个岗位的平均薪资
SELECT dept_name 岗位,AVG(sal) 平均薪资 FROM t_soft GROUP BY(dept_name);

#查询姓名中包含”乐”的男性员工的信息(没有对应数据要先插入测试数据)
#插入数据
INSERT t_soft VALUES(0,'小乐小','女','22454612323','2017-01-02','3234.22','清洁工1');
INSERT t_soft VALUES(0,'小闯','男','44612323','2017-01-02','1234.22','清洁工2');
SELECT * FROM t_soft WHERE `name` LIKE '%乐%';

#查询姓名中最后一个字是”闯”的学生信息
SELECT * FROM t_soft WHERE `name` LIKE '%闯';

#删除底薪低于5000的员工
DELETE FROM t_soft WHERE sal<5000;

#查询各个岗位中底薪高于10000的人数,展示岗位名称和人数
SELECT COUNT(id) 人数,dept_name 岗位 FROM t_soft WHERE sal>10000 GROUP BY(dept_name);

#删除员工表中所有数据,并且删除后的id自增序列从1开始
TRUNCATE t_soft;
#测试
INSERT t_soft VALUES(0,'小明','男','5454612323','2021-01-02','5234.22','清洁工');
INSERT t_soft VALUES(0,'小明2','女','4612323','2022-01-02','4234.22','清洁工1');
INSERT t_soft VALUES(0,'小明3','男','454612323','2018-01-02','1234.22','清洁工2');
INSERT t_soft VALUES(0,'小明4','女','9454612323','2015-01-02','2234.22','清洁工3');
INSERT t_soft VALUES(0,'小明5','男','4454612323','2017-01-02','8234.22','清洁工4');

