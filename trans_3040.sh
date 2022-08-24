#!/usr/bin/env bash
source ~/personal_work_troja/virt/bin/activate

SRC_READ=len_30_40/READ
SRC_REVERSE=len_30_40/REVERSE
SRC_APPEND=len_30_40/APPEND
SRC_PREPEND=len_30_40/PREPEND
 
# READ
fairseq-preprocess --source-lang src --target-lang trg \
    --trainpref $SRC_READ/train --validpref $SRC_READ/len_30_40 \
    --destdir data-bin/READ_3040 \
    --workers 20

fairseq-train \
    data-bin/READ_3040 \
    --arch transformer_perceiver_baseline \
    --log-file transformer_deep_log_READ_3040.log --tensorboard-logdir transformer_deep_3040_READ \
    --seed 1314 --max-tokens 4096 --find-unused-parameters \
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 1.0 \
    --lr 5e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
    --dropout 0.3 --weight-decay 0.0001 \
    --criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
    --eval-bleu \
    --eval-bleu-print-samples \
    --best-checkpoint-metric bleu --maximize-best-checkpoint-metric \
    --save-dir transformer_deep_3040_READ \
    --save-interval 100 --max-epoch 100 --patience 10
    

# REVERSE
fairseq-preprocess --source-lang src --target-lang trg \
    --trainpref $SRC_REVERSE/train --validpref $SRC_REVERSE/len_30_40 \
    --destdir data-bin/REVERSE_3040 \
    --workers 20

fairseq-train \
    data-bin/REVERSE_3040 \
    --arch transformer_perceiver_baseline \
    --log-file transformer_deep_log_REVERSE_3040.log --tensorboard-logdir transformer_deep_3040_REVERSE \
    --seed 1314 --max-tokens 4096 --find-unused-parameters \
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 1.0 \
    --lr 5e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
    --dropout 0.3 --weight-decay 0.0001 \
    --criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
    --eval-bleu \
    --eval-bleu-print-samples \
    --best-checkpoint-metric bleu --maximize-best-checkpoint-metric \
    --save-dir transformer_deep_3040_REVERSE \
    --save-interval 100 --max-epoch 100 --patience 10

# APPEND
fairseq-preprocess --source-lang src --target-lang trg \
    --trainpref $SRC_APPEND/train --validpref $SRC_APPEND/len_30_40 \
    --destdir data-bin/APPEND_3040 \
    --workers 20

fairseq-train \
    data-bin/APPEND_3040 \
    --arch transformer_perceiver_baseline \
    --log-file transformer_deep_log_APPEND_3040.log --tensorboard-logdir transformer_deep_3040_APPEND \
    --seed 1314 --max-tokens 4096 --find-unused-parameters \
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 1.0 \
    --lr 5e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
    --dropout 0.3 --weight-decay 0.0001 \
    --criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
    --eval-bleu \
    --eval-bleu-print-samples \
    --best-checkpoint-metric bleu --maximize-best-checkpoint-metric \
    --save-dir transformer_deep_3040_APPEND \
    --save-interval 100 --max-epoch 100 --patience 10

# PREPEND
fairseq-preprocess --source-lang src --target-lang trg \
    --trainpref $SRC_PREPEND/train --validpref $SRC_PREPEND/len_30_40 \
    --destdir data-bin/PREPEND_3040 \
    --workers 20

fairseq-train \
    data-bin/PREPEND_3040 \
    --arch transformer_perceiver_baseline \
    --log-file transformer_deep_log_PREPEND_3040.log --tensorboard-logdir transformer_deep_3040_PREPEND \
    --seed 1314 --max-tokens 4096 --find-unused-parameters \
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 1.0 \
    --lr 5e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
    --dropout 0.3 --weight-decay 0.0001 \
    --criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
    --eval-bleu \
    --eval-bleu-print-samples \
    --best-checkpoint-metric bleu --maximize-best-checkpoint-metric \
    --save-dir transformer_deep_3040_PREPEND \
    --save-interval 100 --max-epoch 100 --patience 10
