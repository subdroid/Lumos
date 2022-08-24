#!/usr/bin/env bash
source ~/personal_work_troja/virt/bin/activate

root_fold=`dirname $PWD`

#1020
# READ
MODEL_DIR=$root_fold/Perceiver_tiny_Results/perceiver_tiny_3040_READ
DATA=data-bin/READ_1020
cat len_10_20/READ/len_10_20.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_read1020_1020
cat len_10_20/READ/len_20_30.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_read2030_1020
cat len_10_20/READ/len_30_40.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_read3040_1020
# REVERSE
MODEL_DIR=$root_fold/Perceiver_tiny_Results/perceiver_tiny_1020_REVERSE
DATA=data-bin/REVERSE_1020
cat len_10_20/REVERSE/len_10_20.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_reverse1020_1020
cat len_10_20/REVERSE/len_20_30.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_reverse2030_1020
cat len_10_20/REVERSE/len_30_40.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_reverse3040_1020
# APPEND
MODEL_DIR=$root_fold/Perceiver_tiny_Results/perceiver_tiny_1020_APPEND
DATA=data-bin/APPEND_1020
cat len_10_20/APPEND/len_10_20.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_append1020_1020
cat len_10_20/APPEND/len_20_30.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_append2030_1020
cat len_10_20/APPEND/len_30_40.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_append3040_1020
# PREPEND
MODEL_DIR=$root_fold/Perceiver_tiny_Results/perceiver_tiny_1020_PREPEND
DATA=data-bin/PREPEND_1020
cat len_10_20/PREPEND/len_10_20.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_prepend1020_1020
cat len_10_20/PREPEND/len_20_30.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_prepend2030_1020
cat len_10_20/PREPEND/len_30_40.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_prepend3040_1020

#2030
# READ
MODEL_DIR=$root_fold/Perceiver_tiny_Results/perceiver_tiny_2030_READ
DATA=data-bin/READ_2030
cat len_20_30/READ/len_10_20.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_read1020_2030
cat len_20_30/READ/len_20_30.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_read2030_2030
cat len_20_30/READ/len_30_40.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_read3040_2030
# REVERSE
MODEL_DIR=$root_fold/Perceiver_tiny_Results/perceiver_tiny_2030_REVERSE
DATA=data-bin/REVERSE_2030
cat len_20_30/REVERSE/len_10_20.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_reverse1020_2030
cat len_20_30/REVERSE/len_20_30.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_reverse2030_2030
cat len_20_30/REVERSE/len_30_40.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_reverse3040_2030
# APPEND
MODEL_DIR=$root_fold/Perceiver_tiny_Results/perceiver_tiny_2030_APPEND
DATA=data-bin/APPEND_2030
cat len_20_30/APPEND/len_10_20.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_append1020_2030
cat len_20_30/APPEND/len_20_30.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_append2030_2030
cat len_20_30/APPEND/len_30_40.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_append3040_2030
# PREPEND
MODEL_DIR=$root_fold/Perceiver_tiny_Results/perceiver_tiny_2030_PREPEND
DATA=data-bin/PREPEND_2030
cat len_20_30/PREPEND/len_10_20.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_prepend1020_2030
cat len_20_30/PREPEND/len_20_30.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_prepend2030_2030
cat len_20_30/PREPEND/len_30_40.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_prepend3040_2030

#3040
# READ
MODEL_DIR=$root_fold/Perceiver_tiny_Results/perceiver_tiny_3040_READ
DATA=data-bin/READ_3040
cat len_30_40/READ/len_10_20.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_read1020_3040
cat len_30_40/READ/len_20_30.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_read2030_3040
cat len_30_40/READ/len_30_40.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_read3040_3040
# REVERSE
MODEL_DIR=$root_fold/Perceiver_tiny_Results/perceiver_tiny_3040_REVERSE
DATA=data-bin/REVERSE_3040
cat len_30_40/REVERSE/len_10_20.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_reverse1020_3040
cat len_30_40/REVERSE/len_20_30.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_reverse2030_3040
cat len_30_40/REVERSE/len_30_40.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_reverse3040_3040
# APPEND
MODEL_DIR=$root_fold/Perceiver_tiny_Results/perceiver_tiny_3040_APPEND
DATA=data-bin/APPEND_3040
cat len_30_40/APPEND/len_10_20.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_append1020_3040
cat len_30_40/APPEND/len_20_30.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_append2030_3040
cat len_30_40/APPEND/len_30_40.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_append3040_3040
# PREPEND
MODEL_DIR=$root_fold/Perceiver_tiny_Results/perceiver_tiny_3040_PREPEND
DATA=data-bin/PREPEND_3040
cat len_30_40/PREPEND/len_10_20.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_prepend1020_3040
cat len_30_40/PREPEND/len_20_30.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_prepend2030_3040
cat len_30_40/PREPEND/len_30_40.src | python ./fairseq/fairseq_cli/interactive.py $DATA --path $MODEL_DIR/checkpoint_best.pt | tee perceiver_tiny_prepend3040_3040

