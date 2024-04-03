create database CourseDatabase
use CourseDatabase

create table Teachers(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[Surname] nvarchar(100),
[Email] nvarchar(100),
[Age] int
)

create table Students(
[Id] int primary key identity(1,1),
[FullName] nvarchar(100),
[Address] nvarchar(100),
[Age] int
)

drop table Teachers

insert into Teachers ([Name], [Surname], [Email], [Age])
values
('Rashad', 'Agayev', 'rashad@gmail.com', 21),
('Ilqar', 'Shiriyev', 'ilqar@gmail.com', 26),
('Behruz', 'Eliyev', 'behruz@gmail.com', 18),
('Hacixan', 'Hacixanov', 'hacixan@gmail.com', 19);

insert into Students([FullName], [Address], [Age])
values
('Rashad Agayev', 'Nefciler', 21),
('Ilqar Shiriyev', 'Yasamal', 26),
('Behruz Eliyev', 'Kurdexani', 18),
('Hacixan Hacixanov', 'Zaqatala', 19);

select * from Teachers
select * from Students

--Show Students Count
select Count(*) as 'Student Count' from Students
--Show Age 20 Up
select * from Students where Age > 20
select * from Students where Age < 20
--Find 'C' Char
select * from Teachers where [Email] like '%c%'

select SUBSTRING([Email], 1, CHARINDEX('@', [Email]) -1) as EmailPrefix
select SUBSTRING([Email], CHARINDEX('@', [Email]) +1, LEN([Email])) as EmailPrefix
from Teachers
where [Email] like '%c%'

select  * from Students
delete from Students

--DML erase all table data
truncate table Students 

alter table Students 
add SoftDeleted bit default 0;

select * from Students where [SoftDeleted] = 'false'
select * from Students where [SoftDeleted] = 'true'

update Students
set [SoftDeleted] = 1 
where [Id] > 2

create table Countries(
[Id] int primary key identity(1,1), 
[Name] nvarchar(50)
)
create table Cyties(
[Id] int primary key identity(1,1), 
[Name] nvarchar(50),
[CountryId] int,
foreign key ([CountryId]) references Countries(Id)
)

create table Books(
[Id] int primary key identity(1,1), 
[Name] nvarchar(50)
)

drop table Authors

create table Authors(
[Id] int primary key identity(1,1), 
[Name] nvarchar(50),
[Email]nvarchar(50)
)

create table BookAuthors(
[Id] int primary key identity(1,1), 
[BookId] int ,
[AuthorId] int 
foreign key ([BookId]) references Books(Id),
foreign key ([AuthorId]) references Authors(Id)
)

select * from Books
select * from Authors
select * from BookAuthors

insert into Books([Name])
values 
('Ali ve Nino'),
('Leyli Mecnun'),
('Istgendername')

insert into Authors([Name], [Email])
values 
('Author1','Author1@gmail.com'),
('Author2','Author2@gmail.com'),
('Author3','Author3@gmail.com')

insert into BookAuthors([BookId], [AuthorId])
values
(1,1),
(2,1),
(3,2),
(1,2)


insert into Countries([Name])
values 
('Azerbaycan'),
('Turkiye'),
('Ingiltere')

select * from Countries 
select * from Cyties 

insert into Cyties([Name], [CountryId])
values 
('Baki',1),
('Gence',1),
('Zaqatala',1),
('Istambul',2),
('Bursa',2),
('London',3)

