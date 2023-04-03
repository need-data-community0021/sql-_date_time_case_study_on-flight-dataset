# SQL Date Time Case Study on Flights Dataset in MySQL
This project is a case study on a flights dataset using MySQL to explore and analyze the data using date and time functions and get some outcome [here](https://view.officeapps.live.com/op/view.aspx?src=https%3A%2F%2Fraw.githubusercontent.com%2FRohitVerma0021%2FSql_date_time_case_study_on_flight_dataset%2Fmain%2FCase%2520Study%2520Outcomes.docx&wdOrigin=BROWSELINK)..

<img src="https://www.globaltechsourcing.com/wp-content/uploads/2020/05/iStock-482076715-1536x1034.jpg" height="400" width="500" >


## Dataset
The flights dataset used in this project contains data on flights with around 10030, including information such as flight date, origin and destination airports, departure and arrival times, and various other flight details. The dataset can be found at [Flight data](https://github.com/RohitVerma0021/Sql_date_time_case_study_on_flight_dataset/blob/main/cleand_laptop_data.csv)

## SQL Queries
***Several SQL queries were used to analyze the flights dataset in MySQL, including:***
#### Query 1: ```
              AVG(CASE WHEN HOUR(departure) BETWEEN 0 AND 5 THEN Price ELSE NULL END) AS '12AM-6AM',
              AVG(CASE WHEN HOUR(departure) BETWEEN 6 AND 11 THEN Price ELSE NULL END) AS '6AM-12PM',
              AVG(CASE WHEN HOUR(departure) BETWEEN 12 AND 17 THEN Price ELSE NULL END) AS '12PM-6PM',
              AVG(CASE WHEN HOUR(departure) BETWEEN 18 AND 23 THEN Price ELSE NULL END) AS '6PM-12PM'
              FROM flights
              WHERE Source = 'Banglore' AND Destination = 'Delhi'
              GROUP BY DAYNAME(departure)
              ORDER BY DAYOFWEEK(departure) ```
#### Query Explanation: 
- This is an SQL query that calculates the **`average`** price of flights departing from **'Banglore'** and arriving at **'Delhi'**, **`grouped`** by the day of the week and time of day. It uses **`CASE`** statements to check the hour component of the **`departure`** time and calculate the **`average`** price of flights that fall into each time range. The query then groups the data by day of the week and sorts it in **`ascending order`**.
#### Query 2: ```
                SELECT DAYNAME(departure),
                SUM(CASE WHEN HOUR(departure) BETWEEN 0 AND 5 THEN 1 ELSE 0 END) AS '12AM-6AM',
                SUM(CASE WHEN HOUR(departure) BETWEEN 6 AND 11 THEN 1 ELSE 0 END) AS '6AM-12PM',
                SUM(CASE WHEN HOUR(departure) BETWEEN 12 AND 17 THEN 1 ELSE 0 END) AS '12PM-6PM',
                SUM(CASE WHEN HOUR(departure) BETWEEN 18 AND 23 THEN 1 ELSE 0 END) AS '6PM-12AM',
                COUNT(*)
                FROM flights WHERE Source ='Banglore' AND Destination='Delhi'
                GROUP BY DAYNAME(departure)
                ORDER BY DAYOFWEEK(departure);```
#### Query Explanation: 
- This is an SQL query that counts the number of flights departing from 'Banglore' and arriving at 'Delhi', grouped by the day of the week and time of day. It uses **`CASE`** statements to check the hour component of the **`departure`** time and count the number of flights that fall into each time range. The query also includes a **`COUNT(*)`** statement to count the total number of flights for each day of the week. The query then groups the data by day of the week and sorts it in ascending order.
## Date and Time Functions Used
To analyze the flights data, several date and time functions were used in MySQL, including:

- [MONTH()](https://dev.mysql.com/doc/heatwave/en/mys-hw-date-functions.html): to extract the month from a date
- [YEAR()](https://dev.mysql.com/doc/heatwave/en/mys-hw-date-functions.html): to extract the year from a date
- [DATE_FORMAT()](https://dev.mysql.com/doc/heatwave/en/mys-hw-date-functions.html): to format a date or time value
- [TIMESTAMPDIFF()](https://dev.mysql.com/doc/heatwave/en/mys-hw-date-functions.html): to calculate the difference between two timestamps
- [DATE_ADD()](https://dev.mysql.com/doc/heatwave/en/mys-hw-date-functions.html): to add or subtract a specific amount of time from a date or time value

## Results
The results of the SQL queries and analysis can be found in [Case study outcome](https://view.officeapps.live.com/op/view.aspx?src=https%3A%2F%2Fraw.githubusercontent.com%2FRohitVerma0021%2FSql_date_time_case_study_on_flight_dataset%2Fmain%2FCase%2520Study%2520Outcomes.docx&wdOrigin=BROWSELINK).



## Requirements
To run the SQL queries and analysis on the flights dataset in MySQL, the following software and tools are required:

- [MySQL server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
- [MySQL client](https://dev.mysql.com/downloads/workbench/), such as [MySQL Workbench](https://dev.mysql.com/downloads/windows/installer/8.0.html) or the MySQL command-line client.


## Usage
To use this project, follow these steps:
1. Download the flights dataset from [Flight data](https://github.com/RohitVerma0021/Sql_date_time_case_study_on_flight_dataset/blob/main/cleand_laptop_data.csv) and save it to your computer.
2. Open MySQL Workbench or the MySQL command-line client.
3. Create a new database and import the flights dataset into a new table.
4. Copy and paste the SQL queries from [Sql_date_time_case_study_on_flight](https://github.com/RohitVerma0021/Sql_date_time_case_study_on_flight_dataset/blob/main/Sql_date_time_case_study_on_flight_dataset.sql) into MySQL Workbench or the MySQL command-line client.
5. Connect to the flights dataset in **MySQL**.
6. Run the SQL queries to analyze the flights data.



## Credits
The flights dataset used in this project was obtained from [Flight](https://github.com/RohitVerma0021/Sql_date_time_case_study_on_flight_dataset/blob/main/flights_cleaned%20-%20flights_cleaned.csv), and the SQL queries and analysis were performed by ***Me [Rohit Verma](https://www.linkedin.com/in/rohit-verma-3094b8224/)***.





