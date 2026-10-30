CREATE DATABASE mydatabase;

USE mydatabase;

SELECT * FROM sensor_data;

-- Q1) HOW MANY READINGS HAVE BEEN TAKEN FROM EACH SITE?

SELECT site, COUNT(reading_ts) AS 'Total Readings'
FROM sensor_data
GROUP BY site
ORDER BY 'Total Readings' DESC;

-- Q2) FIND THE AVERAGE TEMPERATURE OF EACH SITE.

SELECT site, ROUND(AVG(temperature_c),2) AS 'Average Temperature'
FROM sensor_data
GROUP BY site
ORDER BY AVG(temperature_c) DESC;

-- Q3) FIND THE AVERAGE HUMIDITY OF EACH SITE.

SELECT site, ROUND(AVG(humidity_pct),2) AS 'Average Humidity'
FROM sensor_data
GROUP BY site
ORDER BY AVG(humidity_pct) DESC;

-- Q4) FIND AVERAGE BATTERY PERCENTAGE OF SENSORS AT EACH SITE.

SELECT site, ROUND(AVG(battery_pct)) AS battery_percentage
FROM sensor_data
GROUP BY site
ORDER BY battery_percentage DESC;

-- Q5) FIND MAXIMUM TEMPERATURE AND POSITION OF THE DEVICES WITH TEMPERATURE ABOVE 25 DEGREES. 

SELECT device_id, site, MAX(temperature_c) AS max_temperature, ROUND(AVG(temperature_c),3) AS avg_temperature
FROM sensor_data
WHERE temperature_c > 25
GROUP BY device_id, site
ORDER BY max_temperature DESC;

-- Q6) FIND DEVICES WITH LOWEST BATTERY PERCENTAGE.

SELECT device_id, site, ROUND(AVG(battery_pct),2) AS avg_battery, MIN(battery_pct) AS min_battery
FROM sensor_data
GROUP BY device_id, site
HAVING MIN(battery_pct) < 20
ORDER BY MIN(battery_pct) ASC;

-- Q7) COUNT DEVICES BY STATUS.

SELECT status, COUNT(DISTINCT device_id) AS device_count
FROM sensor_data
GROUP BY status
ORDER BY device_count DESC;

-- Q8) FIND SITES WITH THE MAXIMUM HUMIDITY.

SELECT site, MAX(humidity_pct) AS max_humidity, ROUND(AVG(humidity_pct),4) AS avg_humidity
FROM sensor_data
GROUP BY site
ORDER BY avg_humidity DESC;

-- Q9) FIND SITES WITH MAXIMUM TEMPERATURE.

SELECT site, MAX(temperature_c) AS max_temperature, ROUND(AVG(temperature_c),4) AS avg_temperature
FROM sensor_data
GROUP BY site
ORDER BY avg_temperature DESC;

-- Q10) ANALYZE TEMPERATURE BY HOUR OF THE DAY

SELECT HOUR(reading_ts) AS reading_hour, ROUND(AVG(temperature_c), 2) AS avg_temperature, ROUND(AVG(humidity_pct), 2) AS avg_humidity, COUNT(*) AS total_readings
FROM sensor_data
GROUP BY HOUR(reading_ts)
ORDER BY reading_hour;

