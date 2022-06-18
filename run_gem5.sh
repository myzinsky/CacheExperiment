#!/bin/sh

GEM5="/home/jung/Programming/gem5"

# Simulationskonfiguration:

$GEM5/build/ARM/gem5.opt $GEM5/configs/example/se.py \
--cpu-type=ArmTimingSimpleCPU                        \
--cpu-clock=1GHz                                     \
-n 1                                                 \
--mem-type "DDR3_1600_8x8"                           \
--mem-size 8192MB                                    \
--mem-channels 1                                     \
--caches                                             \
--l2cache                                            \
--l2_size 256kB                                      \
--l1d_size 32kB                                      \
--l1i_size 32kB                                      \
--cmd=Loop
#--cmd=$GEM5/tests/test-progs/hello/bin/arm/linux/hello

# Ergebnisauswertung:

cat m5out/stats.txt | grep simSeconds
echo "-----------------------------------------------------------------------"
cat m5out/stats.txt | grep system.cpu.numCycles
cat m5out/stats.txt | grep system.cpu.exec_context.thread_0.numInsts
cat m5out/stats.txt | grep system.cpu.exec_context.thread_0.numMemRefs
echo "-----------------------------------------------------------------------"
cat m5out/stats.txt | grep system.cpu.dcache.overallHits::total
cat m5out/stats.txt | grep system.cpu.dcache.overallMisses::total
cat m5out/stats.txt | grep system.cpu.dcache.writebacks::total
cat m5out/stats.txt | grep system.cpu.dcache.replacements
cat m5out/stats.txt | grep system.cpu.dcache.overallAvgMissLatency
echo "-----------------------------------------------------------------------"
cat m5out/stats.txt | grep system.cpu.numCycles
cat m5out/stats.txt | grep system.cpu.icache.overallHits::total
cat m5out/stats.txt | grep system.cpu.icache.overallMisses::total
cat m5out/stats.txt | grep system.cpu.icache.writebacks::total
cat m5out/stats.txt | grep system.cpu.icache.replacements
echo "-----------------------------------------------------------------------"
cat m5out/stats.txt | grep system.l2.overallHits::total
cat m5out/stats.txt | grep system.l2.overallMisses::total
echo "-----------------------------------------------------------------------"
cat m5out/stats.txt | grep system.mem_ctrls.dram.avgMemAccLat
