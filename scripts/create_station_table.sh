beeline -u jdbc:hive2://localhost:10000/default -n scott -p tiger -f ./dbql/create_station_table.hql
beeline -u jdbc:hive2://localhost:10000/default -n scott -p tiger -f ./dbql/create_daily_table.hql
