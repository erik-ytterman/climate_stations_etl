export GHCND_DATA=/user/cloudera/climate-2015-12-15
hadoop fs -rm -r $GHCND_DATA/outdata/stations
hadoop fs -rm -r $GHCND_DATA/outdata/daily
hadoop jar ClimateETL.jar station.JsonlStationsETL $GHCND_DATA/jsondata/stations/ghcnd-stations.jsonl $GHCND_DATA/outdata/stations $GHCND_DATA/schemas/ghcnd-stations.avsc
hadoop jar ClimateETL.jar daily.JsonlDailyETL $GHCND_DATA/jsondata/daily/ghcnd-daily.jsonl $GHCND_DATA/outdata/daily $GHCND_DATA/schemas/ghcnd-daily.avsc