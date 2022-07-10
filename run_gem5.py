#!/bin/python
import os

GEM5="/home/jung/Programming/gem5"
#binary="AOS";
#binary="SOA";
binary="Loop1";
#binary="Loop2";

# Simulationskonfiguration:

command =  GEM5+"/build/ARM/gem5.opt "
command += GEM5+"/configs/example/se.py "
command += "--cpu-type=ArmTimingSimpleCPU "
command += "--cpu-clock=1GHz "
command += "-n 1 "
command += "--mem-type \"DDR3_1600_8x8\" "
command += "--mem-size 8192MB "
command += "--mem-channels 1 "
command += "--caches "
command += "--l2cache "
command += "--l2_size 256kB "
command += "--l1d_size 32kB "
command += "--l1i_size 32kB "
command += "--cmd="+binary

os.system(command)

termlist = [
    "simSeconds",
    "system.cpu.numCycles",
    "system.cpu.dcache.overallHits::total",
    "system.cpu.dcache.overallMisses::total",
    "system.cpu.dcache.overallMissRate::total",
    "system.cpu.dcache.overallAvgMissLatency::total",
    "system.l2.overallHits::cpu.data",
    "system.l2.overallMisses::cpu.data",
    "system.l2.overallMissRate::cpu.data",
    "system.l2.overallAvgMissLatency::cpu.data",
    "system.mem_ctrls.dram.readBursts",
    "system.mem_ctrls.dram.writeBursts",
    "system.mem_ctrls.dram.avgMemAccLat",
]

def filter(line) :
    for term in termlist:
        if term in line:
            print(line[:-1])	

print("Results:")

file = open("m5out/stats.txt", "r")
startoutput = 0

for line in file:
    if "Begin" in line:
        startoutput += 1
    if startoutput == 2 :
        filter(line)

