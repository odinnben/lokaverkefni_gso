create database 0412002940_lokaverkefni;
use  0412002940_lokaverkefni;

create table Membership(
mem_num int(20),
mem_fname varchar(20),
mem_lname varchar (10),
mem_street varchar (40),
mem_city varchar (20),
mem_state varchar (10),
mem_zip int (10),
mem_balance int(40),
primary key(mem_num)
);

drop table Membership;

create table Rental(
rent_num int(20),
rent_date date,
mem_num_fk int(20),
primary key(rent_num),
foreign key(mem_num_fk) references Membership(mem_num)
);
drop table Rental;

create table detailrental(
rent_num int(20),
vid_num int(20),
detail_face decimal(4,2),
detail_duedate date,
detail_returndate date,
detail_dailylatefee decimal(4,2),
foreign key(rent_num ) references Rental(rent_num),
foreign key(vid_num) references video(vid_num)
);

create table price(
price_code int(20),
price_description varchar(40),
price_rentfee decimal(4,2),
price_dailylatefee decimal(4,2),
primary key(price_code)
);

create table movie(
movie_num int(20),
movie_title varchar(30),
movie_year year,
movie_cost decimal(4,2),
movie_genre varchar(20),
price_code int(20),
foreign key(price_code) references price(price_code),
primary key(movie_num)
);

drop table movie;

create table video(
vid_num int(20),
vid_indate date,
movie_num int(20),
foreign key(movie_num) references movie(movie_num),
primary key(vid_num)
);

drop table video;



insert into Membership
values
	(102,"Tami","Dawson","2632 Takli Circle","Norene","TN",37136,11),
	(103,"Curt","Knight","4025 Cornell Court","Flatgap","KY",41219,6),
	(104,"Jamal","Melendez","788 East 145th Avenue","Quebeck","TN",38579,0),
	(105,"Iva","Mcclain","6045 Musket Ball Circle","Summit","KY",42793,15),
	(106,"Miranda","Parks","4469 Maxwell Place","Germantown","TN",38183,0),
	(107,"Rosario","Elliot","7578 Danner Avenue","Columbia","TN",38402,5),
	(108,"Mattie","Guy","4390 Evergreen Street","Lily","KY",40740,0),
	(109,"Clint","Ochoa","1711 Elm Street","Greeneville","TN",37745,10),
	(110,"Lewis","Rosales","4525 Southwind Circle","Counce","TN",38326,0),
	(111,"Stacy","Mann","2789 East Cook Avenue","Murfreesboro","TN",37132,8),
	(112,"Luis","Trujillo","7267 Melvin Avenue","Heiskell","TN",37754,3),
	(113,"Minnie","Gonzales","6430 Vasili Drive","Williston","TN",38076,0)
;

insert into rental 
values
	(1001,'2009-03-01',103),
	(1002,'2009-03-01',105),
	(1003,'2009-03-02',102),
	(1004,'2009-03-02',110),
	(1005,'2009-03-02',111),
	(1006,'2009-03-02',107),
	(1007,'2009-03-02',104),
	(1008,'2009-03-03',105),
	(1009,'2009-03-03',111)
;

insert into price
values
	(1,"Standard",2,1),
	(2,"New Release",3.5,3),
	(3,"Discount",1.5,1),
	(4,"Weekly Special",1,.5)
;

insert into movie 
values
	(1234,"The Cesar Family Christmas",'2007',39.95,"FAMILY",2),
	(1235,"Smokey Mountain Wildlife",'2004',59.95,"ACTION",1),
	(1236,"Richard Goodhope",'2008',59.95,"DRAMA",2),
	(1237,"Beatnik Fever",'2007',29.95,"COMEDY",2),
	(1238,"Constant Companion",'2008',89.95,"DRAMA",2),
	(1239,"Where Hope Dies",'1998',25.49,"DRAMA",3),
	(1245,"Time to Burn",'2005',45.49,"ACTION",1),
	(1246,"What He Doesn't Know",'2006',58.29,"COMEDY",1)
;

insert into video 
values
	(54321,"2008-06-18",1234),
	(54324,"2008-06-18",1234),
	(54325,"2008-06-18",1234),
	(34341,"2007-01-22",1235),
	(34342,"2007-01-22",1235),
	(34366,"2009-03-02",1236),
	(34367,"2009-03-02",1236),
	(34368,"2009-03-02",1236),
	(34369,"2009-03-02",1236),
	(44392,"2008-10-21",1237),
	(44397,"2008-10-21",1237),
	(59237,"2009-02-14",1237),
	(61388,"2007-01-25",1239),
	(61353,"2006-01-28",1245),
	(61354,"2006-01-28",1245),
	(61367,"2008-07-30",1246),
	(61369,"2008-07-30",1246)
;

insert into detailrental
values
	(1001,34342,2,'2009-03-04','2009-03-02',1),
	(1001,61353,2,'2009-03-04','2009-03-03',1),
	(1002,59237,3.5,'2009-03-04','2009-03-04',3),
	(1003,54325,3.5,'2009-03-04','2009-03-09',3),
	(1003,61369,2,'2009-03-06','2009-03-09',1),
	(1003,61388,0,'2009-03-06','2009-03-09',1),
	(1004,44392,3.5,'2009-03-05','2009-03-07',3),
	(1004,34367,3.5,'2009-03-05','2009-03-07',3),
	(1004,34341,2,'2009-03-07','2009-03-07',1),
	(1005,34342,2,'2009-03-07','2009-03-05',1),
	(1005,44397,3.5,'2009-03-05','2009-03-05',3),
	(1006,34366,3.5,'2009-03-05','2009-03-04',3),
	(1006,61367,2,'2009-03-07',null,1),
	(1007,34368,3.5,'2009-03-05',null,3),
	(1008,34369,3.5,'2009-03-05','2009-03-05',3),
	(1009,54324,3.5,'2009-03-05',null,3),
	(1001,34366,3.5,'2009-03-04','2009-03-09',3)
;