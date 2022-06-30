PROJECT_WORK_DIR=/home/ec2-user/ytshao/repos/SelSum
TASK=/home/ec2-user/ytshao/dataset/AMASum/form_min_10_max_100_revs

ENCODER_PATH=$PROJECT_WORK_DIR/artifacts/bart/encoder.json
VOCAB_BPE=$PROJECT_WORK_DIR/artifacts/bart/vocab.bpe
DICT_PATH=$PROJECT_WORK_DIR/artifacts/bart/dict.txt

for SPLIT in train valid test
do
  for LANG in source target
    do
       python -m examples.roberta.multiprocessing_bpe_encoder \
       --encoder-json $ENCODER_PATH \
       --vocab-bpe $VOCAB_BPE \
       --inputs "$TASK/$SPLIT.$LANG" \
       --outputs "$TASK/$SPLIT.bpe.$LANG" \
       --workers 60 \
       --keep-empty;
  done
done

echo "-- BPE encoding done --"

fairseq-preprocess \
  --source-lang "source" \
  --target-lang "target" \
  --trainpref "${TASK}/train.bpe" \
  --validpref "${TASK}/valid.bpe" \
  --testpref "${TASK}/test.bpe" \
  --destdir "${TASK}-bin/" \
  --workers 60 \
  --srcdict $DICT_PATH \
  --tgtdict $DICT_PATH;

