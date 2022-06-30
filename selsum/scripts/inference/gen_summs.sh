#!/bin/bash

export PYTHONPATH=../fairseq_lib/.:$PYTHONPATH
export CUDA_VISIBLE_DEVICES=2,3
export MKL_THREADING_LAYER=GNU

python selsum/scripts/inference/gen_summs.py --data-path=artifacts/output/p_sel/ \
--bart-dir=artifacts/bart \
--checkpoint-path=artifacts/checkpoints/selsum.pt \
--output-folder-path=artifacts/output/p_summs \
--split=test \
--batch-size=20