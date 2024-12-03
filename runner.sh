#!/bin/bash

# Пути к вашим скриптам
SUPPLIER_SCRIPT="./data_supplier.sh"
CALCULATOR_SCRIPT="./calculator.sh"
ARCHIVER_SCRIPT="./archiver.sh"

# Интервал между запусками в секундах
INTERVAL=10  # Запуск каждые 10 секунд

# Бесконечный цикл
while true; do
    echo "Запуск скрипта поставщика данных..."
    bash $SUPPLIER_SCRIPT
    
    echo "Запуск скрипта вычислителя..."
    bash $CALCULATOR_SCRIPT
    
    echo "Запуск скрипта архиватора..."
    bash $ARCHIVER_SCRIPT

    echo "Ожидание $INTERVAL секунд..."
    sleep $INTERVAL
done
