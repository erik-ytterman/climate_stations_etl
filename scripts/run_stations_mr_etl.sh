export GHCND_DATA=/user/cloudera/climate-2015-12-15
hadoop fs -rm -r $GHCND_DATA/outdata/stations
hadoop jar JsonlStationsETL.jar JsonlStationsETL $GHCND_DATA/jsondata/stations/ghcnd-stations.jsonl $GHCND_DATA/outdata/stations $GHCND_DATA/schemas/ghcnd-stations.avsc
