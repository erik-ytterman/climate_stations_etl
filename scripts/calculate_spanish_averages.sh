beeline -u jdbc:hive2://localhost:10000/default -n scott -p tiger -f ./dbql/calculate_spanish_averages.hql --showHeader=false --numberFormat=###.## --silent=true --nullemptystring=false
