WITH CheckAcctAS ( SELECT *
FROM Account
WHERE type=‘checking’
)
SELECT C.Number,C.Owner FROM CheckAcct C JOIN Deposit D
ON C.Number=D.AcctNo
WHERE C.Balance > 1000 AND D.Amount>1000
1.SELECT A.first_name, A.last_name FROM actors A WHERE ROWNUM <= 5;
3. select m.name, r.role from movies m, roles r where r.actor_id in (select a.id from actors a where a.first_name = 'Elizabeth (I)' and a.last_name = 'Taylor') and  m.id = r.movie_id;
4. 250: select count(distinct m.genre) as num from movies_genres m where m.genre like 'M%';
5. 19: select movies_genres.genre as genre, min(movies.rank) as min, max(movies.rank) as max from movies_genres inner join movies on movies.id = movies_genres.movie_id group by movies_genres.genre;  
6. with GroupedRelation as (select r.actor_id,count(distinct r.role) as count from roles r group by r.actor_id)select max(grel.count) as maxNum from GroupedRelation grel; 
7. select a.last_name, count(a.last_name) as num from actors a where a.last_name <> ' ' group by a.last_name having count(a.last_name) > 50;
8. select distinct d.genre from director_genre d where d.genre not in (select distinct genre from movies_genres) union select distinct m.genre from movies_genres m where m.genre not in (select distinct genre from director_genre);
9. select d1.id,d2.id from directors d1, directors d2 where (d1.last_name = d2.last_name) and (d1.id < d2.id);
10. with X as (select md.director_id as director_id, di.first_name, di.last_name, m.name as name, m.rank as rank, mg.genre as genre from movies_directors md inner join movies m on md.movie_id = m.id inner join movies_genres mg on mg.movie_id = md.movie_id inner join directors di on md.director_id = di.id), Y as (select t.genre as genre, max(rank) as topmovie from movies_genres t inner join movies m on t.movie_id = m.id group by t.genre), Z as (select director_id as director_id, first_name, last_name, rank as topmovie from X inner join Y on X.genre = Y.genre and X.rank = Y.topmovie) select director_id as id,first_name,last_name from Z group by director_id,first_name,last_name having count(director_id) >= 2;
11. select md.director_id from movies_directors md where not exists(select * from movies where year not in (select distinct m.year from movies_directors mdi inner join movies m on mdi.movie_id = m.id where mdi.director_id = md.director_id));



create table Person(
login varchar(255),
name varchar(255),
sex varchar(7),
relationshipStatus varchar(12),
birthyear int,
PRIMARY KEY (login)
check (sex IN ('male', 'female') and relationshipStatus IN ('single','married','divorced','relationship'))
);

create table Family(login varchar(255),member varchar(255),role varchar(12),PRIMARY KEY (login,member),FOREIGN KEY (login) references Person(login),FOREIGN KEY (member) references Person(login),check (role IN ('mother','father','son','daughter','aunt','uncle','cousin','brother','sister'))); 


INSERT INTO Friends VALUES('awest@gmail.com', 'jen.westad@gmail.com');INSERT INTO Person VALUES('jen.westad@gmail.com', 'Jenny Westad', 'female', 'single', 1992);INSERT INTO Person VALUES('lizashton@yahoo.com', 'Elizabeth Ashton' , 'female', 'married', 1968);INSERT INTO Person VALUES('jashton@seas.upenn.edu', 'John Ashton', 'male', 'single', 1990);INSERT INTO Person VALUES('mbeck@nova.edu', 'Meredith Beckner', 'female', 'single', 1989);INSERT INTO Person VALUES('megbeckner@jmu.edu', 'Meghan Beckner', 'female', 'single', 1990);INSERT INTO Person VALUES('mellbeckner@yahoo.com', 'Melanie Beckner', 'female', 'single', 1997);INSERT INTO Person VALUES('susan.beckner@gmail.com', 'Susan Beckner', 'female', 'married', 1961);INSERT INTO Person VALUES('scottbeckner@gmail.com', 'Scott Beckner', 'male', 'married', 1960);INSERT INTO Person VALUES('hallieballie@hotmail.com', 'Hallie Bail', 'female', 'single', 1997);INSERT INTO Person VALUES('surferdude99@yahoo.co.uk', 'Ryan Mckaskall', 'male', 'single', 1999);INSERT INTO Person VALUES('boser@seas.upenn.edu' , 'Richard Boser' , 'male' , 'single' , 1991);INSERT INTO Person VALUES( 'hlc209@temple.edu' , 'Hannah Cochran' , 'female' , 'relationship' , 1994);INSERT INTO Person VALUES( 'wsf305@drexel.edu' , 'West Finelli' , 'male' , 'single' , 1983);INSERT INTO Person VALUES('dan.finelli@yahoo.com' , 'Daniel Finelli' , 'male' , 'divorced' , 1954); INSERT INTO Person VALUES( 'lyd.jasp@gmail.com' , 'Lydia Jasper' , 'female' , 'single' , 1991);INSERT INTO Person VALUES('ka.mazejy@yahoo.com' , 'Kristin Mazejy' , 'female' , 'single' , 1987);INSERT INTO Person VALUES('luken@temple.edu' , 'Luke Newton' , 'male' , 'single' , 1995);INSERT INTO Person VALUES('richterder@sas.upenn.edu' , 'Derek Richter' , 'male' , 'single' , 1988);INSERT INTO Person VALUES('mupton@wharton.upenn.edu' , 'Marcus Upton' , 'male' , 'relationship' , 1990);INSERT INTO Person VALUES( 'natvul@gmail.com' , 'Natalie Vulcan' , 'female' , 'relationship' , 1995);INSERT INTO Person VALUES('westadj@sas.upenn.edu' , ' Josh Westad' , 'male' , 'single' , 1987);INSERT INTO Person VALUES('arnold.westad@gmail.com' , 'Arnold Westad' , 'male' , 'married' , 1958);
INSERT INTO Family VALUES('awest@gmail.com', 'arnold.westad@gmail.com' , 'father');INSERT INTO Family VALUES('mbeck@nova.edu', 'scottbeckner@gmail.com', 'father');INSERT INTO Family VALUES('wsf305@drexel.edu' , 'dan.finelli@yahoo.com' , 'father');INSERT INTO Family VALUES('jen.westad@gmail.com', 'awest@gmail.com', 'brother');INSERT INTO Family VALUES( 'jen.westad@gmail.com', 'westadj@sas.upenn.edu' , 'brother');INSERT INTO Family VALUES( 'mbeck@nova.edu', 'megbeckner@jmu.edu', 'sister');INSERT INTO Family VALUES( 'mbeck@nova.edu', 'mellbeckner@yahoo.com', 'sister');INSERT INTO Family VALUES('awest@gmail.com','jen.westad@gmail.com', 'sister');INSERT INTO Family VALUES('dan.finelli@yahoo.com' , 'wsf305@drexel.edu' , 'son');INSERT INTO Family VALUES('lizashton@yahoo.com' , 'jashton@seas.upenn.edu', 'son');INSERT INTO Family VALUES('jashton@seas.upenn.edu', 'lizashton@yahoo.com', 'mother');INSERT INTO Family VALUES('mbeck@nova.edu', 'susan.beckner@gmail.com', 'mother');INSERT INTO Family VALUES('scottbeckner@gmail.com','mbeck@nova.edu', 'daughter');INSERT INTO Family VALUES('hallieballie@hotmail.com' , 'surferdude99@yahoo.co.uk', 'cousin');INSERT INTO Family VALUES('lyd.jasp@gmail.com' , 'mbeck@nova.edu' , 'cousin');INSERT INTO Family VALUES('mbeck@nova.edu' , 'lyd.jasp@gmail.com' , 'cousin');INSERT INTO Family VALUES(  'lyd.jasp@gmail.com' , 'megbeckner@jmu.edu' , 'cousin');INSERT INTO Family VALUES( 'megbeckner@jmu.edu' , 'lyd.jasp@gmail.com' , 'cousin');INSERT INTO Family VALUES('natvul@gmail.com' , 'mupton@wharton.upenn.edu' , 'cousin');

create table Friends(login varchar(255),friend varchar(255),PRIMARY KEY (login,friend),FOREIGN KEY (login) references Person(login),FOREIGN KEY(friend) references Person(login));
INSERT INTO Friends VALUES('awest@gmail.com', 'jen.westad@gmail.com');INSERT INTO Friends VALUES('jen.westad@gmail.com', 'awest@gmail.com');INSERT INTO Friends VALUES('lizashton@yahoo.com', 'jashton@seas.upenn.edu');INSERT INTO Friends VALUES('jashton@seas.upenn.edu' , 'lizashton@yahoo.com');INSERT INTO Friends VALUES('awest@gmail.com', 'mbeck@nova.edu');INSERT INTO Friends VALUES('mbeck@nova.edu', 'awest@gmail.com');INSERT INTO Friends VALUES('surferdude99@yahoo.co.uk', 'hallieballie@hotmail.com');INSERT INTO Friends VALUES('hallieballie@hotmail.com' , 'surferdude99@yahoo.co.uk');INSERT INTO Friends VALUES('hlc209@temple.edu' , 'mellbeckner@yahoo.com');INSERT INTO Friends VALUES('mellbeckner@yahoo.com' , 'hlc209@temple.edu' );INSERT INTO Friends VALUES('hlc209@temple.edu' , 'luken@temple.edu');INSERT INTO Friends VALUES('luken@temple.edu' , 'hlc209@temple.edu' );INSERT INTO Friends VALUES('luken@temple.edu' , 'boser@seas.upenn.edu');INSERT INTO Friends VALUES('boser@seas.upenn.edu' , 'luken@temple.edu' );INSERT INTO Friends VALUES('natvul@gmail.com' , 'mupton@wharton.upenn.edu');INSERT INTO Friends VALUES('mupton@wharton.upenn.edu' , 'natvul@gmail.com');INSERT INTO Friends VALUES('natvul@gmail.com' , 'jashton@seas.upenn.edu');INSERT INTO Friends VALUES('jashton@seas.upenn.edu' , 'natvul@gmail.com' );INSERT INTO Friends VALUES('richterder@sas.upenn.edu' , 'awest@gmail.com');INSERT INTO Friends VALUES('awest@gmail.com' , 'richterder@sas.upenn.edu');INSERT INTO Friends VALUES('richterder@sas.upenn.edu' , 'ka.mazejy@yahoo.com' );INSERT INTO Friends VALUES('ka.mazejy@yahoo.com' , 'richterder@sas.upenn.edu');INSERT INTO Friends VALUES('wsf305@drexel.edu' , 'richterder@sas.upenn.edu');INSERT INTO Friends VALUES( 'richterder@sas.upenn.edu', 'wsf305@drexel.edu' );INSERT INTO Friends VALUES( 'richterder@sas.upenn.edu' , 'hlc209@temple.edu' );INSERT INTO Friends VALUES( 'hlc209@temple.edu' , 'richterder@sas.upenn.edu');INSERT INTO Friends VALUES( 'lyd.jasp@gmail.com' , 'natvul@gmail.com');INSERT INTO Friends VALUES(  'mbeck@nova.edu' , 'lyd.jasp@gmail.com');INSERT INTO Friends VALUES(  'lyd.jasp@gmail.com' , 'mbeck@nova.edu');INSERT INTO Friends VALUES(  'megbeckner@jmu.edu' , 'lyd.jasp@gmail.com');INSERT INTO Friends VALUES(  'lyd.jasp@gmail.com' , 'megbeckner@jmu.edu');INSERT INTO Friends VALUES( 'natvul@gmail.com' , 'lyd.jasp@gmail.com');

Part B:

12. DDL views
13. The order should be Persons and followed by other tables. Since there is a referencing of values;
14. select distinct f.login from Family f where (f.role IN ('brother', 'sister') and f.login not in (select g.member from Family g where g.login = f.member));
15. (select f0.login , f0.friend, '0' as distance from Friends f0 where f0.login < f0.friend)  union (select f1.login, f2.friend, '1' as distance from Friends f1 inner join Friends f2 on f1.friend = f2.login where f1.login <> f2.friend and f1.login < f2.friend);
16. create table temp (select f1.login, f2.friend, '1' as distance from Friends f1 inner join Friends f2 on f1.friend = f2.login where f1.login <> f2.friend and f1.login < f2.friend); 
select f0.login, f2.friend , '2' as distance from Friends f0 inner join Friends f1 on f0.friend = f1.login inner join Friends f2 on f1.friend = f2.login where f0.login <> f1.friend and f0.login < f1.friend and f0.login <> f2.friend and f0.login < f2.friend;

select distinct f0.login, t.friend, '2' as distance  from Friends f0 inner join temp t on f0.friend = t.login where f0.login <> t.friend and f0.login < t.friend order by f0.login;

  Friends f0 inner join temp t

  temp t inner join Friends f0

INSERT INTO Friends VALUES('awest@gmail.com', 'jen.westad@gmail.com');
INSERT INTO Friends VALUES('jen.westad@gmail.com', 'awest@gmail.com');
INSERT INTO Friends VALUES('lizashton@yahoo.com', 'jashton@seas.upenn.edu');
INSERT INTO Friends VALUES('jashton@seas.upenn.edu' , 'lizashton@yahoo.com');
INSERT INTO Friends VALUES('awest@gmail.com', 'mbeck@nova.edu');
INSERT INTO Friends VALUES('mbeck@nova.edu', 'awest@gmail.com');
INSERT INTO Friends VALUES('surferdude99@yahoo.co.uk', 'hallieballie@hotmail.com');
INSERT INTO Friends VALUES('hallieballie@hotmail.com' , 'surferdude99@yahoo.co.uk');
INSERT INTO Friends VALUES('hlc209@temple.edu' , 'mellbeckner@yahoo.com');
INSERT INTO Friends VALUES('mellbeckner@yahoo.com' , 'hlc209@temple.edu' );
INSERT INTO Friends VALUES('hlc209@temple.edu' , 'luken@temple.edu');
INSERT INTO Friends VALUES('luken@temple.edu' , 'hlc209@temple.edu' );
INSERT INTO Friends VALUES('luken@temple.edu' , 'boser@seas.upenn.edu');
INSERT INTO Friends VALUES('boser@seas.upenn.edu' , 'luken@temple.edu' );
INSERT INTO Friends VALUES('natvul@gmail.com' , 'mupton@wharton.upenn.edu');
INSERT INTO Friends VALUES('mupton@wharton.upenn.edu' , 'natvul@gmail.com');
INSERT INTO Friends VALUES('natvul@gmail.com' , 'jashton@seas.upenn.edu');
INSERT INTO Friends VALUES('jashton@seas.upenn.edu' , 'natvul@gmail.com' );
INSERT INTO Friends VALUES('richterder@sas.upenn.edu' , 'awest@gmail.com');
INSERT INTO Friends VALUES('awest@gmail.com' , 'richterder@sas.upenn.edu');
INSERT INTO Friends VALUES('richterder@sas.upenn.edu' , 'ka.mazejy@yahoo.com' );
INSERT INTO Friends VALUES('ka.mazejy@yahoo.com' , 'richterder@sas.upenn.edu');
INSERT INTO Friends VALUES('wsf305@drexel.edu' , 'richterder@sas.upenn.edu');
INSERT INTO Friends VALUES( 'richterder@sas.upenn.edu', 'wsf305@drexel.edu' );
INSERT INTO Friends VALUES( 'richterder@sas.upenn.edu' , 'hlc209@temple.edu' );
INSERT INTO Friends VALUES( 'hlc209@temple.edu' , 'richterder@sas.upenn.edu');
INSERT INTO Friends VALUES( 'lyd.jasp@gmail.com' , 'natvul@gmail.com');
INSERT INTO Friends VALUES(  'mbeck@nova.edu' , 'lyd.jasp@gmail.com');
INSERT INTO Friends VALUES(  'lyd.jasp@gmail.com' , 'mbeck@nova.edu');
INSERT INTO Friends VALUES(  'megbeckner@jmu.edu' , 'lyd.jasp@gmail.com');
INSERT INTO Friends VALUES(  'lyd.jasp@gmail.com' , 'megbeckner@jmu.edu');
INSERT INTO Friends VALUES( 'natvul@gmail.com' , 'lyd.jasp@gmail.com');









