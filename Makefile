GEM5=/home/jung/Programming/gem5

all: loop1 loop2 aos soa

m5: 
	cd ${GEM5}/utils/m5 && scons . && cd -

aos: AOS.c
	gcc -O0 AOS.c -o AOS -I${GEM5}/include -L${GEM5}/util/m5/build/arm64/out -l m5

soa: SOA.c
	gcc -O0 SOA.c -o SOA -I${GEM5}/include -L${GEM5}/util/m5/build/arm64/out -l m5

loop1: Loop1.c
	gcc -O0 Loop1.c -o Loop1 -I${GEM5}/include -L${GEM5}/util/m5/build/arm64/out -l m5

loop2: Loop2.c
	gcc -O0 Loop2.c -o Loop2 -I${GEM5}/include -L${GEM5}/util/m5/build/arm64/out -l m5

asm: Loop.c
	gcc -O0 Loop.c -fverbose-asm -S -I${GEM5}/include -L${GEM5}/util/m5/build/arm64/out -l m5

clean:
	rm -f Loop1.s
	rm -f Loop1
	rm -f SOA.s
	rm -f SOA
	rm -f AOS.s
	rm -f AOS
