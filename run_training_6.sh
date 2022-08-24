#!/usr/bin/env bash

# ./p6_1020.sh 

qsub -cwd -q 'gpu*' -l gpu=2,gpu_ram=2G  ./p6_1020.sh 
qsub -cwd -q 'gpu*' -l gpu=2,gpu_ram=2G  ./p6_2030.sh 
qsub -cwd -q 'gpu*' -l gpu=2,gpu_ram=2G  ./p6_3040.sh 
 