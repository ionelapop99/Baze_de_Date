/*1.scrieti cate o procedura stocata care introduce date intr-un tabel, pentru cel putin trei tabele,
 inclusiv un tabel cu o cheie primara compusa*/
create function validare_cnp(@cnp Varchar(50)) 
returns int
as
begin 
declare @nr Int=0
select @nr=count(*) from Programator where @cnp=cnp 
return @nr;
end

go
create procedure adauga_Programator(@cnp Varchar(50),@nume Varchar(50),@cod_e INT,@cod_r int,@Varsta int)
as
begin
if(dbo.validare_cnp(@cnp)=0)
	begin
		Insert into Programator values (@cnp,@nume,@cod_e,@cod_r,@Varsta)
		Print ('Adaugare cu succes')
	end;
else
	begin
		print('Acest Id mai exista!')

	end;
end;
go
exec adauga_Programator '1280689567852','Matei',3,1,18;
exec adauga_Programator '1280689567811','Loghin',2,5,30;
go
/*-------------------------------------------------------------------------*/
create function validare_codR(@cod_r int)
returns int
as
begin 
declare @nr Int=0
select @nr=count(*) from Rol where @cod_r=cod_r 
return @nr;
end

create procedure adauga_Rol(@cod_r INT,@denumire varchar(50))
as 
begin
declare @nr int=0
Select @nr=count(*) from Rol where cod_r=@cod_r
if(dbo.validare_codR(@cod_r)=0)
begin
Insert into Rol(cod_r,denumire) values(@cod_r,@denumire)
Print('Adaugare cu succes')
end
else
Print('Aceast Rol mai exista')
end;
go
exec adauga_Rol 1,'tester';
exec adauga_Rol 6,'leader';
exec adauga_Rol 7,'sef';
exec adauga_Rol 8,'designer'
exec adauga_Rol 9,'Photoshop-Specialit'
go

/*--------------------------------------------------------------------------*/
drop function  validare_cnp_codP
drop procedure  adauga_Programator
/*---------------------------------------------------------------------------*/

/*creare cheie primara compusa*/
drop table Interval;
create table Interval(
data_in  date,
data_sf date,
cnp varchar(255) foreign key references Programator(cnp) on delete cascade on update cascade,
cod_p int foreign key references Proiect(cod_p) on delete cascade on update cascade
primary key(cnp,cod_p)
)

/*inserare date in tabel*/
insert into Interval(data_in,data_sf,cnp,cod_p) values('2019-10-20','2020-04-20','2311099567865',1)
insert into Interval(data_in,data_sf,cnp,cod_p) values('2019-10-21','2020-04-21','1301099569186',1)

insert into Interval(data_in,data_sf,cnp,cod_p) values('2019-11-22','2020-06-22','1301099569258',2)
insert into Interval(data_in,data_sf,cnp,cod_p) values('2019-11-23','2020-06-23','2211199597863',2)

insert into Interval(data_in,data_sf,cnp,cod_p) values('2019-12-24','2020-07-24','1280998598965',3)
insert into Interval(data_in,data_sf,cnp,cod_p) values('2019-12-25','2020-07-25','1280689567852',3)

/*functie validare*/

/*functii de validare pentru ambele*/
create function validare_cnp_codP(@cnp Varchar(255),@cod_p int)
returns int
as
begin 
declare @nr Int=0
select @nr=count(*) from Interval where @cod_p=cod_p  and @cnp=cnp
return @nr;
end
go

create procedure adauga_Interval(@data_in Date,@data_sf Date,@cnp varchar(255),@cod_p INT)
as 
begin
if(dbo.validare_cnp_codP(@cnp,@cod_p)=0)
begin
Insert into Interval(data_in,data_sf,cnp,cod_p) values( @data_in ,@data_sf ,@cnp ,@cod_p)
Print('Aceast Interval a fost adaugat cu succes')
end
else
Print('Aceast Interval mai exista')
end;
go
exec adauga_Interval '2019-12-25','2020-07-25','1280689567852',3
exec adauga_Interval '2019-12-26','2020-07-26','1280998598215',1
go

/*2. create un view care combina date care provin din doua sau trei tabele; */
go
create view vw_ProgramatorRol
as
select p.nume,p.cod_r,r.denumire from Programator p INNER JOIN Rol r on p.cod_r=r.cod_r

select * from vw_ProgramatorRol

/* 3  implementati, pentru un tabel la alegere, un trigger pentru operatia de adaugare si unul pentru
 cea de stergere;  */
 go
 create trigger La_adaugare
 on Programator
 for insert
 as begin
 Print 'Data la care a avut loc Inserarea : '+ Cast(getdate() as Varchar(30))+'  In baza de date Programator'
 end;

 INSERT INTO Programator (cnp, nume, cod_e, cod_r,varsta)
VALUES (1280689567889, 'Stefan', 3, 2,25);
 go

 create trigger La_stergere
 on Programator
 for delete
 as begin
  Print 'Data la care a avut loc Stergerea : '+ Cast(getdate() as Varchar(30))+'  In baza de date Programator'
 end;
 delete Programator where nume='Loghin';

 select * from Programator
