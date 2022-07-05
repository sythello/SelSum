#!/bin/bash

set -e

export PYTHONPATH=../fairseq_lib/.:$PYTHONPATH
export MKL_THREADING_LAYER=GNU

DATA_DIR=/home/ec2-user/ytshao/dataset/AMASum/form_min_10_max_100_revs

python selsum/scripts/inference/posterior_select_revs.py --data-path=$DATA_DIR  \
--checkpoint-path=checkpoints/selsum/checkpoint_best.pt \
--bart-dir=artifacts/bart \
--output-folder-path=artifacts/predicted_output/q_sel \
--split=train \
--ndocs=10 \
--batch-size=30

python selsum/scripts/inference/posterior_select_revs.py --data-path=$DATA_DIR  \
--checkpoint-path=checkpoints/selsum/checkpoint_best.pt \
--bart-dir=artifacts/bart \
--output-folder-path=artifacts/predicted_output/q_sel \
--split=valid \
--ndocs=10 \
--batch-size=30

python selsum/scripts/inference/posterior_select_revs.py --data-path=$DATA_DIR  \
--checkpoint-path=checkpoints/selsum/checkpoint_best.pt \
--bart-dir=artifacts/bart \
--output-folder-path=artifacts/predicted_output/q_sel \
--split=test \
--ndocs=10 \
--batch-size=30

# checkpoint-path=artifacts/provided_checkpoints/selsum.pt
# checkpoint-path=checkpoints/selsum/checkpoint_best.pt
## --split: the given value was "test" only?
