export HADOOP_CLASSPATH=$JAVA_HOME/lib/tools.jar
rm -Rfv ./build/*
hadoop com.sun.tools.javac.Main -sourcepath source -d build source/**/*.java
jar cf  ClimateETL.jar -C build .
echo "Listing contents of JsonlStationsETL.jar"
jar tvf ClimateETL.jar
