#确保数据库bwie_database存在
CREATE DATABASE IF NOT EXISTS bwie_database;

CREATE TABLE stu(
sId INT(11) NOT NULL AUTO_INCREMENT,
sName VARCHAR(50) NOT NULL,
sSex VARCHAR(5) NOT NULL,
sAddress VARCHAR(100) NOT NULL,
sIndate TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
clazzId INT(11) NOT NULL,
PRIMARY KEY(sId)
);

DESC stu;

ALTER TABLE stu MODIFY ssex CHAR(5);

ALTER TABLE stu RENAME student;

ALTER TABLE student CHANGE sName sName VARCHAR(50) UNIQUE;

INSERT student VALUE(0,'张三','男','北京海淀','2019-10-01','1');
INSERT student VALUE(0,'李四','男','雄安新区','2019-05-01','1');
INSERT student VALUE(0,'王五','女','上海奉贤','2015-11-15','1');
INSERT student VALUE(0,'李思思','男','雄安新区','2017-07-09','2');
INSERT student VALUE('5','天奇','男','北京丰台','2018-07-19','4');
INSERT student VALUE(6,'勾八','女','北京丰台','2000-05-16','4');
SELECT * FROM student ORDER BY sId ASC;

DELETE FROM student WHERE sId=6;

#修改学生编号为5的学生名为“天启”，性别为‘男’，住址为’上海奉贤区海湾镇
UPDATE student SET sName='天启',sAddress='上海奉贤区海湾镇',ssex='男' WHERE sId=5;

#查询学生编号为3的学生信息
SELECT * FROM student WHERE sId=5;

#查询所有女学生
SELECT * FROM student WHERE ssex='女';

#查询2000-05-16’出生的女学生
SELECT * FROM student WHERE sIndate='2000-05-16' AND ssex='女';

#查询在‘1990-01-01’到‘1999-12-31’出生的学生信息
SELECT sIndate FROM student WHERE sIndate BETWEEN '1990-01-01' AND '1999-12-31' ;

#查询姓名中包含“宝”的学生信息
SELECT * FROM student WHERE sName LIKE '%思%';

#查询所有女学生，并根据出生日期倒叙排序
SELECT * FROM student WHERE ssex='女' ORDER BY sIndate DESC;

#查询共有多少学生
SELECT COUNT(sId) FROM student; 

#查询所有的学生信息按照“入学时间sindate”降序排序
SELECT * FROM student ORDER BY sIndate ASC;

#查询每班的学生人数（显示出班级编号和学生人数）
SELECT clazzId 班级编号,COUNT(clazzId) 班级人数 FROM student GROUP BY clazzId;


#查询学生表中最远的入学时间
SELECT * FROM student WHERE sIndate=(SELECT MAX(sindate) FROM student);

#删除学生表中所有姓“张”的学生信息
DELETE FROM student WHERE sName LIKE '张%';

#删除学生表
DROP TABLE student;



