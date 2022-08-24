#!/usr/bin/env bash

qsub -cwd -q 'gpu*' -l gpu=4,gpu_ram=4G  ./trans_1020.sh 
qsub -cwd -q 'gpu*' -l gpu=4,gpu_ram=4G  ./trans_2030.sh 
qsub -cwd -q 'gpu*' -l gpu=4,gpu_ram=4G  ./trans_3040.sh 
