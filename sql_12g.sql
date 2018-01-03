--*******************************
--*	针对 oracle 12g：	*
--*		需执行下面语句：	*
--*******************************
--connect sys/orcl@orcl as sysdba
--alter pluggable database all open;
--grant all privileges to sys with admin option;
--然并卵


--select u_uid, uloginname, uname, upwd, udept, uphoneno, uvphone from uusers where u_uid = 1000;
connect sys/orcl@orcl as sysdba
select sysdate from dual;
--删除用户
drop user c##yxd cascade;
--新建用户

create user c##yxd --用户名
identified by yxd --密码
account unlock;
--授权
grant dba, connect, resource, create session, create any view, drop any view to c##yxd;

connect c##yxd/yxd@orcl
ALTER SESSION SET nls_date_format='yyyy-mm-dd hh24:mi:ss';
SET PAGESIZE 55;
SET LINESIZE 1800;

--创建用户序列
--drop sequence useq;
create sequence useq
	increment by 1
	start with 101;

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
	u_uid number(5),                             --用户序号
	uloginname varchar2(20),                     --登陆名
	uname varchar2(21),                          --姓名
	upwd varchar2(32) default '96e79218965eb72c92a549dd5a330112',          --密码、默认 ：111111 MD5： 96e79218965eb72c92a549dd5a330112
	udept varchar2(40),                          --中心、13字以内 utf-8 在oracle中 汉字占用3个字符
	udept2 varchar2(40),                         --部门
	uoffice varchar2(30) default '铁岭市公司',    --公司名、10字以内
	uphoneno varchar2(11),                       --电话号、11位
	uvphone varchar2(6),                         --V网小号
	uauthority number(1) default 4,              --权限级别
	ulogintimes number(6) default 1,             --登陆次数
	uremarks varchar2(150),						 --备注
	primary key(u_uid)
);
-- Add comments 
	comment on table UUSERS is '用户表';
	comment on column UUSERS.U_UID is '用户序号';
	comment on column UUSERS.ULOGINNAME is '登陆名';
	comment on column UUSERS.UNAME is '姓名';
	comment on column UUSERS.UPWD is '密码';
	comment on column UUSERS.UDEPT is '中心';
	comment on column UUSERS.UDEPT2 is '部门';
	comment on column UUSERS.uoffice is '公司名';
	comment on column UUSERS.UPHONENO is '电话号';
	comment on column UUSERS.UVPHONE is 'V网小号';
	comment on column UUSERS.UAUTHORITY is '权限级别';
	comment on column UUSERS.ULOGINTIMES is '登陆次数';
	comment on column UUSERS.UREMARKS is '备注';

insert into uusers (u_uid,uloginname,uname,upwd,udept,udept2,uoffice,uphoneno,uVphone)
values (10000,'yxd','yxdtest','c3257a32c560ac14800c6fa55d67f6a3','kxzx','网络部','铁岭市公司','13700101911','610173');
insert into uusers (u_uid,uloginname,uname,upwd,udept,udept2,uoffice)
values (9999,'zs','张三test','c3257a32c560ac14800c6fa55d67f6a3','网络优化中心','网络部','铁岭市公司');
insert into uusers values (9998,'z','游客test','96e79218965eb72c92a549dd5a330112','kxzx','网络部','铁岭市公司','12345678901','610888',4,1);
insert into uusers values (10001,'pche','派车test','96e79218965eb72c92a549dd5a330112','车辆管理','车辆管理','铁岭市公司',0,0,1,1);
insert into uusers values (10002,'zhb','综合部test','96e79218965eb72c92a549dd5a330112','综合部','行政事务管理中心','铁岭市公司',' ','666667',2,1);
insert into uusers values (10003,'zl','zltest','96e79218965eb72c92a549dd5a330112','kxzx','网络部','铁岭市公司',' ','610150',3,1);
select * from uusers;
commit;
--update uusers set upwd = 'c3257a32c560ac14800c6fa55d67f6a3' where u_uid = 10000;
--创建车辆表
--drop table tlcars;
create table tlcars(
	c_uid number(4),                         --车辆序号
	cno varchar2(20),                        --车牌号
	ctype varchar2(20) default '轿车',       --车型
	cdept varchar2(30) default '铁岭市公司',  --公司
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
	ddept varchar2(30) default '铁岭市公司',  --公司名
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
	appnameid number(5),                  --申请人编号
	appcount number(2),                   --用车人数
	beginpoint varchar2(30),              --起点
	range number(1),                      --市内 0、市外 1
	destination varchar2(30),             --目的地
	reason varchar2(100),                 --原因
	begintime date,                       --出发时间
	endtime date,                         --返回时间
	acondition number(2) default 0,       --申请状态
	depoption varchar2(60) default '未处理',
	depoption2 varchar2(60) default '未处理',	
	comoption varchar2(60) default '未处理',
	appoption varchar2(60) default '未处理',
	cuid number(4) default 0,          --所派车号
	drid number(4) default 0,          --所派司机
	primary key(app_uid)/*,
	constraint appname foreign key (appnameid)  -- appnameid 关联 uusers 的 u_uid
		references uusers (u_uid),
	constraint app_car foreign key (cuid)
		references tlcars (c_uid),
	constraint app_dri foreign key (drid)
		references drivers (d_uid)*/
);
insert into applicationtab values (1010 ,sysdate ,10000,2 ,'市公司' ,0 ,'生产楼' ,'处理故障' ,
sysdate ,sysdate ,10 , '同意' , 0,'未处理' ,'已派' ,10 ,10);
insert into applicationtab values (1009 ,sysdate ,10000,9 ,'市公司' ,0 ,'生产楼' ,'处理故障' ,
sysdate ,sysdate ,9 , '同意' , '同意','同意' ,'无车' ,10 ,10);
insert into applicationtab values (1008 ,sysdate ,10000,8 ,'市公司' ,1 ,'北京' ,'处理故障' ,
sysdate ,sysdate ,8 , '同意' , '同意','拒绝' ,'未处理'  ,0 ,0);
insert into applicationtab values (1007 ,sysdate ,10000,8 ,'市公司' ,1 ,'沈阳' ,'处理故障' ,
sysdate ,sysdate ,7 , '同意' , '拒绝','未处理' ,'未处理' ,0 ,0);
insert into applicationtab values (1006 ,sysdate ,10000,8 ,'市公司' ,1 ,'沈阳' ,'处理故障' ,
sysdate ,sysdate ,6 , '同意' ,'拒绝'  ,'未处理' ,'未处理' ,0 ,0);
insert into applicationtab values (1005 ,sysdate ,10000,6 ,'市公司' ,0 ,'生产楼' ,'处理故障' ,
sysdate ,sysdate ,5 , '拒绝' ,'未处理'  ,'未处理' ,'未处理' ,0 ,0);
insert into applicationtab values (1004 ,sysdate ,10000,5 ,'市公司' ,1 ,'生产楼' ,'处理故障' ,
sysdate ,sysdate ,4 , '同意','同意' ,'同意' ,'未处理' ,0 ,0);
insert into applicationtab values (1003 ,sysdate ,10000,4 ,'生产楼' ,1 ,'沈阳' ,'处理投诉' ,
sysdate ,sysdate ,3 , '同意' ,'同意' ,'未处理' ,'未处理' ,0 ,0);
insert into applicationtab values (1002 ,sysdate ,10000,3 ,'生产楼' ,1 ,'沈阳' ,'信号测试' ,
sysdate ,sysdate ,2 , '同意' ,'同意' ,'未处理' ,'未处理' ,0 ,0);
insert into applicationtab values (1001 ,sysdate ,10000,2 ,'生产楼' ,0 ,'市公司' ,'处理故障' ,
sysdate ,sysdate ,1 , '同意' , 0,'未处理' ,'未处理' ,0 ,0);
insert into applicationtab values (1000 ,sysdate ,10000,7 ,'市公司' ,0 ,'生产楼' ,'处理故障' ,
sysdate ,sysdate ,0 , '未处理' , 0,'未处理' ,'未处理' ,0 ,0);
insert into applicationtab values (998 ,sysdate ,9999,10 ,'生产楼' ,0 ,'西风' ,'处理投诉' ,
sysdate ,sysdate ,9 , '同意' , 0,'未处理' ,'无车' ,10 ,10);
insert into applicationtab values (999 ,sysdate ,9999,2 ,'生产楼' ,0 ,'铁岭商业银行' ,'信号测试' ,
sysdate ,sysdate ,0 , '未处理' , 0,'未处理' ,'未处理' ,0 ,0);

-- Add comments
	comment on table APPLICATIONTAB is '派车申请表';
	comment on column APPLICATIONTAB.APP_UID is '申请序号';
	comment on column APPLICATIONTAB.APPLYDATE is '申请时间';
	comment on column APPLICATIONTAB.appnameid is '申请人编号';
	comment on column APPLICATIONTAB.appcount is '用车人数';
	comment on column APPLICATIONTAB.BEGINPOINT is '起点';
	comment on column APPLICATIONTAB.range is '市内or市外';
	comment on column APPLICATIONTAB.DESTINATION is '目的地';
	comment on column APPLICATIONTAB.REASON is '原因';
	comment on column APPLICATIONTAB.begintime is '出发时间';
	comment on column APPLICATIONTAB.endtime is '返回时间';
	comment on column APPLICATIONTAB.acondition is '申请状态';
	comment on column APPLICATIONTAB.depoption is '中心意见';
	comment on column APPLICATIONTAB.depoption2 is '部门意见';
	comment on column APPLICATIONTAB.comoption is '行政事务中心意见';
	comment on column APPLICATIONTAB.appoption is '派车意见';
	comment on column APPLICATIONTAB.CUID is '所派车号';
	comment on column APPLICATIONTAB.DRID is '所派司机';

desc applicationtab;
select * from applicationtab;
select sysdate from dual;

--便于查看的申请表查询命令（未使用）(out-of-date Version)
select * from
	(select aa.APP_UID, aa.APPLYDATE, aa.appnameid, aa.DESTINATION, aa.REASON, car.CNO, d.DRINAME, aa.appoption
	from applicationtab aa, tlcars car, drivers d
	where aa.CUID = car.C_UID and aa.DRID = d.D_UID)
order by APP_UID desc





--创建普通用户视图**********************
create or replace view userapp (appId ,applyDate, begintime, endtime, appName, appDept, appDept2, appoffice, 
	manCount, beginPoint, range, go_TO, reason, cNo, driverInfo, aCondition, depOption, depOption2, comOption, appOption)
as select aa.APP_UID, TO_CHAR(aa.APPLYDATE, 'yyyy-mm-dd hh24:mi'), TO_CHAR(aa.begintime, 'yyyy-mm-dd hh24:mi'), 
	TO_CHAR(aa.endtime, 'yyyy-mm-dd hh24:mi'), uu.uname, uu.udept, uu.udept2, uu.uoffice, aa.appcount, 
	aa.BEGINPOINT, aa.range, aa.DESTINATION, aa.REASON, car.CNO, d.driname||d.driphone, aa.acondition, 
	aa.depoption, aa.depoption2, aa.comoption, aa.appoption
from applicationtab aa, uusers uu, tlcars car, drivers d
where aa.appnameid = uu.u_uid and aa.CUID = car.C_UID and aa.DRID = d.D_UID
with read only;

--drop view userapp;

ALTER SESSION SET nls_date_format='yyyy-mm-dd hh24:mi:ss';
SET PAGESIZE 55;
SET LINESIZE 1800;
/******
普通用户查询语句 --kxzx
*****/
select * from
	(select * from userapp
	where appdept = 'kxzx'    --网络优化中心
	order by appid desc)
where ROWNUM <= 50

--申请单状态：acondition
--0：默认
--1：仅中心已批准     range=0：等待派车；range=1：等待部门批准
--2：仅部门已批准     ：等待行政事务批准	
--3：中心部门均批准	range=1：等待行政事务批准
--4：行政事务批准	range=1：等待派车
--5：中心拒绝
--6：部门拒绝
--7：中心批准部门拒绝
--8：行政事务拒绝
--9：拒绝、无车
--10：已派
select * from userapp where appoffice = '铁岭市公司' AND acondition = 0 AND appdept = 'kxzx' order by applydate
--派车人员待处理  (range=0 and acondition in (1,2,3)) or (range=1 and acondition = 4) 
--派车可查看： acondition < 5
--2016-11-23 更新：acondition between 1 and 5
select * from userapp
where (range=0 and acondition in (1,2,3)) or (range=1 and acondition = 4)
order by applydate

--行政事务待处理 range = 1 and acondition in (2,3)
--可查看：range = 1 and acondition < 4
select * from userapp
where acondition in (2,3)
order by applydate

--部门待处理 【理论】：range = 1 and acondition = 1
--可查看： 【实际】： acondition < 2
--2016-11-23 更新：acondition = 1
select * from userapp
where range = 1 and acondition = 1
order by applydate

--中心待处理	acondition = 0
select * from userapp
where acondition = 0
order by applydate

--派车已处理 acondition in (9,10)
select * 
from (select * from userapp
		where acondition in (9,10)
		order by applydate desc )
where ROWNUM <= 50

--行政事务已处理 comoption != '未处理'
select *
from (select * from userapp
	where comoption != '未处理'
	order by applydate desc)
where rownum <=50

--部门已处理 depoption2 != '未处理'
select *
from (select * from userapp
	where depoption2 != '未处理'
	order by applydate desc)
where rownum <=50

--中心已处理  deptoption != '未处理'
select *
from (select * from userapp
	where deptoption != '未处理'
	order by applydate desc)
where rownum <=50


--***********************
-*****操作日志
--***********************
--创建操作日志序列
--drop sequence logseq
create sequence logseq
	increment by 1
	start with 1;


--drop table loginlog cascade constraint;
create table loginlog(
id number(10),
ldate date,
luser varchar2(15),
lpwd varchar2(32),
lip varchar2(15),
lmsg varchar2(150),
primary key(id)
);
comment on table loginlog is '操作日志';
comment on column loginlog.id is 'id';
comment on column loginlog.ldate  is '时间';
comment on column loginlog.luser is '用户';
comment on column loginlog.lpwd is '当时的密码';
comment on column loginlog.lip is '客户端ip';
comment on column loginlog.lmsg is '执行的操作';


