CREATE DATABASE IF NOT EXISTS newsdb;

CREATE TABLE comments(
cmtId INT(11) NOT NULL AUTO_INCREMENT,
newId INT(11) NOT NULL,
cmtContent VARCHAR(200) NOT NULL,
cmtDate TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
cmtIp VARCHAR(32) NOT NULL,
cmtAuthor VARCHAR(15) NOT NULL,
PRIMARY KEY(cmtId)
);

INSERT comments VALUES(0,1,'有深度','2019-04-09 09:35:54','192.168.1.110','张三');
INSERT comments VALUES(0,1,'不错','2019-04-09 18:00:00','192.168.1.111','李四');
INSERT comments VALUES(3,2,'相当优秀','2019-04-11 10:12:10','192.168.1.112','王五');

SELECT * FROM comments;

#删除字段cmtId为2的记录
DELETE FROM comments WHERE cmtId=2;

#修改字段cmtId值为3的cmtAuthor为“赵六”
UPDATE comments SET cmtAuthor='赵六' WHERE cmtId=3;