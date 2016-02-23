
CC = gcc

TESTONERECOBJS1= testonerecord.o bdac.o classify.o rythmchk.o noisechk.o match.o postclas.o analbeat.o qrsfilt.o qrsdet.o
TESTONERECOBJS2= testonerecord.o bdac.o newclassify.o rythmchk.o noisechk.o newmatch.o postclas.o newanalbeat.o qrsfilt.o qrsdet.o

CLASSONERECOBJS1= classifyonerecord.o justclassify.o classify.o rythmchk.o noisechk.o match.o postclas.o analbeat.o

CLASSONERECOBJS2= classifyonerecord.o justclassify.o newclassify.o rythmchk.o noisechk.o newmatch.o postclas.o newanalbeat.o

all: testonerecordosea testonerecordNewosea classifyonerecordosea classifyonerecordNewosea

testonerecordosea : $(TESTONERECOBJS1)
	gcc  $(TESTONERECOBJS1) -o testonerecord1 -lwfdb -lm

testonerecordNewosea : $(TESTONERECOBJS2)
	gcc  $(TESTONERECOBJS2) -o testonerecord2 -lwfdb -lm

classifyonerecordosea: $(CLASSONERECOBJS1)
	gcc $(CLASSONERECOBJS1) -o classifyonerecordosea -lwfdb -lm

classifyonerecordNewosea: $(CLASSONERECOBJS2)
	gcc $(CLASSONERECOBJS2) -o classifyonerecordNewosea -lwfdb -lm

bdac.o: bdac.c bdac.h qrsdet.h
	$(CC) -c bdac.c

classify.o: classify.c qrsdet.h bdac.h match.h rythmchk.h analbeat.h \
 postclas.h
	$(CC) -c classify.c

newclassify.o: newclassify.c qrsdet.h bdac.h newmatch.h rythmchk.h newanalbeat.h \
 postclas.h
	$(CC) -c newclassify.c

rythmchk.o: rythmchk.c qrsdet.h
	$(CC) -c rythmchk.c

noisechk.o: noisechk.c qrsdet.h
	$(CC) -c noisechk.c

match.o: match.c bdac.h
	$(CC) -c match.c

newmatch.o: newmatch.c bdac.h
	$(CC) -c newmatch.c

postclas.o:	postclas.c bdac.h
	$(CC) -c postclas.c

analbeat.o:	analbeat.c bdac.h
	$(CC) -c analbeat.c

newanalbeat.o:	newanalbeat.c bdac.h
	$(CC) -c newanalbeat.c

qrsfilt.o:	qrsfilt.c qrsdet.h
	$(CC) -c qrsfilt.c

qrsdet.o:	qrsdet.c qrsdet.h
	$(CC) -c qrsdet.c

testonerecord.o : testonerecord.c qrsdet.h
	gcc  -c testonerecord.c

classifyonerecord.o : classifyonerecord.c qrsdet.h
	gcc  -c classifyonerecord.c

justclassify.o : justclassify.c
	gcc  -c justclassify.c

clean:
	rm -f *.o *~ testonerecord classifyonerecord1 classifyonerecord2
