hadoop fs -rm -r /user/cloudera/outdata/climate-2015-12-15
hadoop jar JsonlStationsETL.jar JsonlStationsETL /user/cloudera/jsondata/climate-2015-12-15/ghcnd-stations.jsonl /user/cloudera/outdata/climate-2015-12-15/ghcnd-stations /user/cloudera/schemas/climate-2015-12-15/ghcnd-stations.avsc
beeline -u jdbc:hive2://localhost:10000/default -n scott -p tiger -f ./source/create_station_stable.hql
