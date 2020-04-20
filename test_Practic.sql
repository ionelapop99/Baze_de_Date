create database DB;
use DB;

create table Costumatie(
cod_c int primary key,
nume varchar(255),
cod_t int foreign key references Tema(cod_t) on delete cascade on update cascade,
cod_p int foreign key references Personaj(cod_p) on delete cascade on update cascade,
)

create table Personaj(
cod_p int primary key,
nume varchar(255),
descriere varchar(255))

create table Tema(
cod_t int primary key,
nume varchar(255),
descriere varchar(255))

create table Grupa(
cod_g int primary key,
nume varchar(255),
)

create table Legatura(
data_c  date,
cod_c int foreign key references Costumatie(cod_c) on delete cascade on update cascade,
cod_g int foreign key references Grupa(cod_g) on delete cascade on update cascade,
primary key(cod_c,cod_g)
)

drop table Legatura;
drop table Costumatie;

insert into Grupa(cod_g,nume) values(1,'grupa mica');
insert into Grupa(cod_g,nume) values(2,'grupa mijlocie');
insert into Grupa(cod_g,nume) values(3,'grupa mare');
insert into Grupa(cod_g,nume) values(4,'grupa pregatitoare');

insert into Tema(cod_t,nume,descriere) values(1,'printese','rochite si costume elegante');
insert into Tema(cod_t,nume,descriere) values(2,'eroi','personaje din desene animate');
insert into Tema(cod_t,nume,descriere) values(3,'personaje disney','apar in filmele walt disney');

insert into Personaj(cod_p,nume,descriere) values(1,'Alba ca Zapada','Printesa din Alba ca zapada si cei 7 pitici');
insert into Personaj(cod_p,nume,descriere) values(2,'Maleficent','Personajul principal din filmul Maleficent revine');
insert into Personaj(cod_p,nume,descriere) values(3,'SpiderMan','omul paianjen');
insert into Personaj(cod_p,nume,descriere) values(4,'BatMan','erou liliac');
insert into Personaj(cod_p,nume,descriere) values(5,'Tinkerbell','caracter Walt Disney');


insert into Costumatie(cod_c,nume,cod_t,cod_p) values(1,'Alba ca Zapada',1,1);
insert into Costumatie(cod_c,nume,cod_t,cod_p) values(2,'Maleficent',1,2);
insert into Costumatie(cod_c,nume,cod_t,cod_p) values(3,'SpiderMan',2,3);
insert into Costumatie(cod_c,nume,cod_t,cod_p) values(4,'BatMan',2,4);
insert into Costumatie(cod_c,nume,cod_t,cod_p) values(5,'Tinkerbell',3,5);


insert into Legatura(data_c,cod_c,cod_g) values('2019-10-21',1,1);
insert into Legatura(data_c,cod_c,cod_g) values('2020-01-21',1,3);
insert into Legatura(data_c,cod_c,cod_g) values('2020-01-21',1,2);
insert into Legatura(data_c,cod_c,cod_g) values('2020-01-21',2,2);
insert into Legatura(data_c,cod_c,cod_g) values('2020-01-21',3,4);
insert into Legatura(data_c,cod_c,cod_g) values('2020-01-21',4,1);
insert into Legatura(data_c,cod_c,cod_g) values('2020-01-21',5,2);

select * from Legatura;
select * from Grupa;
select * from Personaj;
select * from Costumatie;
select * from Tema;

drop function Personaj_nrGrupe
create function Personaj_nrGrupe(@nume Varchar(255)) 
returns int
as
begin 
declare @nr Int=0
select @nr=count(*) From Persoanj p
INNER JOIN Costumatie c ON p.cod_p=c.cod_p
INNER JOIN Legatura l ON c.cod_c=l.cod_c
INNER JOIN Grupa g ON l.cod_g=g.cod_g
wHERE p.nume=@nume and l.date>="2020-01-01" and  l.date<="2020-01-30"
return @nr;
end

go
select * from dbo.Personaj_nrGrupe('Alba ca Zapada');
go
