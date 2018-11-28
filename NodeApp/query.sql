(select * from Person w inner join Friends p on p.login = w.login where p.login = login) UNION (select distinct * from Persons q where q.login in (select f.friend from Family m inner join Friends f on m.member = f.login where m.login = login)) minus (select * where Persons L where l.login = login);

(select * from Person w inner join Friends p on p.login = w.login where p.login ='awest@gmail.com') UNION (select distinct * from Person q where q.login in (select f.friend from Family m inner join Friends f on m.member = f.login where m.login = 'awest@gmail.com')) minus (select * from Person l where l.login = 'awest@gmail.com');

select p.friend from Friends p where p.login ='awest@gmail.com' UNION select distinct q.login from Person q where q.login in (select f.friend from Family m inner join Friends f on m.member = f.login where m.login = 'awest@gmail.com') and q.login <> 'awest@gmail.com';

'select f.member,p.name,f.role,p.sex,p.relationshipStatus,p.birthyear from Family f and Person p where f.login =\''+$scope.login+'\' and f.member = p.login;';