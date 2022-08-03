CREATE DATABASE MINIPROJECT;
USE MINIPROJECT;

DROP TABLE `ICC TEST BATTING FIGURES`;

## Q1 . IMPORT THE CSV FILE TO A TABLE IN THE DATABASE
## IT IS BEEN IMPORTED

## Q2. REMOVE THE COLUMN 'PLAYER PROFILE' FROM THE TABLE
SELECT * FROM `ICC TEST BATTING FIGURES`;
ALTER TABLE `ICC TEST BATTING FIGURES` DROP `Player Profile`;

SELECT * FROM `ICC TEST BATTING FIGURES`;

## Q3.Extract the country name and player names from the given data and store it in seperate columns for further usage
SELECT * FROM `ICC TEST BATTING FIGURES`;

ALTER TABLE `ICC TEST BATTING FIGURES`ADD COLUMN COUNTRY_NAME VARCHAR(10);

UPDATE`ICC TEST BATTING FIGURES`
SET COUNTRY_NAME= SUBSTRING_INDEX(SUBSTRING_INDEX(PLAYER,')',1),'(',-1);

UPDATE  `ICC TEST BATTING FIGURES`
SET PLAYER = SUBSTRING_INDEX(PLAYER, '(',1);

SELECT * FROM `ICC TEST BATTING FIGURES`;




## Q4 From the column 'Span' extract the start_year and end_year and store them in seperate columns for further usage.

ALTER TABLE `ICC TEST BATTING FIGURES`ADD COLUMN START_YEAR int;
ALTER TABLE `ICC TEST BATTING FIGURES`ADD COLUMN END_YEAR int;

UPDATE`ICC TEST BATTING FIGURES`
SET START_YEAR= SUBSTRING_INDEX(SPAN,'-',1);

UPDATE`ICC TEST BATTING FIGURES`
SET END_YEAR= SUBSTRING_INDEX(SPAN,'-',-1);

SELECT * FROM `ICC TEST BATTING FIGURES`;

## Q5.The column 'HS' has the highest score scored by the player so far in any given match. 
##The column also has details if the player had completed the match in a NOT OUT status. 
##Extract the data and store the highest runs and the NOT OUT status in different columns.

ALTER TABLE `ICC TEST BATTING FIGURES` ADD COLUMN HIGHEST_NOTOUT VARCHAR(5);
ALTER TABLE `ICC TEST BATTING FIGURES` ADD COLUMN HIGHEST_RUN VARCHAR(5);

UPDATE `ICC TEST BATTING FIGURES`
SET HIGHEST_NOTOUT = (SELECT HS  WHERE HS LIKE '%*');

UPDATE `ICC TEST BATTING FIGURES`
SET HIGHEST_RUN = (SELECT HS  WHERE HS NOT  LIKE '%*');

SELECT * FROM `ICC TEST BATTING FIGURES`;

## Q6.	Using the data given, considering the players who were active in the year of 2019, 
##create a set of batting order of best 6 players using the selection criteria of 
##those who have a good average score across all matches for India.

SELECT PLAYER,AVG,COUNTRY_NAME
FROM `ICC TEST BATTING FIGURES`
WHERE (START_YEAR =2019 OR END_YEAR=2019) AND COUNTRY_NAME = 'INDIA'
ORDER BY AVG DESC LIMIT 6;

SELECT * FROM `ICC TEST BATTING FIGURES`;

## Q7.	Using the data given, considering the players who were active in the year of 2019, 
#create a set of batting order of best 6 players using the selection criteria of 
#those who have highest number of 100s across all matches for India

SELECT PLAYER,AVG,COUNTRY_NAME,`100`
FROM `ICC TEST BATTING FIGURES`
WHERE (START_YEAR =2019 OR END_YEAR=2019) AND COUNTRY_NAME = 'INDIA'
ORDER BY `100` DESC LIMIT 6;

SELECT * FROM `ICC TEST BATTING FIGURES`;

## Q8.	Using the data given, considering the players who were active in the year of 2019,
# create a set of batting order of best 6 players using 2 selection criterias of your own for India.

SELECT PLAYER,AVG,COUNTRY_NAME,`100`,MAT,INN
FROM `ICC TEST BATTING FIGURES`
WHERE (START_YEAR =2019 OR END_YEAR=2019) AND COUNTRY_NAME = 'INDIA' AND AVG>39 AND INN>100;

SELECT * FROM `ICC TEST BATTING FIGURES`;

## Q9.	Create a View named ‘Batting_Order_GoodAvgScorers_SA’ using the data given, 
##considering the players who were active in the year of 2019, create a set of batting order of best 6 players 
##using the selection criteria of those who have a good average score across all matches for South Africa.

create view Batting_Order_GoodAvgScorers_SA as 

SELECT PLAYER,AVG,COUNTRY_NAME
FROM `ICC TEST BATTING FIGURES`
WHERE (START_YEAR =2019 OR END_YEAR=2019) AND COUNTRY_NAME = 'SA'
ORDER BY AVG DESC LIMIT 6;


## Q10. 10.	Create a View named ‘Batting_Order_HighestCenturyScorers_SA’ Using the data given, 
#considering the players who were active in the year of 2019, create a set of batting order of best 6 players using the 
#selection criteria of those who have highest number of 100s across all matches for South Africa

create view Batting_Order_HIGHESTCENTURYScorers_SA as

SELECT PLAYER,AVG,COUNTRY_NAME,`100`
FROM `ICC TEST BATTING FIGURES`
WHERE (START_YEAR =2019 OR END_YEAR=2019) AND COUNTRY_NAME = 'SA'
ORDER BY `100` DESC LIMIT 6;