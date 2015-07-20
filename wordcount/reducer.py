#!/usr/lob/python
from operator import itemgetter
import sys
wordcount={}
for line in sys.stdin:
	line=line.strip()
	word,count=line.split()
	try:
		count=int(count)
		wordcount[word]=wordcount.get(word,0)+count
	except ValueError:
		pass
sorted_wordcount=sorted(wordcount.items(),key=itemgetter(0))
for word,count in sorted_wordcount:
	print '%s\t%s' % (word,count)