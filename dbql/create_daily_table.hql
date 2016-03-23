DROP TABLE IF EXISTS climate_daily;
CREATE EXTERNAL TABLE climate_daily (
       id        STRING, 
       year  	 INT, 
       month 	 INT,
       day 	 INT,
       value     FLOAT )
       STORED AS PARQUET
       LOCATION '/user/cloudera/climate-2015-12-15/outdata/daily';
