#!/bin/bash

DATA_FILE="data.txt"
LOG_FILE="log.txt"
CONTROL_FILE="control.txt"

calculate() {
  while IFS= read -r line; do
    values=($line)
    sum=0
    for val in "${values[@]}"; do
      sum=$(echo "$sum + $val^2" | bc)
    done
    avg=$(echo "scale=5; sqrt($sum / ${#values[@]})" | bc)
    datetime=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$datetime $avg" >> $LOG_FILE
  done < $DATA_FILE
}

# Вычисляем значения
calculate
> $CONTROL_FILE
echo "Результаты вычислений сохранены в $LOG_FILE"
