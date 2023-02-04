/*Task 1
Display the names of the unique launch sites in the space mission*/
SELECT distinct(Launch_Site) FROM spacex;
/*Task 2
Display 5 records where launch sites begin with the string 'CCA'*/
SELECT * FROM spacex WHERE Launch_Site like 'CCA%' LIMIT 5;
/*Task 3
Display the total payload mass carried by boosters launched by NASA (CRS)*/
SELECT SUM(PAYLOAD_MASS__KG_) FROM spacex WHERE Customer='NASA (CRS)';
/*ask 4
Display average payload mass carried by booster version F9 v1.1*/
SELECT AVG(PAYLOAD_MASS__KG_) FROM spacex WHERE Booster_Version='F9 v1.1';
/*Task 5
List the date when the first successful landing outcome in ground pad was acheived.*/
SELECT min(Date) as First_successfull_Landspacex FROM spacex WHERE Landing_Outcome ='Success (ground pad)';
/*Task 6
List the names of the boosters which have success in drone ship and have payload mass greater than 4000 but less than 6000*/
SELECT Booster_Version FROM spacex where Landing_Outcome='Success (drone ship)' AND PAYLOAD_MASS__KG_ between 4000 AND 6000;
/*Task 7
List the total number of successful and failure mission outcomes*/
SELECT distinct(Mission_Outcome),count(Mission_Outcome) FROM spacex GROUP by Mission_Outcome;
/*Task 8
List the names of the booster_versions which have carried the maximum payload mass. Use a subquery*/
SELECT Booster_Version, PAYLOAD_MASS__KG_ FROM spacex WHERE PAYLOAD_MASS__KG_=(SELECT Max(PAYLOAD_MASS__KG_) FROM spacex);
/*Task 9
List the failed landing_outcomes in drone ship, their booster versions, and launch site names for in year 2015*/
SELECT Landing_Outcome,Booster_Version,Launch_Site FROM spacex WHERE Landing_Outcome='Failure (drone ship)' AND DATE like '2015%';
/*Task 10
Rank the count of landing outcomes (such as Failure (drone ship) or Success (ground pad)) between the date 2010-06-04 and 2017-03-20, in descending order*/
SELECT Landing_Outcome,COUNT(Landing_Outcome) FROM spacex where Date BETWEEN '2010-06-04' and '2017-03-20' GROUP BY Landing_Outcome ORDER BY COUNT(Landing_Outcome) DESC;
