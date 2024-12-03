#!/bin/bash

LOG_FILE="log.txt"
ARCHIVE_DIR="archive"
MAX_LINES=10

# Создаем директорию для архива
mkdir -p $ARCHIVE_DIR

check_and_archive() {
  if [[ $(wc -l < $LOG_FILE) -ge $MAX_LINES ]]; then
    timestamp=$(date +"%Y%m%d_%H%M%S")
    archive_file="$ARCHIVE_DIR/log_$timestamp.tar.gz"
    tar -czf $archive_file $LOG_FILE
    > $LOG_FILE
    echo "Лог-файл архивирован в $archive_file"
  else
    echo "Лимит строк ещё не достигнут."
  fi
}

# Проверка и архивирование
check_and_archive
