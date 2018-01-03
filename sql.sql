--select u_uid, uloginname, uname, upwd, udept, uphoneno, uvphone  from uusers where u_uid = 1000;
connect sys/orcl@orcl as sysdba
select sysdate from dual;
--删除用户
drop user yxd cascade;
--新建用户

create user yxd --用户名
identified by yxd --密码
account unlock;
--授权
grant connect, resource,create any view to yxd;

connect yxd/yxd@orcl
ALTER SESSION SET nls_date_format='yyyy-mm-dd hh24:mi:ss';
SET PAGESIZE 55;
SET LINESIZE 600;

--创建用户序列
--drop sequence useq;
create sequence useq
	increment by 1
	start with 11;

--创建车辆序列
--drop sequence carseq;
create sequence carseq
	increment by 1
	start with 11;

--创建司机序列
--drop sequence driseq;
create sequence driseq
	increment by 1
	start with 11;
	
--创建申请表序列
--drop sequence appseq;
create sequence appseq
	increment by 1
	start with 1;


/*
删除用户表
truncate table uusers;
drop table uusers;
*/
--创建用户表 
--desc uusers
create table uusers(
	u_uid number(4),                             --用户序号
	uloginname varchar2(20),                     --登陆名
	uname varchar2(15),                          --姓名
	upwd varchar2(32) default '96e79218965eb72c92a549dd5a330112',          --密码、默认：111111 MD5： 96e79218965eb72c92a549dd5a330112
	udept varchar2(40),                          --部门、13字以内 utf-8 在oracle中 汉字占用3个字符
	uoffice varchar2(20) default '铁岭市公司',    --公司名、10字以内
	uphoneno varchar2(11),                       --电话号、11位
	uvphone varchar2(6),                         --V网小号
	uauthority number(1) default 4,              --权限级别
	ulogintimes number(6) default 1,             --登陆次数
	primary key(u_uid)
);
-- Add comments 
	comment on table UUSERS is '用户表';
	comment on column UUSERS.U_UID is '用户序号';
	comment on column UUSERS.ULOGINNAME is '登陆名';
	comment on column UUSERS.UNAME is '姓名';
	comment on column UUSERS.UPWD is '密码';
	comment on column UUSERS.UDEPT is '部门';
	comment on column UUSERS.uoffice is '公司名';
	comment on column UUSERS.UPHONENO is '电话号';
	comment on column UUSERS.UVPHONE is 'V网小号';
	comment on column UUSERS.UAUTHORITY is '权限级别';
	comment on column UUSERS.ULOGINTIMES is '登陆次数';

insert into uusers (u_uid,uloginname,uname,upwd,udept,uoffice,uphoneno,uVphone)
values (10000,'yxd','yxdtest','c3257a32c560ac14800c6fa55d67f6a3','kxzx','铁岭市公司','13700111111','610173');
insert into uusers (u_uid,uloginname,uname,upwd,udept,uoffice)
values (9999,'zs','张三test','c3257a32c560ac14800c6fa55d67f6a3','网络优化中心','铁岭市公司');
insert into uusers  values (998,'z','游客test','96e79218965eb72c92a549dd5a330112','kxzx','铁岭市公司','12345678901','610888',4,1);
insert into uusers  values (10001,'pche','派车test','96e79218965eb72c92a549dd5a330112','车辆管理','铁岭市公司',' ','660910',1,1);
insert into uusers  values (10002,'zhb','综合部test','96e79218965eb72c92a549dd5a330112','综合部','铁岭市公司',' ','666667',2,1);
insert into uusers  values (10003,'zl','zltest','96e79218965eb72c92a549dd5a330112','kxzx','铁岭市公司',' ','610150',3,1);
select * from uusers;
commit;
--update uusers set upwd = 'c3257a32c560ac14800c6fa55d67f6a3' where u_uid = 1000;
--创建车辆表
--drop table tlcars;
create table tlcars(
	c_uid number(4),                         --车辆序号
	cno varchar2(20),                        --车牌号
	ctype varchar2(20) default '轿车',       --车型
	cdept varchar2(20) default '铁岭市公司',  --公司
	ccondition number(1) default 0,          --车辆状态
	primary key(c_uid)
);
-- Add comments
	comment on table TLCARS is '车辆表';
	comment on column TLCARS.C_UID is '车辆序号';
	comment on column TLCARS.CNO is '车牌号';
	comment on column TLCARS.CTYPE is '车型';
	comment on column TLCARS.cdept is '公司';
	comment on column TLCARS.CCONDITION is '车辆状态'; 

desc tlcars;
insert into tlcars values( 0, ' ', '轿车',' ', 0 );
insert into tlcars (C_UID ,CNO ,cdept ) values (10 ,'车牌号' ,'铁岭市公司');
select * from tlcars;

--创建司机表
--drop table drivers;
create table drivers(
	d_uid number(4),                         --司机序号
	driname varchar2(20),                    --司机姓名
	driphone varchar2(11),                   --司机电话
	ddept varchar2(20) default '铁岭市公司',  --公司名
	dricondition number(1) default 0,        --司机状态
	primary key(d_uid)
);
	comment on table DRIVERS is '司机表';
	comment on column DRIVERS.D_UID is '司机序号';
	comment on column DRIVERS.DRINAME is '司机姓名';
	comment on column DRIVERS.DRIPHONE is '司机电话';
	comment on column DRIVERS.ddept is '公司名';
	comment on column DRIVERS.DRICONDITION is '司机状态';
desc drivers;
insert into drivers values( 0, ' ', ' ',' ' , 0 );
insert into drivers (D_UID ,DRINAME ,DRIPHONE ) values (10 ,'司机名 ', '666666' );
select * from drivers;
--创建派车申请表
drop view userapp;
drop table applicationtab cascade constraint;
create table applicationtab(
	app_uid number(10),                   --申请序号
	applydate date,                       --申请时间
	applyname varchar2(20),               --申请人
	appdept varchar2(20),                 --申请部门
	appoffice varchar2(20),               --申请公司
	appcount number(2),                   --用车人数
	beginpoint varchar2(20),              --起点
	destination varchar2(20),             --目的地
	reason varchar2(100),                 --原因
	begintime date,                       --出发时间
	endtime date,                         --返回时间
	acondition number(1) default 0,       --申请状态
	depoption varchar2(50) default '未处理',	
	comoption varchar2(50) default '未处理',
	appoption varchar2(50) default '未处理',
	cuid number(4) default 0,          --所派车号
	drid number(4) default 0,          --所派司机
	primary key(app_uid)/*,
	constraint app_car foreign key (cuid)
		references tlcars (c_uid),
	constraint app_dri foreign key (drid)
		references drivers (d_uid)*/
);
insert into applicationtab values (1009 ,sysdate ,'yxd' ,'kxzx','铁岭市公司',9 ,'市公司' ,'生产楼' ,'处理故障' ,
sysdate ,sysdate ,9 , '未处理' ,'未处理' ,'同意' ,10 ,10);
insert into applicationtab values (1008 ,sysdate ,'yxd' ,'kxzx','铁岭市公司',8 ,'市公司' ,'生产楼' ,'处理故障' ,
sysdate ,sysdate ,8 , '未处理' ,'未处理' ,'无车' ,0 ,0);
insert into applicationtab values (1006 ,sysdate ,'yxd' ,'kxzx','铁岭市公司',6 ,'市公司' ,'生产楼' ,'处理故障' ,
sysdate ,sysdate ,6 , '未处理' ,'同意' ,'未处理' ,0 ,0);
insert into applicationtab values (1005 ,sysdate ,'yxd' ,'kxzx','铁岭市公司',5 ,'市公司' ,'生产楼' ,'处理故障' ,
sysdate ,sysdate ,5 , '同意' ,'拒绝' ,'未处理' ,0 ,0);
insert into applicationtab values (1004 ,sysdate ,'yxd' ,'kxzx','铁岭市公司',4 ,'生产楼' ,'西风' ,'处理投诉' ,
sysdate ,sysdate ,4 , '拒绝' ,'未处理' ,'未处理' ,0 ,0);
insert into applicationtab values (1003 ,sysdate ,'yxd' ,'kxzx','铁岭市公司',3 ,'生产楼' ,'铁岭商业银行' ,'信号测试' ,
sysdate ,sysdate ,3 , '同意' ,'同意' ,'未处理' ,0 ,0);
insert into applicationtab values (1002 ,sysdate ,'yxd' ,'kxzx','铁岭市公司',2 ,'生产楼' ,'市公司' ,'处理故障' ,
sysdate ,sysdate ,2 , '未处理1' ,'同意' ,'未处理' ,0 ,0);
insert into applicationtab values (1001 ,sysdate ,'yxd' ,'kxzx','铁岭市公司',7 ,'市公司' ,'生产楼' ,'处理故障' ,
sysdate ,sysdate ,1 , '同意' ,'未处理' ,'未处理' ,0 ,0);
insert into applicationtab values (998 ,sysdate ,'张三' ,'网络优化中心','铁岭市公司',10 ,'生产楼' ,'西风' ,'处理投诉' ,
sysdate ,sysdate ,9 , '同意' ,'未处理' ,'同意' ,10 ,10);
insert into applicationtab values (999 ,sysdate ,'张三' ,'网络优化中心','铁岭市公司',2 ,'生产楼' ,'铁岭商业银行' ,'信号测试' ,
sysdate ,sysdate ,1 , '同意' ,'未处理' ,'未处理' ,0 ,0);

-- Add comments
	comment on table APPLICATIONTAB is '派车申请表';
	comment on column APPLICATIONTAB.APP_UID is '申请序号';
	comment on column APPLICATIONTAB.APPLYDATE is '申请时间';
	comment on column APPLICATIONTAB.APPLYNAME is '申请人';
	comment on column APPLICATIONTAB.appdept is '申请部门';
	comment on column APPLICATIONTAB.appoffice is '申请公司';
	comment on column APPLICATIONTAB.appcount is '用车人数';
	comment on column APPLICATIONTAB.BEGINPOINT is '起点';
	comment on column APPLICATIONTAB.DESTINATION is '目的地';
	comment on column APPLICATIONTAB.REASON is '原因';
	comment on column APPLICATIONTAB.begintime is '出发时间';
	comment on column APPLICATIONTAB.endtime is '返回时间';
	comment on column APPLICATIONTAB.acondition is '申请状态';
	comment on column APPLICATIONTAB.depoption is '部门意见';
	comment on column APPLICATIONTAB.comoption is '综合部意见';
	comment on column APPLICATIONTAB.appoption is '派车意见';
	comment on column APPLICATIONTAB.CUID is '所派车号';
	comment on column APPLICATIONTAB.DRID is '所派司机';

desc applicationtab;
select * from applicationtab;
select sysdate from dual;

--便于查看的申请表查询命令（未使用）(out-of-date Version)
select * from
	(select aa.APP_UID, aa.APPLYDATE, aa.APPLYNAME, aa.DESTINATION, aa.REASON, car.CNO, d.DRINAME, aa.appoption
	from applicationtab aa, tlcars car, drivers d
	where aa.CUID = car.C_UID and aa.DRID = d.D_UID)
order by APP_UID desc





--创建普通用户视图**********************
create or replace view userapp (appId ,applyDate, begintime, endtime, appDept, appoffice, appName, 
	manCount, beginPoint, go_TO, reason, cNo, driverInfo, aCondition, depOption, comOption, appOption)
as select aa.APP_UID, TO_CHAR(aa.APPLYDATE, 'yyyy-mm-dd hh24:mi'), TO_CHAR(aa.begintime, 'yyyy-mm-dd hh24:mi'), 
	TO_CHAR(aa.endtime, 'yyyy-mm-dd hh24:mi'), aa.appdept, aa.appoffice, aa.APPLYNAME, aa.appcount, 
	aa.BEGINPOINT, aa.DESTINATION, aa.REASON, car.CNO, d.driname||d.driphone, aa.acondition, 
	aa.depoption, aa.comoption, aa.appoption
from applicationtab aa, tlcars car, drivers d
where aa.CUID = car.C_UID and aa.DRID = d.D_UID
with read only;

--drop view userapp;

ALTER SESSION SET nls_date_format='yyyy-mm-dd hh24:mi:ss';
SET PAGESIZE 55;
SET LINESIZE 600;
/******
普通用户查询语句 --kxzx
*****/
select * from
	(select * from userapp
	where appdept = 'kxzx'    --网络优化中心
	order by appid desc)
where ROWNUM <= 50

--申请单状态：（未使用）acondition
--0：默认
--1：仅部门已批准
--2：仅综合部已批准
--3：部门综合部均批准
--4：部门拒绝
--5：综合部拒绝
--6：部门批准综合部拒绝
--7：
--8：拒绝、无车
--9：已派

--派车人员待处理 acondition < 4 
select * from userapp
where appoption = '未处理'
order by applydate desc
--综合部待处理 acondition < 2
select * from applicationtab
where appoption = '未处理'
AND comoption = '未处理'
AND depoption != '未处理'
order by applydate desc
--部门待处理 acondition = 0
select * from applicationtab
where appoption = '未处理'
AND comoption = '未处理'
AND depoption = '未处理'
order by applydate desc
--派车已批准 acondition = 9
select * 
from	(select * from userapp
		where appoption !='未处理'
		order by appid desc )
where ROWNUM <= 50
--综合部已批准 acondition in (2,3)
select *
from (select * from applicationtab
	where comoption != '未处理'
	order by applydate desc)
where rownum <=50
--部门已批准 depoption != '未处理'
select *
from (select * from applicationtab
	where depoption != '未处理'
	order by applydate desc)
where rownum <=50
--派车人员已拒绝  acondition = 8
select * from applicationtab where acondition = 8
--综合部已拒绝 acondition in (5,6)
select * from applicationtab where comoption == '拒绝'
--部门已拒绝 acondition 4
select * from applicationtab where depoption == '拒绝'





--insert into applicationtab (app_uid, applydate, applyname, appdept, appcount, beginpoint, destination, reason, begintime, endtime ) values (appseq.nextval, sysdate, 'yxd', 'kxzx', 5, 'f的f', '22d6啊asd', 'efwq226啊', TO_DATE('2015-05-31 15:15', 'yyyy-MM-dd hh24:mi'), TO_DATE('2015-06-03 15:15', 'yyyy-MM-dd hh24:mi'));


