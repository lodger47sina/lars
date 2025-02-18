# dstFile = $(patsubst %.c,%,$(srcFile))
TARGET=lib/libreactor.a
CXX=g++
CFLAGS= -g -O2 -Wall -fPIC 

SRC=./src
INC=-I./include
OBJS=$(addsuffix .o,$(basename $(wildcard $(SRC)/*.cpp)))

$(TARGET): $(OBJS)
	mkdir -p lib
	ar cqs $@ $^
%.o: %.cpp
	$(CXX) $(CFLAGS) -c -o $@ $< $(INC)

.PHONY: clean

clean:
	-@rm -f src/*.o $(TARGET)
