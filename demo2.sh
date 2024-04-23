interval=1200
TRAINING_TIMESTAMP=$(date +'%Y%m%d_%H%M%S')
TRAINING_LOG=GPU_${GPU}_SGA_${TRAINING_TIMESTAMP}
echo "$TRAINING_LOG"
mkdir ./log/$TRAINING_LOG


bash _train_trans_and_query_fixed_budget.sh  $interval 2>&1 | tee ./log/$TRAINING_LOG/log.txt
