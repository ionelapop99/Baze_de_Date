/*pb1
Sa se determine programatorii care sunt in primele 3 echipe si care nu au rolurile 2,3,4,folosind EXCEPT*/
select * from Programator where cod_e<=3
EXCEPT
select * from Programator where cod_r>1 and cod_r<=4

/*pb2
Sa se determine programatori care au tipul aplictiei 'aplicatie desktop'*/
select * From Programator prog 
INNER JOIN Interval i ON prog.cnp=i.cnp
INNER JOIN Proiect pro ON i.cod_p=pro.cod_p
WHERE pro.tip_aplicatie='aplicatie desktop'

/*sa se afiseze cnp-ul numele si denumirea rolului front end developerilor*/
select p.cnp,p.nume,r.denumire from Echipa e
INNER JOIN Programator p ON p.cod_e=e.cod_e
INNER JOIN Rol r ON r.cod_r=p.cod_r where r.denumire='front-end developer'

/*
sa se afiseze numele distincte ale programatorilor indiferent daca sunt sau nu intr-o echipa*/
select DISTINCT p.nume,e.cod_e from Echipa e RIGHT JOIN Programator p ON p.cod_e=e.cod_e 

/*pb3
sa se determine codul de echipa si numarul programatorilor cu codul de echipa >=2*/
select cod_e ,count(cnp) AS [nr Prog] from Programator GROUP BY cod_e HAVING cod_e>=2

/*sa se afiseze codul de proiect, nr programatorilor si varsta minima a programatorilor grupate dupa codul de proiect*/
select p.cod_p,count(prog.cnp) as [nr prog],min(prog.varsta) AS [Varsta minima] from Proiect p INNER JOIN Interval i ON p.cod_p=i.cod_p 
INNER JOIN Programator prog ON i.cnp=prog.cnp
GROUP BY p.cod_p

/*sa se afiseze codul de proiect, nr programatorilor si varsta maxima a programatorilor grupate dupa codul de proiect*/
select p.cod_p,count(prog.cnp) as [nr prog],max(prog.varsta) AS [Varsta maxima] from Proiect p INNER JOIN Interval i ON p.cod_p=i.cod_p 
INNER JOIN Programator prog ON i.cnp=prog.cnp
GROUP BY p.cod_p

/*sa se afiseze codul de proiect, nr programatorilor si varsta medie a programatorilor grupate dupa codul de proiect*/
select p.cod_p,count(prog.cnp) as [nr prog],avg(prog.varsta) AS [Varsta medie] from Proiect p INNER JOIN Interval i ON p.cod_p=i.cod_p 
INNER JOIN Programator prog ON i.cnp=prog.cnp
GROUP BY p.cod_p

/*sa se determine numele distincte ale programatorilor care au codul rolului <4,folosind interogari imbricate si Exists*/
SELECT  DISTINCT nume
FROM Programator
WHERE EXISTS (SELECT * FROM Rol WHERE Programator.cod_r= Rol.cod_r and cod_r<4 )

/*sa se afiseze datele programatorilor cu varsta intre 20 si 25 de ani inclusiv folosind interogari imbricate si IN*/
SELECT * FROM Programator
WHERE varsta IN (SELECT varsta FROM Programator where varsta>=20 and varsta<=25)

/*sa se determine datele despre programatorii care au codul de echipa in intervalul [2,3]*/
SELECT * FROM Programator
WHERE cod_e IN (SELECT cod_e FROM Echipa where Echipa.cod_e=Programator.cod_e and cod_e>=2 and cod_e<=3)

select*from Programator
