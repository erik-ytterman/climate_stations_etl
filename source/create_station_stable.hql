CREATE EXTERNAL TABLE climate_stations (
       id        STRING, 
       latitude  FLOAT, 
       longitude FLOAT,
       elevation FLOAT,
       name      STRING )
       ROW FORMAT SERDE 'parquet.hive.serde.ParquetHiveSerDe'
       STORED AS
       INPUTFORMAT 'parquet.hive.DeprecatedParquetInputFormat'
       OUTPUTFORMAT 'parquet.hive.DeprecatedParquetOutputFormat'
       LOCATION '/user/cloudera/outdata/climate-2015-12-15/ghcnd-stations';
