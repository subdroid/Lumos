#!/usr/bin/env bash

# rm Baseline_Results
# rm Perceiver_deep_Results
# rm Perceiver_tiny_Results

source ~/personal_work_troja/virt/bin/activate
python3 test_stats.py 
sort Baseline_Results > tmp
mv tmp Baseline_Results 
sort Perceiver_tiny_Results > tmp
mv tmp Perceiver_tiny_Results 
sort Perceiver_deep_Results > tmp
mv tmp Perceiver_deep_Results 
