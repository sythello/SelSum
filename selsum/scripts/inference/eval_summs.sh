#!/bin/bash

## file added by ytshao

export CLASSPATH=artifacts/misc/stanford-corenlp-4.4.0/stanford-corenlp-4.4.0.jar 
export PYTHONPATH=../fairseq_lib/.:$PYTHONPATH
export MKL_THREADING_LAYER=GNU

GEN_FILE_PATH=artifacts/summs/test.verd
GOLD_FILE_PATH=/home/ec2-user/ytshao/dataset/AMASum/form_min_10_max_100_revs/eval/test.verd

# tokenization
cat "${GEN_FILE_PATH}" | java edu.stanford.nlp.process.PTBTokenizer -ioFileList -preserveLines > "${GEN_FILE_PATH}.tokenized"
cat "${GOLD_FILE_PATH}" | java edu.stanford.nlp.process.PTBTokenizer -ioFileList -preserveLines > "${GOLD_FILE_PATH}.tokenized"

# rouge evaluation
files2rouge "${GOLD_FILE_PATH}.tokenized" "${GEN_FILE_PATH}.tokenized"