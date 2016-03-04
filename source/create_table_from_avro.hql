DROP TABLE IF EXISTS avro_schema;
CREATE TABLE avro_schema ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe' STORED AS AVRO TBLPROPERTIES ('avro.schema.url'='hdfs:///user/cloudera/schemas/climate-2015-12-15/ghcnd-stations.avsc');
DROP TABLE IF EXISTS climate_stations;
CREATE EXTERNAL TABLE climate_stations 
       LIKE avro_schema
       STORED AS PARQUET
       LOCATION '/user/cloudera/outdata/climate-2015-12-15/ghcnd-stations';
