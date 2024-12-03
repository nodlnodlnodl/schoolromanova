#!/bin/bash

DATA_FILE="data.txt"
NUM_ROWS=5
NUM_COLUMNS=3

generate_data() {
  for ((i=0; i<$NUM_ROWS; i++)); do
    row=""
    for ((j=0; j<$NUM_COLUMNS; j++)); do
      value=$(awk -v seed="$RANDOM" 'BEGIN{srand(seed); print rand() * 10}')
      row="$row $value"
    done
    echo $row >> $DATA_FILE
  done
}

# Очистка файла данных и генерация новых данных
> $DATA_FILE
generate_data
echo "Данные сгенерированы и сохранены в $DATA_FILE"
