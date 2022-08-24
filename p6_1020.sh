#!/usr/bin/env bash
source ~/personal_work_troja/virt/bin/activate

SRC_READ=len_10_20/READ
SRC_REVERSE=len_10_20/REVERSE
SRC_APPEND=len_10_20/APPEND
SRC_PREPEND=len_10_20/PREPEND
 
# READ
fairseq-preprocess --source-lang src --target-lang trg \
    --trainpref $SRC_READ/train --validpref $SRC_READ/len_10_20 \
    --destdir data-bin/READ_1020 \
    --workers 20

fairseq-train \
    data-bin/READ_1020 \
    --arch perceiver_exp \
    --log-file perceiver_exp_log_READ_1020.log --tensorboard-logdir perceiver_exp_1020_READ \
    --seed 1314 --max-tokens 4096 --find-unused-parameters \
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 1.0 \
    --lr 5e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
    --dropout 0.3 --weight-decay 0.0001 \
    --criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
    --eval-bleu \
    --eval-bleu-print-samples \
    --best-checkpoint-metric bleu --maximize-best-checkpoint-metric \
    --save-dir perceiver_exp_1020_READ \
    --save-interval 100 --max-epoch 100 --patience 10
    

# REVERSE
fairseq-preprocess --source-lang src --target-lang trg \
    --trainpref $SRC_REVERSE/train --validpref $SRC_REVERSE/len_10_20 \
    --destdir data-bin/REVERSE_1020 \
    --workers 20

fairseq-train \
    data-bin/REVERSE_1020 \
    --arch perceiver_exp \
    --log-file perceiver_exp_log_REVERSE_1020.log --tensorboard-logdir perceiver_exp_1020_REVERSE \
    --seed 1314 --max-tokens 4096 --find-unused-parameters \
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 1.0 \
    --lr 5e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
    --dropout 0.3 --weight-decay 0.0001 \
    --criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
    --eval-bleu \
    --eval-bleu-print-samples \
    --best-checkpoint-metric bleu --maximize-best-checkpoint-metric \
    --save-dir perceiver_exp_1020_REVERSE \
    --save-interval 100 --max-epoch 100 --patience 10

# APPEND
fairseq-preprocess --source-lang src --target-lang trg \
    --trainpref $SRC_APPEND/train --validpref $SRC_APPEND/len_10_20 \
    --destdir data-bin/APPEND_1020 \
    --workers 20

fairseq-train \
    data-bin/APPEND_1020 \
    --arch perceiver_exp \
    --log-file perceiver_exp_log_APPEND_1020.log --tensorboard-logdir perceiver_exp_1020_APPEND \
    --seed 1314 --max-tokens 4096 --find-unused-parameters \
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 1.0 \
    --lr 5e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
    --dropout 0.3 --weight-decay 0.0001 \
    --criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
    --eval-bleu \
    --eval-bleu-print-samples \
    --best-checkpoint-metric bleu --maximize-best-checkpoint-metric \
    --save-dir perceiver_exp_1020_APPEND \
    --save-interval 100 --max-epoch 100 --patience 10

# PREPEND
fairseq-preprocess --source-lang src --target-lang trg \
    --trainpref $SRC_PREPEND/train --validpref $SRC_PREPEND/len_10_20 \
    --destdir data-bin/PREPEND_1020 \
    --workers 20

fairseq-train \
    data-bin/PREPEND_1020 \
    --arch perceiver_exp \
    --log-file perceiver_exp_log_PREPEND_1020.log --tensorboard-logdir perceiver_exp_1020_PREPEND \
    --seed 1314 --max-tokens 4096 --find-unused-parameters\
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 1.0 \
    --lr 5e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
    --dropout 0.3 --weight-decay 0.0001 \
    --criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
    --eval-bleu \
    --eval-bleu-print-samples \
    --best-checkpoint-metric bleu --maximize-best-checkpoint-metric \
    --save-dir perceiver_exp_1020_PREPEND \
    --save-interval 100 --max-epoch 100 --patience 10
