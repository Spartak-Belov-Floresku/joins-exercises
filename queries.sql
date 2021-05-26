
--Join the two tables so that every column and record appears, regardless of if there is not an owner_id. Your output should look like this
SELECT * FROM owners o LEFT JOIN vehicles v ON o.id = v.owner_id;

--Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles. The first_name should be ordered in ascending order. Your output should look like this:
SELECT first_name, last_name, COUNT(*) as count FROM owners o JOIN vehicles v ON o.id = v.owner_id GROUP BY o.id ORDER BY count;

--Count the number of cars for each owner and display the average price for each of the cars as integers. 
--Display the owners first_name, last_name, average price and count of vehicles. The first_name should be ordered in descending order. 
--Only display results with more than one vehicle and an average price greater than 10000. Your output should look like this:
SELECT o.first_name, o.last_name, ROUND(AVG(v.price)) as price, COUNT(*) as count FROM owners o JOIN vehicles v ON o.id = v.owner_id GROUP BY o.id HAVING AVG(v.price) > 10000 AND COUNT(*) > 1
ORDER BY o.first_name DESC;

--SQL Zoo #6
SELECT matchid,  player FROM goal WHERE teamid = 'GER';
SELECT id,stadium,team1,team2 FROM game WHERE id = 1012;
SELECT player, teamid, stadium, mdate FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER';
SELECT team1, team2, player FROM game JOIN goal ON (id=matchid) WHERE player LIKE 'Mario%';
SELECT player, teamid, coach, gtime FROM goal JOIN eteam on teamid = id WHERE gtime<=10
SELECT mdate, teamname FROM game JOIN eteam ON team1=eteam.id OR team2=eteam.id WHERE team1 = 'GRE' AND coach = 'Fernando Santos';
SELECT player FROM goal JOIN game ON  id = matchid WHERE stadium = 'National Stadium, Warsaw';
SELECT DISTINCT player FROM game JOIN goal ON matchid = id  WHERE teamid != 'GER' AND team1 = 'GER' OR team2 = 'GER';
SELECT teamname, COUNT(*) FROM eteam JOIN goal ON id=teamid GROUP BY teamname ORDER BY teamname;
SELECT stadium, COUNT(*) FROM game JOIN goal ON id=matchid GROUP BY stadium;
SELECT matchid, mdate, COUNT(*) FROM game JOIN goal ON matchid = id WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid;
SELECT matchid, mdate, COUNT(*) from game JOIN goal ON matchid = id WHERE teamid = 'GER' GROUP BY matchid;
SELECT game.mdate,
       game.team1,
       SUM(CASE WHEN goal.teamid=team1 THEN 1 ELSE 0 end) AS score1,
       game.team2,
       SUM(CASE WHEN goal.teamid=team2 THEN 1 ELSE 0 end) AS score2
FROM game 
JOIN goal ON goal.matchid = game.id
GROUP BY game.mdate, game.team1, game.team2;

--SQL Zoo #7
SELECT id, title FROM movie WHERE yr=1962;
SELECT yr FROM movie WHERE title = 'Citizen Kane';
SELECT id, title, yr FROM movie WHERE title LIKE 'Star Trek%';
SELECT id FROM actor WHERE name =  'Glenn Close';
SELECT id FROM movie WHERE title = 'Casablanca';
SELECT a.name FROM movie m JOIN casting c ON m.id = c.movieid JOIN actor a ON a.id = c.actorid WHERE m.title =  'Casablanca';
SELECT a.name FROM movie m JOIN casting c ON m.id = c.movieid JOIN actor a ON a.id = c.actorid WHERE m.title =  'Alien';
SELECT m.title FROM movie m JOIN casting c ON m.id = c.movieid JOIN actor a ON a.id = c.actorid WHERE a.name = 'Harrison Ford';
SELECT m.title FROM movie m JOIN casting c ON m.id = c.movieid JOIN actor a ON a.id = c.actorid WHERE a.name = 'Harrison Ford' AND c.ord != 1;
SELECT m.title, a.name FROM movie m JOIN casting c ON m.id = c.movieid JOIN actor a ON a.id = c.actorid WHERE c.ord = 1 AND yr = 1962;
SELECT yr,COUNT(title) FROM movie JOIN casting ON movie.id=movieid JOIN actor   ON actorid=actor.id WHERE name='Doris Day' GROUP BY yr HAVING COUNT(title) > 1;
SELECT m.title, a.name FROM movie m JOIN casting c ON m.id = c.movieid AND c.ord = 1 JOIN actor a ON a.id = c.actorid WHERE m.id IN (SELECT m.id FROM movie m JOIN casting c ON m.id = c.movieid JOIN actor a ON a.id = c.actorid WHERE a.name = 'Julie Andrews');
SELECT a.name FROM actor a JOIN casting c ON a.id = c.actorid JOIN movie m ON m.id = c.movieid WHERE c.ord = 1 GROUP BY a.name HAVING COUNT(a.id) >= 15;
SELECT m.title, COUNT(a.id) FROM movie m JOIN casting c ON m.id = c.movieid JOIN actor a ON a.id = c.actorid WHERE m.yr = 1978 GROUP BY m.title ORDER BY COUNT(a.id) DESC;
SELECT a.name FROM actor a JOIN casting c ON c.actorid = a.id WHERE c.movieid IN (SELECT m.id FROM movie m JOIN casting c ON m.id = c.movieid JOIN actor a ON a.id = c.actorid WHERE a.name = 'Art Garfunkel') ORDER BY a.name;