SELECT *
FROM medicare_hospital;
-- check for null values
SELECT *
FROM medicare_hospital
WHERE Score IS NULL;

-- NUMBER OF HOSPITALS AND STATES
SELECT 
COUNT(DISTINCT `Facility Name`) AS 	Num_of_hospitals,
COUNT(DISTINCT State) AS Num_of_states
FROM medicare_hospital
WHERE Score != 'not available';

-- NUMBER OF CITIES AND COUNTIES 
SELECT 
COUNT(DISTINCT City) AS Num_of_cities,
COUNT(DISTINCT `County Name`) AS Num_of_counties 
FROM medicare_hospital
WHERE Score != 'not available';

-- HOW MANY HOSPITALS FROM EACH STATE
SELECT State, 
COUNT(DISTINCT(`Facility Name`))  AS Num_of_hosp
FROM medicare_hospital
WHERE Score != 'not available'
GROUP BY State
ORDER BY Num_of_hosp desc;

-- THE HIGHEST MSPB RATIO SCORE
SELECT MAX(Score) AS Highest_score
FROM medicare_hospital
LIMIT 1;

-- TOP 10 HOSPITALS WITH THE HIGHEST MSPB
SELECT `Facility Name`, Score
FROM medicare_hospital
ORDER BY Score DESC
LIMIT 10;

-- THE LEAST MSPB RATIO SCORE
SELECT MIN(Score) AS least_score
FROM medicare_hospital
LIMIT 1;

-- TOP 10 HOSPITALS WITH LEAST MSPB
SELECT `Facility Name`,Score
FROM medicare_hospital
ORDER BY Score ASC
LIMIT 10;

-- HOW MANY HOSPITALS HAVE A MSPB OF 1 SCORE
SELECT COUNT(DISTINCT(`Facility Name`)) AS Hosp_score_1
FROM medicare_hospital
WHERE Score = '1';

-- HOSPITALS WITH MSPB SCORE OF GREATER THAN 1
SELECT COUNT(DISTINCT(`Facility Name`)) AS Hosp_score_greater_1
FROM medicare_hospital
WHERE Score > 1;

-- HOSPITALS WITH MSPB LESS THAN 1
SELECT COUNT(DISTINCT(`Facility Name`)) AS Hosp_score_less_1
FROM medicare_hospital
WHERE Score < 1;

