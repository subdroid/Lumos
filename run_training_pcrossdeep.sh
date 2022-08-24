#!/usr/bin/env bash

qsub -cwd -q 'gpu*' -l gpu=2,gpu_ram=2G  ./pcrossdeep_1020.sh 
qsub -cwd -q 'gpu*' -l gpu=2,gpu_ram=2G  ./pcrossdeep_2030.sh 
qsub -cwd -q 'gpu*' -l gpu=2,gpu_ram=2G  ./pcrossdeep_3040.sh 
 