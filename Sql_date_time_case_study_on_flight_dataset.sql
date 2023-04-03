SELECT * FROM flight.flights;
--  ----------------------------------Find the month with most number of flights----------------------------------
SELECT MONTHNAME(Date_of_Journey),COUNT(*)
FROM flights
GROUP BY MONTHNAME(Date_of_Journey)
ORDER BY COUNT(*) DESC LIMIT 1;

-- -----------------------------------------Which week day has most costly flights-----------------------------------
SELECT DAYNAME(Date_of_Journey),AVG(Price) FROM flights
GROUP BY DAYNAME(Date_of_Journey)
ORDER BY AVG(Price) DESC LIMIT 1;

--  ----------------------------------------Find number of indigo flights every month---------------------------------
SELECT MONTHNAME(Date_of_Journey),COUNT(*) FROM flights
WHERE  Airline = 'IndiGo'
GROUP BY MONTHNAME(Date_of_Journey);

-- ---------------------Find list of all flights that depart between 10AM and 2PM from Delhi to  Banglore---------------
--
SELECT * FROM flights WHERE Source='Banglore' AND Destination = 'Delhi'
AND Dep_Time >= '10:00:00' AND Dep_Time <= '14:00:00';

-- Find the number of flights departing on weekends from Bangalore
SELECT COUNT(*) FROM flights
WHERE Source='Banglore' 
AND DAYNAME(Date_of_Journey) IN ('Saturday','sunday');

-- --------------------Calculate the arrival time for all flights by adding the duration to the departure time.------------
-- 
ALTER TABLE flights ADD COLUMN departure DATETIME;

UPDATE flights SET departure = STR_TO_DATE(CONCAT(Date_of_Journey,' ',Dep_Time),'%Y-%m-%d %H:%i');

SELECT departure,Duration,DATE_ADD(departure,INTERVAL Duration MINUTE)
FROM flights;

SELECT departure,Duration,DATE_ADD(departure,INTERVAL Duration MINUTE) FROM flights;

ALTER TABLE flights ADD COLUMN arival DATETIME;

UPDATE flights SET arival= DATE_ADD(departure,INTERVAL Duration MINUTE);

-- ---------------------------------------------Now solve the question -----------------------------------------------------
SELECT TIME(arival) FROM flights;

--  Calculate the arrival date for all the flights
SELECT DATE(arival) FROM flights;

--  ----------------------------Find the number of flights which travel on multiple dates.------------------------------
SELECT COUNT(*) FROM flights 
WHERE DATE(departure) != DATE(arival);

-- -------Calculate the average duration of flights between all city pairs. The answer should In xh ym format-------------
-- 
SELECT Source,Destination,TIME_FORMAT(SEC_TO_TIME(AVG(Duration)*60),'%hh:%im') FROM flights
GROUP BY Source,Destination;

--  -------------------------------Find quarter wise number of flights for each airline------------------------------------
SELECT Airline,quarter(departure),COUNT(*) FROM flights
GROUP BY Airline,quarter(departure);

-- ------------------------ Find the longest flight distance(between cities in terms of time) in India---------------------
SELECT Source,Destination,TIME_FORMAT(SEC_TO_TIME(AVG(Duration)*60),'%hh:%im')  AS  total_time
FROM flights
GROUP BY Source,Destination
ORDER BY total_time DESC;

--  --------------------Average time duration for flights that have 1 stop vs more than 1 stops-------------------------
WITH tem_table AS (SELECT *, 
CASE 
	WHEN Total_Stops ='non-stop' THEN 'non-stop'
    ELSE 'with-stop'
END AS 'temp'
FROM flights)

SELECT temp,TIME_FORMAT(SEC_TO_TIME(AVG(Duration)*60),'%kh %im') 
FROM tem_table
GROUP BY temp;

--  --------------------------Find all Air India flights in a given date range originating from Delhi----------------------
SELECT * FROM flights
WHERE Source = 'delhi'
AND DATE(departure) BETWEEN '2019-01-06' AND '2019-03-03';

 --  -------------------------------------Find the longest flight of each airline -------------------------------------------
 SELECT Airline,TIME_FORMAT(SEC_TO_TIME(MAX(Duration)*60),'%kh %im') AS max_time
 FROM flights
 GROUP BY Airline
 ORDER BY MAX(Duration) DESC;
 
 --  -----------------------------Find all the pair of cities having average time duration > 3 hours--------------------------
SELECT Source,Destination,TIME_FORMAT(SEC_TO_TIME(AVG(Duration)*60),'%kh %im') 
FROM flights
GROUP BY Source,Destination
HAVING AVG(Duration) > 180;


-- -----------------------Make a weekday vs time grid showing frequency of flights from Banglore and Delhi-----------------------
-- 
SELECT DAYNAME(departure),
SUM(CASE WHEN HOUR(departure) BETWEEN 0 AND 5 THEN 1 ELSE 0 END) AS '12AM-6AM',
SUM(CASE WHEN HOUR(departure) BETWEEN 6 AND 11 THEN 1 ELSE 0 END) AS '6AM-12PM',
SUM(CASE WHEN HOUR(departure) BETWEEN 12 AND 17 THEN 1 ELSE 0 END) AS '12PM-6PM',
SUM(CASE WHEN HOUR(departure) BETWEEN 18 AND 23 THEN 1 ELSE 0 END) AS '6PM-12AM',
COUNT(*)
FROM flights WHERE Source ='Banglore' AND Destination='Delhi'
GROUP BY DAYNAME(departure)
ORDER BY DAYOFWEEK(departure);


-- --------------------------- Make a weekday vs time grid showing avg flight price from Banglore and Delhi------------------------
SELECT DAYNAME(departure),
AVG(CASE WHEN HOUR(departure) BETWEEN 0 AND 5 THEN Price ELSE NULL END) AS '12AM-6AM',
AVG(CASE WHEN HOUR(departure) BETWEEN 6 AND 11 THEN Price ELSE NULL END) AS '6AM-12PM',
AVG(CASE WHEN HOUR(departure) BETWEEN 12 AND 17 THEN Price ELSE NULL END) AS '12PM-6PM',
AVG(CASE WHEN HOUR(departure) BETWEEN 18 AND 23 THEN Price ELSE NULL END) AS '6PM-12PM'
FROM flights
WHERE Source = 'Banglore' AND Destination = 'Delhi'
GROUP BY DAYNAME(departure)
ORDER BY DAYOFWEEK(departure);


