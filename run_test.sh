#!/usr/bin/env bash

qsub -cwd -q 'gpu*' -l gpu=1,gpu_ram=1G  ./test_baseline.sh 
qsub -cwd -q 'gpu*' -l gpu=1,gpu_ram=1G  ./test_perceiver_tiny.sh 
qsub -cwd -q 'gpu*' -l gpu=1,gpu_ram=1G  ./test_perceiver_deep.sh 

# ./test_perceiver_tiny.sh 