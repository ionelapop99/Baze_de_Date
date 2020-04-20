use lab1;
insert into Rol(cod_r,denumire) values (1,'tester')
insert into Rol(cod_r,denumire) values (2,'back-end developer')
insert into Rol(cod_r,denumire) values (3,'project manager')
insert into Rol(cod_r,denumire) values (4,'front-end developer')
insert into Rol(cod_r,denumire) values (5,'full stack developer')

insert into Echipa(cod_e,nr_membrii) values (1,5)
insert into Echipa(cod_e,nr_membrii) values (2,2)
insert into Echipa(cod_e,nr_membrii) values (3,3)

insert into Proiect(cod_p,tip_aplicatie,nr_echipe) values(1,'site web',2)
insert into Proiect(cod_p,tip_aplicatie,nr_echipe) values(2,'aplicatie desktop',1)
insert into Proiect(cod_p,tip_aplicatie,nr_echipe) values(3,'aplicatie mobila',3)

insert into Programator(cnp,nume,cod_e,cod_r) values('2311099567865','Ionela',1,4,20)
insert into Programator(cnp,nume,cod_e,cod_r) values('1301099569186','Paul',1,2)
insert into Programator(cnp,nume,cod_e,cod_r) values('2211199597986','Maria',1,1)
insert into Programator(cnp,nume,cod_e,cod_r) values('1280998598215','George',1,3)
insert into Programator(cnp,nume,cod_e,cod_r) values('1280689567856','Catalin',1,2)

insert into Programator(cnp,nume,cod_e,cod_r) values('2311099567896','Florina',3,3)
insert into Programator(cnp,nume,cod_e,cod_r) values('1301099569258','Raul',2,5)
insert into Programator(cnp,nume,cod_e,cod_r) values('2211199597863','Dorina',2,1)
insert into Programator(cnp,nume,cod_e,cod_r) values('1280998598965','Denis',3,5)
insert into Programator(cnp,nume,cod_e,cod_r) values('1280689567852','Dorin',3,1)

update Programator set varsta=20 where nume IN ('Ionela','George','Maria')
update Programator set varsta=25 where nume IN ('Paul','Raul','Catalin')
update Programator set varsta=19 where nume IN ('Florina','Denis')
update Programator set varsta=18 where nume IN ('Matei','Dorin','Dorina')


insert into Interval(id,data_in,data_sf,cnp,cod_p) values(1,'2019-10-20','2020-04-20','2311099567865',1)
insert into Interval(id,data_in,data_sf,cnp,cod_p) values(2,'2019-10-20','2020-04-20','1301099569186',1)

insert into Interval(id,data_in,data_sf,cnp,cod_p) values(3,'2019-11-20','2020-06-20','1301099569258',2)
insert into Interval(id,data_in,data_sf,cnp,cod_p) values(4,'2019-11-20','2020-06-20','2211199597863',2)

insert into Interval(id,data_in,data_sf,cnp,cod_p) values(5,'2019-12-20','2020-07-20','1280998598965',3)
insert into Interval(id,data_in,data_sf,cnp,cod_p) values(6,'2019-12-20','2020-07-20','1280689567852',3)

update Programator set nume='Matei' where nume='Dorin' or nume='Edi'
update Interval set data_sf='2020-08-20' where data_sf>='2020-06-21' and data_in>='2019-12-20'
delete from Rol where denumire is null

select * from Rol
select * from Echipa
select * from Programator
select * from Interval
select * from Proiect

/*delete from Proiect where cod_p=1*/

update Programator set nume='Matei' where nume='Catalin'