#!/usr/bin/env bash

qsub -cwd -q 'gpu*' -l gpu=4,gpu_ram=4G  ./p1_1020.sh 
qsub -cwd -q 'gpu*' -l gpu=4,gpu_ram=4G  ./p1_2030.sh 
qsub -cwd -q 'gpu*' -l gpu=4,gpu_ram=4G  ./p1_3040.sh 
 