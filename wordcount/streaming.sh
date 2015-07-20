#!/bin/bash
HADOOP_HOME=/usr/local/hadoop-2.4.1
INPUT_PATH=/home/turingmac/桌面/input
OUTPUT_PATH=/home/turingmac/桌面/output
echo "Clearing output path: $OUTPUT_PATH"
$HADOOP_HOME/bin/hadoop fs -rm -r $OUTPUT_PATH
 
${HADOOP_HOME}/bin/hadoop jar\
   ${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-streaming-2.4.1.jar\
  -files mapper.py,reducer.py\
  -input $INPUT_PATH\
  -output $OUTPUT_PATH\
  -mapper "python mapper.py"\
  -reducer "python reducer.py"