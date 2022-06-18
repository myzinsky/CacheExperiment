GEM5=/home/jung/Programming/gem5

all: loop

m5: 
	cd ${GEM5}/utils/m5 && scons . && cd -

loop: Loop.c
	gcc Loop.c -O0 -o Loop -I${GEM5}/include -L${GEM5}/util/m5/build/arm64/out -l m5
