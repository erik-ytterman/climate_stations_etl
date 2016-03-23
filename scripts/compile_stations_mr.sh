export HADOOP_CLASSPATH=$JAVA_HOME/lib/tools.jar
hadoop com.sun.tools.javac.Main -d ./build -Xlint:deprecation ./source/JsonlStationsETL.java ./source/JsonlStationsETLMapper.java
jar cf  JsonlStationsETL.jar -C ./build JsonlStationsETL.class -C ./build JsonlStationsETLMapper.class
echo "Listing contents of JsonlStationsETL.jar"
jar tvf JsonlStationsETL.jar
