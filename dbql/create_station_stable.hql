DROP TABLE IF EXISTS climate_station;
CREATE EXTERNAL TABLE climate_station (
       id        STRING, 
       latitude  FLOAT, 
       longitude FLOAT,
       elevation FLOAT,
       name      STRING )
       STORED AS PARQUET
       LOCATION '/user/cloudera/outdata/climate-2015-12-15/stations';
