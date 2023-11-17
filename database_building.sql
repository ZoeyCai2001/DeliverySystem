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
msize char(5) check (msize='��'or msize='�б�') default'�б�',
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
osta varchar(10) check (osta='�ѽӵ�' or osta='�����'),
mtem char(5) check (mtem='����'or mtem='��' or  mtem='ȥ��'or mtem='�ӱ�') default'����',
msweet char(10) check(msweet='����'or msweet='������'or msweet='�߷���'or msweet='ȫ��' or msweet='����') default'����',
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



  
  
