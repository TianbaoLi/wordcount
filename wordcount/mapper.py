#!/usr/bin/python
import sys
wordcount={}
for line in sys.stdin:
	line=line.strip();
	words=line.split()
	for word in words:
		print '%s\t%s' % (word,1)
# cat batchdata  | python mapper.py | python reducer.py 