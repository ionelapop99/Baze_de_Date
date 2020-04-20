
create database lab1

create table Rol(
cod_r int primary key,
denumire varchar(255)
)

create table Echipa(
cod_e int primary key,
nr_membrii int)

create table Proiect(
cod_p int primary key,
tip_aplicatie varchar(255),
nr_echipe int)

create table Programator(
cnp varchar(255) primary key,
nume varchar(255),
cod_e int foreign key references Echipa(cod_e) on delete set null on update cascade,
cod_r int foreign key references Rol(cod_r) on delete set null on update cascade,
varsta int
)
create table Interval(
id int primary key,
data_in  date,
data_sf date,
cnp varchar(255) foreign key references Programator(cnp) on delete cascade on update cascade,
cod_p int foreign key references Proiect(cod_p) on delete cascade on update cascade
)


