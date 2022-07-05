#!/bin/bash

export PYTHONPATH=../fairseq_lib/.:$PYTHONPATH
export CUDA_VISIBLE_DEVICES=0
export MKL_THREADING_LAYER=GNU

# python selsum/scripts/inference/gen_summs.py --data-path=artifacts/output/p_sel/ \
# --bart-dir=artifacts/bart \
# --checkpoint-path=artifacts/checkpoints/selsum.pt \
# --output-folder-path=artifacts/output/p_summs \
# --split=test \
# --batch-size=20

python selsum/scripts/inference/gen_summs.py --data-path=artifacts/predicted_output/p_sel/ \
--bart-dir=artifacts/bart \
--checkpoint-path=checkpoints/selsum/checkpoint_best.pt \
--output-folder-path=artifacts/predicted_output/p_summs \
--split=test \
--batch-size=20