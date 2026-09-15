#!/bin/bash

BAM_DIR="/media/ipppp/rnaSeq_targetNBL"
OUT_DIR="trust4_results"
LOG_DIR="logs_trust4"
METRICS_DIR="metrics_trust4"

BCRTCR="ref/bcrtcr.fa"
IMGT="ref/IMGT+C.fa"

THREADS=12

mkdir -p $OUT_DIR $LOG_DIR $METRICS_DIR

echo "sample,time_sec,ram_kb,cpu_percent,status" > metrics_trust4/summary.csv

for SAMPLE_DIR in $BAM_DIR/*; do

    SAMPLE=$(basename $SAMPLE_DIR)
    BAM=$(ls $SAMPLE_DIR/*.bam)

    SAMPLE_OUT="$OUT_DIR/$SAMPLE"
    mkdir -p $SAMPLE_OUT

    LOG_FILE="$LOG_DIR/${SAMPLE}.log"
    TIME_FILE="$METRICS_DIR/${SAMPLE}_time.txt"

    echo "Processando: $SAMPLE"

    /usr/bin/time -v -o $TIME_FILE \
    run-trust4 \
        -b $BAM \
        -f $BCRTCR \
        --ref $IMGT \
        --abnormalUnmapFlag \
        -o $SAMPLE_OUT/$SAMPLE \
        -t $THREADS \
        > $LOG_FILE 2>&1

    EXIT_CODE=$?

    # EXTRAIR MÉTRICAS
    time_sec=$(grep "Elapsed (wall clock) time" $TIME_FILE | awk '{print $8}')
    max_ram=$(grep "Maximum resident set size" $TIME_FILE | awk '{print $6}')
    cpu=$(grep "Percent of CPU this job got" $TIME_FILE | awk '{print $8}')

    if [ $EXIT_CODE -eq 0 ]; then
        status="OK"
    else
        status="FAIL"
    fi

    echo "$SAMPLE,$time_sec,$max_ram,$cpu,$status" >> metrics_trust4/summary.csv

    echo "Finalizado: $SAMPLE ($status)"
    echo "-----------------------------"

done

echo "Fim: $(date)"
