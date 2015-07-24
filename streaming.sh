#!/bin/bash
HADOOP_HOME=/usr/local/hadoop-2.4.1
INPUT_PATH=/input/batchdata
OUTPUT_PATH=/output
echo "Input path: $INPUT_PATH"
echo "Output path: $OUTPUT_PATH"
 
$HADOOP_HOME/bin/hadoop fs -rm r /input
$HADOOP_HOME/bin/hadoop fs -rm r /output

$HADOOP_HOME/bin/hadoop fs -mkdir /input
$HADOOP_HOME/bin/hadoop fs -put batchdata /input

${HADOOP_HOME}/bin/hadoop jar\
   ${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-streaming-2.4.1.jar\
  -files mapper.py,reducer.py\
  -input $INPUT_PATH\
  -output $OUTPUT_PATH\
  -mapper "python mapper.py"\
  -reducer "python reducer.py"