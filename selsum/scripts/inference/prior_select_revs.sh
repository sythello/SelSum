#!/bin/bash

set -e

export PYTHONPATH=../fairseq_lib/.:$PYTHONPATH
export MKL_THREADING_LAYER=GNU

DATA_DIR=/home/ec2-user/ytshao/dataset/AMASum/form_min_10_max_100_revs

python selsum/scripts/inference/prior_select_revs.py --data-path=$DATA_DIR \
--checkpoint-path=checkpoints/prior/checkpoint_best.pt \
--bart-dir=artifacts/bart \
--output-folder-path=artifacts/predicted_output/p_sel \
--split=test \
--ndocs=10 \
--batch-size=10


