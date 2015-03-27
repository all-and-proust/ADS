CC = gcc

VPATH = AdsLib
LIBS = -lpthread -lc++

all: AdsLibTest.bin

.cpp.o:
	$(CC) -c -g -std=c++11 $< -o $@ -I AdsLib/

AdsLib.a: AdsLib.o AmsConnection.o AmsRouter.o Log.o Sockets.o Frame.o
	ar rvs $@ $?

AdsLibTest.bin: AdsLib.a
	$(CC) AdsLibTest/main.cpp $< -I AdsLib/ -I ../ -std=c++11 $(LIBS) -o $@
	
test: AdsLibTest.bin
	./$<

clean:
	rm -f *.a *.o *.bin
