SELECT climate_daily.id AS id, 
       climate_station.name AS name, 
       climate_station.elevation AS elevation, 
       climate_station.latitude AS latitude, 
       climate_station.longitude AS longitude, 
       climate_daily.month AS month, 
       COUNT(climate_daily.id) AS samples, 
       AVG(climate_daily.value) AS average FROM climate_daily, climate_station 
       WHERE climate_daily.id LIKE 'SP%' AND climate_daily.id = climate_station.id 
       GROUP BY climate_daily.id, 
		climate_daily.month,
       	     	climate_station.name, 
		climate_station.elevation, 
		climate_station.latitude,
		climate_station.longitude;
