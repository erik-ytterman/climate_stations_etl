hadoop fs -rm -r /user/cloudera/outdata/climate-2015-12-15
hadoop jar JsonlStationsETL.jar JsonlStationsETL /user/cloudera/jsondata/climate-2015-12-15/stations/ghcnd-stations.jsonl /user/cloudera/outdata/climate-2015-12-15/stations /user/cloudera/schemas/climate-2015-12-15/ghcnd-stations.avsc
