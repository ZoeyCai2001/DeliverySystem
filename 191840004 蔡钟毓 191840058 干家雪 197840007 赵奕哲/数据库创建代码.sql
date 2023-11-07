CREATE DATABASE milktea_deliver
ON  PRIMARY 
( NAME = 'mtd_data', 
  FILENAME = 'c:\database\mtd_data.mdf' , 
  SIZE = 5MB , 
  MAXSIZE = 200MB , 
  FILEGROWTH = 1MB)
 LOG ON 
( NAME = 'mtd_log', 
  FILENAME = 'c:\database\mtd_log.ldf' , 
  SIZE = 3MB , 
  MAXSIZE = 200MB , 
  FILEGROWTH = 10% 
  )
  go
  

use milktea_deliver
go

create table customer
(
cno char(10) primary key,
cname char(10),
chome char(20) not null,
ctel char(15) not null
)
GO

create table deliveryman
(
dno char(10) primary key,
dname char(10),
dtel char(15) not null,
dsatis numeric(6,2),
dtime numeric(6,2)
)

GO

create table business
(
bno char(10) primary key,
bname char(10),
bhome char(20),
btel char(15)
)
GO

create table milktea
(
mno char(10) primary key,
mname char(20) not null,
bno char(10) not null,
mprice numeric(6,2) not null,
msize char(5) check (msize='大杯'or msize='中杯') default'中杯',
)
GO


create table ordering
(
oid char(10) primary key,
cno char(10),
mno char(10),
otime datetime,
oway char(10),
ofee numeric(6,2),
oco numeric(6,2),
osta varchar(10) check (osta='已接单' or osta='已完成'),
mtem char(5) check (mtem='常温'or mtem='热' or  mtem='去冰'or mtem='加冰') default'常温',
msweet char(10) check(msweet='半糖'or msweet='三分糖'or msweet='七分糖'or msweet='全糖' or msweet='无糖') default'半糖',
)
GO

create table pickup
(
oid char(10) primary key,
bno char(10),
dno char(10),
ptime datetime not null,
)
GO

create table deliver
(
oid char(10) primary key,
cno char(10),
dno char(10),
exptime datetime,
actime datetime,
satis numeric(6,2),
tip numeric(6,2),
)
GO



  
  
