PROBLEM=translate_enzh_wmt32k
MODEL=transformer
HPARAMS=transformer_base_single_gpu
HOME=`pwd`
DATA_DIR=$HOME/t2t_data
TMP_DIR=$DATA_DIR
TRAIN_DIR=$HOME/t2t_train/$PROBLEM/$MODEL-$HPARAMS

# Decode

BEAM_SIZE=5
ALPHA=0.6
DECODE_FILE=$DATA_DIR/test.en


t2t-decoder \
  --data_dir=$DATA_DIR \
  --problem=$PROBLEM \
  --model=$MODEL \
  --hparams_set=$HPARAMS \
  --output_dir=$TRAIN_DIR \
  --decode_hparams='beam_size=$BEAM_SIZE,alpha=$ALPHA' \
  --decode_from_file=$DECODE_FILE \
  --decode_to_file=translation.zh

cat translation.zh







